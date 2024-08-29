return {
	"ggandor/leap.nvim",
	version = "*",
	lazy = false,
	dependencies = {
		"tpope/vim-repeat",
	},
	config = function()
		require("leap").create_default_mappings()
	end,
}
