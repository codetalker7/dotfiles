-- disable netrw at the very start of your init.lua; for nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- some indentation settings
vim.o.expandtab = true                          -- on pressing tab, insert spaces
vim.o.smartindent = true                        
vim.o.tabstop = 4                               -- number of spaces to insert on tab
vim.o.shiftwidth = 4                            -- number of spaces per indent level

-- some search settings
vim.o.hlsearch = true                           -- highlight text during search
vim.keymap.set('n', 'CR', ':noh<CR><CR>')       -- remove the search highlight; see :help noh

-- line numbers
vim.o.nu = true

-- enable syntax, if it isn't
vim.cmd('syntax enable')

-- always copy to system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- for obsidian conceal level
vim.opt.conceallevel = 1

-- lazy plugins
require("config.lazy")

-- gen prompts
require("gen_prompts")
