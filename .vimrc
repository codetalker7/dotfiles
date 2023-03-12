" set line numbers
set number

" settings for vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"NERDTree
Plugin 'preservim/nerdtree'

"fugitive; git integration
Plugin 'tpope/vim-fugitive'

"YouCompleteMe (YCM) installation
Plugin 'ycm-core/YouCompleteMe'
let g:ycm_filetype_blacklist = {} "YouCompleteMe for pandoc, markdown

"Julia Plugin
Plugin 'JuliaEditorSupport/julia-vim'

"vim-pandoc
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

""vim-airline
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"let g:airline#extensions#tabline#enabled = 1

"powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2    " always display status bar

""colorscheme
"if (empty($TMUX))
"  if (has("nvim"))
"    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif
"colorscheme desert

"commentary
Plugin 'tpope/vim-commentary'

"startify
Plugin 'mhinz/vim-startify'

"devicons
Plugin 'ryanoasis/vim-devicons'
set encoding=UTF-8

"for sending lines to another window; eg a REPL
Plugin 'karoliskoncevicius/vim-sendtowindow'
let g:sendtowindow_use_defaults=0
nmap <Space><Right> <Plug>SendRight
xmap <Space><Right> <Plug>SendRightV
nmap <Space><Left> <Plug>SendLeft
xmap <Space><Left> <Plug>SendLeftV
nmap <Space><Up> <Plug>SendUp
xmap <Space><Up> <Plug>SendUpV
nmap <Space><Down> <Plug>SendDown
xmap <Space><Down> <Plug>SendDownV

"UltiSnips
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<Return>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" path for snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line 

"this is needed for tmux to detect the background color
set background=dark

" show existing tab with x spaces width
set tabstop=4

" when indenting with '>', use x spaces width 
set shiftwidth=4

" on pressing tab, insert spaces
set expandtab

" highlight text during search
set hlsearch

" This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

syntax enable
