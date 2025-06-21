-- disable netrw at the very start of your init.lua; for nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- some indentation settings
vim.o.expandtab = true -- on pressing tab, insert spaces
vim.o.smartindent = true
vim.o.tabstop = 4 -- number of spaces to insert on tab
vim.o.shiftwidth = 4 -- number of spaces per indent level

-- some search settings
vim.o.hlsearch = true -- highlight text during search
vim.keymap.set("n", "CR", ":noh<CR><CR>") -- remove the search highlight; see :help noh

-- spell check
vim.o.spell = true

-- line numbers; hybrid mode. See https://jeffkreeftmeijer.com/vim-number/
vim.o.nu = true
vim.cmd([[
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
]])

-- -- disable arrow keys; encourage hjkl
-- vim.cmd([[
--      noremap! <Up> <Esc>
--      noremap  <Down> ""
--      noremap! <Down> <Esc>
--      noremap  <Left> ""
--      noremap! <Left> <Esc>
--      noremap  <Right> ""
--      noremap! <Right> <Esc>
-- ]])

-- enable syntax, if it isn't
vim.cmd("syntax enable")

-- always copy to system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- for obsidian conceal level
vim.opt.conceallevel = 1

-- lazy plugins
require("config.lazy")

-- gen prompts
-- require("gen_prompts")
