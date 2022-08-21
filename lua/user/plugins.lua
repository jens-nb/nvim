local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use { "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" } -- Have packer manage itself
	use { "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" } -- Useful lua functions used by lots of plugins
	use { "https://github.com/akinsho/bufferline.nvim", commit = "c4dd9b4de03b891f648b098c25e4dc1bc48a13e5" }
	use { "kyazdani42/nvim-web-devicons", commit = "2d02a56189e2bde11edd4712fea16f08a6656944" }
	use { "nvim-lualine/lualine.nvim", commit = "6d11f9f50817020cf634903a235628cabe0c56f8" }
	use { "nvim-telescope/telescope.nvim", commit = "75a5e5065376d9103fc4bafc3ae6327304cee6e9" }
	use { "folke/which-key.nvim", commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71" }
	use { "kyazdani42/nvim-tree.lua", commit = "451901ca9c4a0d97d7b7cb93276be7ed5588b3ab" }
	use { "nvim-treesitter/nvim-treesitter", commit = "0d7fab0c3323ed2e50ccdf14fd24fbbad664f7b1" }
	-- Colorschemes
	use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
	use { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" }
	use { "lunarvim/onedarker.nvim", commit = "4eaa5e8760832d23a84f8ad4e0ff012eacd2c01f" }
	use { "ellisonleao/gruvbox.nvim", commit = "29c50f1327d9d84436e484aac362d2fa6bca590b" }

	-- Cisco syntax highlighting
	use { "momota/cisco.vim", commit = "4b268e4a893768e561e20e5022a6fb69214335a1" }

	-- LSP plugins
	use { "williamboman/mason.nvim", commit = "2680ff415265665de7c88b766818e34870f522c3" }
	use { "neovim/nvim-lspconfig", commit = "446e51c3cc016640dce7b7bc7ed098c674e9ee3d" }
	use { "williamboman/mason-lspconfig.nvim", commit = "f87c5796603aa3436d9cb1d36dbe5b2e579e4034" }

	-- CMP & snippets
	-- TODO: update commit pins
	use { "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" } -- The completion plugin
	use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" } -- buffer completions
	use { "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" } -- path completions
	use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
	use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
	use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
	use { "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" } --snippet engine
	use { "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" } -- a bunch of snippets to use

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
