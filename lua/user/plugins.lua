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
	use { "wbthomason/packer.nvim", commit = "dac4088c70f4337c6c40d1a2751266a324765797" } -- Have packer manage itself
	use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins
	use { "akinsho/bufferline.nvim", commit = "4ecfa81e470a589e74adcde3d5bb1727dd407363" }
	use { "nvim-tree/nvim-web-devicons", commit = "05e1072f63f6c194ac6e867b567e6b437d3d4622" }
	use { "nvim-tree/nvim-tree.lua", commit = "9e4c39572f631bb60ee15cb9d46e1daa9927a45e" }
	use { "nvim-lualine/lualine.nvim", commit = "fffbcb829288c3ca366f17cdb8d46aefb5c1d6f3" }
	use { "nvim-telescope/telescope.nvim", commit = "e960efa60e97df58e089b00270f09d60f27202c8" }
	use { "folke/which-key.nvim", commit = "8682d3003595017cd8ffb4c860a07576647cc6f8" }
	use { "nvim-treesitter/nvim-treesitter", commit = "a2d7e78b0714a0dc066416100b7398d3f0941c23" }
	use { "windwp/nvim-autopairs", commit = "03580d758231956d33c8dd91e2be195106a79fa4"}
	
	-- Colorschemes
	use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
	use { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" }
	use { "lunarvim/onedarker.nvim", commit = "4eaa5e8760832d23a84f8ad4e0ff012eacd2c01f" }
	use { "ellisonleao/gruvbox.nvim", commit = "c64ec557672c9c8ecc71a438533525482021377f" }

	-- Cisco syntax highlighting
	use { "momota/cisco.vim", commit = "4b268e4a893768e561e20e5022a6fb69214335a1" }

	-- LSP plugins
	use { "williamboman/mason.nvim", commit = "6ee823248f5fc433018ee800c22eef642e375bd1" }
	use { "neovim/nvim-lspconfig", commit = "a63d2c75c6880d45209baff596939343e8a431fd" }
	use { "williamboman/mason-lspconfig.nvim", commit = "31d8ed0dd3daf6cc64e35d710a190b64080bdc86" }
	use { "folke/trouble.nvim", commit = "c4da921ba613aa6d6659dc18edc204c37e4b8833"}
	
	-- CMP & snippets
	-- TODO: update commit pins
	use { "hrsh7th/nvim-cmp", commit = "d09b0c396aaa078cdfe78316ec06940971136e85" } -- The completion plugin
	use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
	use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" } -- path completions
	use { "hrsh7th/cmp-nvim-lsp", commit = "78924d1d677b29b3d1fe429864185341724ee5a2" }
	use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
	use { "L3MON4D3/LuaSnip", commit = "5570fd797eae0790affb54ea669a150cad76db5d" } --snippet engine
	use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" } -- snippet completions
	use { "rafamadriz/friendly-snippets", commit = "1a6a02350568d6830bcfa167c72f9b6e75e454ae" } -- a bunch of snippets to use

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
