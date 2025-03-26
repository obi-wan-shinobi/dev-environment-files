vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Synchronizes the system clipboar
-- with Neovim's clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.g.mapleader = " "

-- Enable spell-checking and set languages for the current buffer
vim.opt.spell = true
vim.opt.spelllang = { "en_gb" }

-- Map <C-l> to correct the previous spelling mistake
vim.api.nvim_set_keymap("i", "<C-g>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { noremap = true, silent = true })
