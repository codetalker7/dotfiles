return {
    "ayu-theme/ayu-vim",
    config = function()
        vim.cmd [[
            set termguicolors     " enable true colors support
            let ayucolor="dark"   " for dark version of theme
            colorscheme ayu
        ]]
    end,
}
