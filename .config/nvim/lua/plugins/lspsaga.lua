return {
	"nvimdev/lspsaga.nvim",
	version = "*",
	lazy = false,
	config = function()
		require("lspsaga").setup({})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
		"neovim/nvim-lspconfig",
	},
}
