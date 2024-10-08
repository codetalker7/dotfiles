return {
	"jpalardy/vim-slime",
	version = "*",
	lazy = false,
	config = function()
		vim.cmd([[
            let g:slime_target="tmux"
            let g:slime_paste_file=expand("$HOME/.slime_paste")
            let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"} " set the default target pane to the second pane in the current window
        ]])
	end,
}
