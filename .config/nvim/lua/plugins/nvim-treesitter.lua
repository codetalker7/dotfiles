return {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    lazy = false,
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "bibtex",
                "c",
                "cuda",
                "go",
                "html",
                "java",
                "julia",
                "lua",
                "markdown",
                "markdown_inline",
                -- "mchat",        -- for model.nvim
                "python",
                "query",
                "rust",
                "vim",
                "vimdoc",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end,
}
