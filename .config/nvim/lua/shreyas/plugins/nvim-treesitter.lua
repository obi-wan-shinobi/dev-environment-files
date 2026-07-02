return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local function first_node(match, capture)
      local node = match[capture]
      if type(node) == "table" then
        node = node[1]
      end
      return node
    end

    local function get_parser_from_markdown_info_string(injection_alias)
      local non_filetype_match_injection_language_aliases = {
        ex = "elixir",
        pl = "perl",
        sh = "bash",
        uxn = "uxntal",
        ts = "typescript",
      }

      local match = vim.filetype.match({ filename = "a." .. injection_alias })
      return match or non_filetype_match_injection_language_aliases[injection_alias] or injection_alias
    end

    vim.treesitter.query.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
      local node = first_node(match, pred[2])
      if not node then
        return
      end

      local type_attr_value = vim.treesitter.get_node_text(node, bufnr)
      local configured = {
        importmap = "json",
        module = "javascript",
        ["application/ecmascript"] = "javascript",
        ["text/ecmascript"] = "javascript",
      }

      local parts = vim.split(type_attr_value, "/", {})
      metadata["injection.language"] = configured[type_attr_value] or parts[#parts]
    end, { force = true })

    vim.treesitter.query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
      local node = first_node(match, pred[2])
      if not node then
        return
      end

      local injection_alias = vim.treesitter.get_node_text(node, bufnr):lower()
      metadata["injection.language"] = get_parser_from_markdown_info_string(injection_alias)
    end, { force = true })

    vim.treesitter.query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
      local id = pred[2]
      local node = first_node(match, id)
      if not node then
        return
      end

      local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[id] }) or ""
      metadata[id] = metadata[id] or {}
      metadata[id].text = string.lower(text)
    end, { force = true })

    require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "rust",
        "bash",
        "go",
        "markdown",
        "markdown_inline",
      },

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        enable = true,
        disable = { "latex" }, -- Disable Tree-sitter highlighting for LaTeX
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Leader>ss",
          node_incremental = "<Leader>si",
          scope_incremental = "<Leader>sc",
          node_decremental = "<Leader>sd",
        },
      },
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            -- You can also use captures from other query groups like `locals.scm`
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true or false
          include_surrounding_whitespace = true,
        },
      },
    })
  end,
}
