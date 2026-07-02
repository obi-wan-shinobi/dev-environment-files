return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" }, -- , "nvim-telescope/telescope-fzf-native.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    -- -- basic telescope configuration
    -- local conf = require("telescope.config").values
    -- local function toggle_telescope(harpoon_files)
    --   local function get_paths()
    --     local file_paths = {}
    --     for _, item in ipairs(harpoon_files.items) do
    --       table.insert(file_paths, item.value)
    --     end
    --     return file_paths
    --   end
    --
    --   require("telescope.pickers")
    --     .new({}, {
    --       prompt_title = "Harpoon",
    --       finder = require("telescope.finders").new_table({
    --         results = get_paths(),
    --       }),
    --       previewer = conf.file_previewer({}),
    --       sorter = conf.generic_sorter({}),
    --
    --       attach_mappings = function(prompt_bufnr, map)
    --         local function delete_item()
    --           local state = require("telescope.actions.state")
    --           local selected_entry = state.get_selected_entry()
    --
    --           if selected_entry then
    --             harpoon:list():remove_at(selected_entry.index)
    --
    --             state
    --               .get_current_picker(prompt_bufnr)
    --               :refresh(require("telescope.finders").new_table({ results = get_paths() }), {})
    --           end
    --         end
    --         map("n", "dd", delete_item) -- Bind Alt+d in normal mode
    --         return true
    --       end,
    --     })
    --     :find()
    -- end

    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
      -- toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end)
    --vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    --vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
    --vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
    --vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>p", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<leader>n", function()
      harpoon:list():next()
    end)
  end,
}
