return {
    "nvim-telescope/telescope.nvim", tag = '0.1.8',
-- or                              , branch = '0.1.x',
    version = "*",
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- vim.api.nvim_set_keymap("", "T", ":Telescope")
        vim.api.nvim_set_keymap("", "T", ":Telescope<CR>", { noremap = true })
    end,
}
