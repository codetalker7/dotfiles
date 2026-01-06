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

-- a minimal black theme which gemini made for me
-- 1. Basic Settings
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- 2. Clear existing highlights
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

-- 3. Define the Palette
local colors = {
	bg = "#000000",
	fg = "#e0e0e0", -- Standard text (Soft White)
	dim = "#666666", -- Comments
	bright = "#ffffff", -- Keywords (Pure White)
	search = "#FFFF00", -- BRIGHT YELLOW for search matches
	line = "#1a1a1a",
	border = "#333333",
}

-- 4. Set Highlights
local hl = vim.api.nvim_set_hl

-- Base UI (Monochrome)
hl(0, "Normal", { bg = colors.bg, fg = colors.fg })
hl(0, "NormalFloat", { bg = colors.bg, fg = colors.fg })
hl(0, "FloatBorder", { bg = colors.bg, fg = colors.border })
hl(0, "SignColumn", { bg = colors.bg })
hl(0, "EndOfBuffer", { bg = colors.bg, fg = colors.line })
hl(0, "CursorLine", { bg = colors.line })
hl(0, "LineNr", { fg = colors.dim })
hl(0, "CursorLineNr", { fg = colors.bright, bold = true })
hl(0, "StatusLine", { bg = colors.line, fg = colors.fg })
hl(0, "StatusLineNC", { bg = colors.bg, fg = colors.dim })
hl(0, "VertSplit", { fg = colors.border, bg = colors.bg })
hl(0, "WinSeparator", { fg = colors.border, bg = colors.bg })

-- Syntax Highlighting (Restored to Monochrome)
hl(0, "Comment", { fg = colors.dim, italic = true })
hl(0, "String", { fg = "#999999" })
hl(0, "Identifier", { fg = colors.fg })
hl(0, "Function", { fg = colors.bright, bold = true })
hl(0, "Statement", { fg = colors.bright, bold = true }) -- if, else, etc. (White)
hl(0, "PreProc", { fg = colors.bright })
hl(0, "Type", { fg = colors.bright, bold = true })
hl(0, "Constant", { fg = colors.fg })
hl(0, "Special", { fg = colors.fg })

-- Search Highlighting (THE YELLOW PART)
-- 'Search' is for all matches, 'CurSearch' is the one under your cursor
hl(0, "Search", { bg = colors.search, fg = "#000000" })
hl(0, "CurSearch", { bg = colors.search, fg = "#000000" })
hl(0, "IncSearch", { bg = colors.search, fg = "#000000" })

-- Visual Mode (Dark Grey to avoid confusion with yellow search)
hl(0, "Visual", { bg = "#333333" })

-- Popups
hl(0, "Pmenu", { bg = "#111111", fg = colors.fg })
hl(0, "PmenuSel", { bg = "#333333", fg = colors.bright })
