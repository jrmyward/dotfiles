" ========================================================================
" Plugins - uses vim-plugin
" ========================================================================
call plug#begin('~/.vim/plugged')

" Essentials
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Interface
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }

" Ruby / Rails
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'

" Syntax
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee'  }

" Themes
Plug 'altercation/vim-colors-solarized'

" Tools
Plug 'tpope/vim-fugitive'

call plug#end()

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" ========================================================================
" Ruby stuff
" ========================================================================

syntax on                 " Enable syntax highlighting

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
augroup END

" Enable built-in matchit plugin
runtime macros/matchit.vim

" ========================================================================
" Remapping - Leader, etc
" ========================================================================

" let mapleader = ","
let mapleader = "\<Space>"

" Let's be reasonable, shall we?
nmap k gk
nmap j gj

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" ========================================================================
" Settings
" ========================================================================

set nocompatible                  " Use Vim settings, rather then Vi settings
set backspace=indent,eol,start    " allow backspacing over everything in insert mode
set history=500                   " keep 500 lines of command line history
set ruler                         " show the cursor position all the time
set showcmd                       " display incomplete commands
set showmatch
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp              " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set guioptions-=T
set guifont=Triskweline_10:h10
set et
set sw=2
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2                   " Always show status line.
set relativenumber
set number
set gdefault                        " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent                      " always set autoindenting on
set bg=light
set lazyredraw                        " Don't redraw screen when running macros.

" Set the tag file search order
set tags=./tags;

" Use Silver Searcher instead of grep
set grepprg=ag

" Make the omnicomplete text readable
highlight PmenuSel ctermfg=black

" Ignore stuff that can't be opened
set wildignore+=tmp/**

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Format xml files
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.

" ========================================================================
" Misc.
" ========================================================================

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

function! OpenFactoryFile()
  if filereadable("test/factories.rb")
    execute ":sp test/factories.rb"
  else
    execute ":sp spec/factories.rb"
  end
endfunction

" Make it more obvious which paren I'm on
hi MatchParen cterm=none ctermbg=black ctermfg=yellow

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr

" Wrap the quickfix window
autocmd FileType qf setlocal wrap linebreak

" Make it more obviouser when lines are too long
highlight ColorColumn ctermbg=235


