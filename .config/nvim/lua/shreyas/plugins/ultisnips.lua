return {
  {
    "SirVer/ultisnips",
    config = function()
      vim.g.UltiSnipsExpandTrigger = "<C-l>"
      vim.g.UltiSnipsJumpForwardTrigger = "<C-b>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<C-z>"
      vim.g.UltiSnipsEditSplit = "vertical"
      vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "lua/shreyas/snippets" }
    end,
  },
  {
    "honza/vim-snippets",
    lazy = true, -- Load only when needed (optional optimization)
    dependencies = { "SirVer/ultisnips" },
  },
}
