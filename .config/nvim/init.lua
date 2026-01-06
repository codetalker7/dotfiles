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
-- 1. Basic Settings for Color Support
vim.opt.termguicolors = true -- Enable 24-bit RGB color
vim.opt.background = "dark"

-- 2. Clear existing highlights
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

-- 3. Define the Palette (True Black)
local colors = {
    bg = "#000000",
    fg = "#e0e0e0",       -- Soft white
    dim = "#666666",      -- Comments/Non-essential text
    accent = "#ffffff",   -- High contrast for keywords
    line = "#1a1a1a",     -- Subtle line highlights
    border = "#333333",   -- Split borders
}

-- 4. Set Highlights
local hl = vim.api.nvim_set_hl
local opts = { val = 0 } -- Helper to apply to global scope

-- Base UI
hl(0, "Normal",       { bg = colors.bg, fg = colors.fg })
hl(0, "NormalFloat",  { bg = colors.bg, fg = colors.fg }) -- Floating windows
hl(0, "FloatBorder",  { bg = colors.bg, fg = colors.border })
hl(0, "SignColumn",   { bg = colors.bg })
hl(0, "EndOfBuffer",  { bg = colors.bg, fg = colors.line }) -- Hide ~ at end of buffer
hl(0, "CursorLine",   { bg = colors.line })
hl(0, "LineNr",       { fg = colors.dim })
hl(0, "CursorLineNr", { fg = colors.accent, bold = true })
hl(0, "VertSplit",    { fg = colors.border, bg = colors.bg }) -- Split dividers
hl(0, "WinSeparator", { fg = colors.border, bg = colors.bg }) -- Modern split dividers
hl(0, "StatusLine",   { bg = colors.line, fg = colors.fg })
hl(0, "StatusLineNC", { bg = colors.bg, fg = colors.dim })    -- Inactive status line

-- Syntax Highlighting (Minimal/Monochrome approach)
hl(0, "Comment",      { fg = colors.dim, italic = true })
hl(0, "String",       { fg = "#999999" }) -- Slightly dimmer than normal text
hl(0, "Identifier",   { fg = colors.fg })
hl(0, "Function",     { fg = colors.fg, bold = true })
hl(0, "Statement",    { fg = colors.accent, bold = true }) -- Keywords like if, else, for
hl(0, "PreProc",      { fg = colors.accent })
hl(0, "Type",         { fg = colors.fg, bold = true })
hl(0, "Constant",     { fg = colors.fg })
hl(0, "Special",      { fg = colors.fg })

-- Search / Visual Mode
hl(0, "Search",       { bg = "#333333", fg = colors.accent })
hl(0, "CurSearch",    { bg = "#555555", fg = colors.accent })
hl(0, "Visual",       { bg = "#222222" })

-- Popups (Pmenu)
hl(0, "Pmenu",        { bg = "#111111", fg = colors.fg })
hl(0, "PmenuSel",     { bg = "#333333", fg = colors.accent })
