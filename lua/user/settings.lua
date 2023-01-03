-- Settings File for my NeoVim configuration

-- File Options
vim.opt.fileencoding = "utf-8"

-- Editor UI options
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.numberwidth = 2
vim.opt.termguicolors = true
vim.opt.conceallevel = 2
vim.opt.completeopt = { "menu",  "menuone", "noselect" } -- mostly just for cmp


-- Text options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

-- Misc
vim.opt.timeoutlen = 500
vim.opt.mouse = "a"
vim.opt.updatetime = 300
