return {
	"akinsho/bufferline.nvim",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({})
	end,
}
