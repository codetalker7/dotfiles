" some indentation settings
set expandtab     " on pressing tab, insert spaces
set smartindent
set tabstop=4     " number of spaces to insert on tab
set shiftwidth=4  " number of spaces per indent level

" some search settings
set hlsearch      " highlight text during search
nnoremap <CR> :noh<CR><CR> " remove the search highlight

" spell check
" set spell

" line numbers; hybrid mode
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" disable arrow keys; encourage hjkl
" noremap! <Up> <Esc>
" noremap  <Down> <Nop>
" noremap! <Down> <Esc>
" noremap  <Left> <Nop>
" noremap! <Left> <Esc>
" noremap  <Right> <Nop>
" noremap! <Right> <Esc>

" enable syntax, if it isn't
syntax enable

" always copy to system clipboard
" Note: Your Vim build must support the '+clipboard' feature for this to work.
set clipboard=unnamedplus

" a minimal black theme which gemini made for me
" 1. Basic Settings
set termguicolors
set background=dark

" 2. Clear existing highlights
hi clear
if exists("syntax_on")
    syntax reset
endif

" 3 & 4. Palette & Highlights
" In Vimscript, we apply the hex codes directly using guibg/guifg/gui

" Base UI (Monochrome)
hi Normal guibg=#000000 guifg=#e0e0e0
hi SignColumn guibg=#000000
hi EndOfBuffer guibg=#000000 guifg=#1a1a1a
hi CursorLine guibg=#1a1a1a
hi LineNr guifg=#666666
hi CursorLineNr guifg=#ffffff gui=bold
hi StatusLine guibg=#1a1a1a guifg=#e0e0e0
hi StatusLineNC guibg=#000000 guifg=#666666
hi VertSplit guibg=#000000 guifg=#333333

" Syntax Highlighting (Restored to Monochrome)
hi Comment guifg=#666666 gui=italic
hi String guifg=#999999
hi Identifier guifg=#e0e0e0
hi Function guifg=#ffffff gui=bold
hi Statement guifg=#ffffff gui=bold
hi PreProc guifg=#ffffff
hi Type guifg=#ffffff gui=bold
hi Constant guifg=#e0e0e0
hi Special guifg=#e0e0e0

" Search Highlighting (THE YELLOW PART)
hi Search guibg=#FFFF00 guifg=#000000
hi CurSearch guibg=#FFFF00 guifg=#000000
hi IncSearch guibg=#FFFF00 guifg=#000000

" Visual Mode (Dark Grey to avoid confusion with yellow search)
hi Visual guibg=#333333

" Popups
hi Pmenu guibg=#111111 guifg=#e0e0e0
hi PmenuSel guibg=#333333 guifg=#ffffff
