-- Keymaps for my personal Neovim configuration
--
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " " 

-- Normal Mode
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>s", ":so %<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts) 
keymap("n", "<S-h>", ":bprevious<CR>", opts) 

-- Split windows vertically and horizontally
keymap("n", "<leader>wsv", ":vsplit<CR>", opts)
keymap("n", "<leader>wsh", ":split<CR>", opts)
