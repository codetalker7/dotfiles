return {
	"martineausimon/nvim-lilypond-suite",
	config = function()
		require("nvls").setup({
			-- edit config here (see "Customize default settings" in wiki)
			lilypond = {
				options = {
					pdf_viewer = "zathura",
				},
			},
		})
	end,
}
