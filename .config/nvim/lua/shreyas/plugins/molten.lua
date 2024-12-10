return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20

      -- vim.g.molten_cover_empty_lines = true
      -- vim.g.molten_comment_string = "# %%"
      vim.keymap.set({ "v", "n" }, "<leader><leader>R", "<Cmd>MoltenEvaluateVisual<CR>")

      -- vim.g.molten_auto_image_popup = true
      -- vim.g.molten_show_mimetype_debug = true
      vim.g.molten_auto_open_output = false
      vim.g.molten_image_location = "float"
      vim.g.molten_image_provider = "image.nvim"
      -- vim.g.molten_output_show_more = true
      vim.g.molten_output_win_border = { "", "━", "", "" }
      vim.g.molten_output_win_max_height = 12
      -- vim.g.molten_output_virt_lines = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_use_border_highlights = true
      vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_wrap_output = true
      vim.g.molten_tick_rate = 142

      vim.keymap.set("n", "<localleader>ir", function()
        vim.cmd("MoltenInit rust")
      end, { desc = "Initialize Molten for Rust", silent = true })
      vim.keymap.set("n", "<localleader>ip", function()
        local venv = os.getenv("VIRTUAL_ENV")
        if venv ~= nil then
          -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
          venv = string.match(venv, "/.+/(.+)")
          vim.cmd(("MoltenInit %s"):format(venv))
        else
          vim.cmd("MoltenInit python3")
        end
      end, { desc = "Initialize Molten for python3", silent = true, noremap = true })
      vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
      vim.keymap.set(
        "n",
        "<localleader>e",
        ":MoltenEvaluateOperator<CR>",
        { silent = true, desc = "run operator selection" }
      )
      vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
      vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
      vim.keymap.set(
        "v",
        "<localleader>r",
        ":<C-u>MoltenEvaluateVisual<CR>gv",
        { silent = true, desc = "evaluate visual selection" }
      )
      vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
      vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
      vim.keymap.set(
        "n",
        "<localleader>os",
        ":noautocmd MoltenEnterOutput<CR>",
        { silent = true, desc = "show/enter output" }
      )
    end,
  },
  {
    -- see the image.nvim readme for more information about configuring this plugin
    "3rd/image.nvim",
    opts = {
      backend = "kitty", -- whatever backend you would like to use
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
}
