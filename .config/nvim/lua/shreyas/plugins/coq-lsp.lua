return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "whonore/Coqtail",
    "tomtomjhj/coq-lsp.nvim",
  },
  opts = {
    loaded_coqtail = 1,
    coqtail = 0,
  },
  config = function()
    require("coq-lsp").setup({
      -- The configuration for coq-lsp.nvim.
      -- The following is the default configuration.
      coq_lsp_nvim = {
        -- to be added
      },

      -- The configuration forwarded to `:help lspconfig-setup`.
      -- The following is an example.
      lsp = {
        on_attach = function(client, bufnr)
          -- your mappings, etc
        end,
        -- coq-lsp server initialization configurations, defined here:
        -- https://github.com/ejgallego/coq-lsp/blob/main/editor/code/src/config.ts#L3
        -- Documentations are at https://github.com/ejgallego/coq-lsp/blob/main/editor/code/package.json.
        init_options = {
          show_notices_as_diagnostics = true,
        },
        autostart = true, -- use this if you want to manually launch coq-lsp with :LspStart.
      },
    })
  end,
}
