return {
  "rebelot/kanagawa.nvim",
  config = function()
    vim.cmd.colorscheme("kanagawa-wave")

    local colors = require("kanagawa.colors").setup()
    vim.g.theme_colors = colors
  end,
}
