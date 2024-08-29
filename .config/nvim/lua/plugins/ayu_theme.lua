return {
	"ayu-theme/ayu-vim",
	version = "*",
	lazy = false,
	config = function()
		vim.cmd([[
            set termguicolors     " enable true colors support
            let ayucolor="dark"   " for dark version of theme
            colorscheme ayu
            highlight Normal guibg=black
        ]])
	end,
}
