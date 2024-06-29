return {
    "preservim/vim-markdown",
    version = "*",
    lazy = false,
    config = function ()
        vim.cmd [[
            let g:vim_markdown_math = 1
            let g:vim_markdown_folding_disabled = 1
        ]]
    end,
}
