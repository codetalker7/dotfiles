" Force Vim to use bash for executing background system commands.
" This prevents syntax failures when executing system() calls.
set shell=/bin/bash
set mouse=a

" some indentation settings
set expandtab     " on pressing tab, insert spaces
set smartindent
set tabstop=4     " number of spaces to insert on tab
set shiftwidth=4  " number of spaces per indent level

" some search settings
set hlsearch      " highlight text during search
set incsearch     " high as you type
nnoremap <CR> :noh<CR><CR> " remove the search highlight

" tab-autocompletions using pure vim and no plugins
" Set a secondary completion key specifically for mappings (Ctrl-Z is standard)
set wildcharm=<C-z>

" Optional but highly recommended: gives you a nice horizontal menu for command completions
set wildmenu 

" 1. Map <Tab> to open command-line window and trigger auto-complete for / and ?
" For standard commands (:), trigger the native completion using the wildcharm
cnoremap <expr> <Tab> getcmdtype() =~ '[/?]' ? "\<C-f>a\<C-n>" : "\<C-z>"

" 2. Control behavior inside the search completion window
augroup SearchCompletion
  autocmd!

  " Execute the search immediately with Enter
  autocmd CmdwinEnter [/?] inoremap <expr> <buffer> <CR> pumvisible() ? "\<C-y>\<C-c>\<CR>" : "\<C-c>\<CR>"

  " Cycle forward through matches with Tab
  autocmd CmdwinEnter [/?] inoremap <buffer> <Tab> <C-n>

  " Cycle backward through matches with Shift-Tab
  autocmd CmdwinEnter [/?] inoremap <buffer> <S-Tab> <C-p>
augroup END

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

" blue colorscheme
colorscheme blue

" temporary; only for chromebook
if executable('wl-copy') && !empty($WAYLAND_DISPLAY)
    augroup WaylandClipboard
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system('wl-copy', @") | endif
    augroup END
endif

" vim slime
"" Set the target to tmux
let g:slime_target = "tmux"
let g:slime_bracketed_paste = 1             " no indent on sending to say a python repl
