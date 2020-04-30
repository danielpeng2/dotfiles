call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ayu-theme/ayu-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-obsession'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'

call plug#end()

map <C-n> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>

" focus events for gitgutter
let g:gitgutter_terminal_reports_focus=0

" true colour support
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" theme
let ayucolor="dark"
colorscheme ayu
let g:lightline = {
\ 'colorscheme': 'ayu_dark',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status'
\ },
\ }

" syntax highlighting
syntax enable

" line numbers
set number

" tab characters have width 4
set tabstop=4
" indent uses width 4
set shiftwidth=4
" replace spaces with tabs
set expandtab
" uses shiftwidth instead of tabstop at start of lines
set smarttab
" auto indenting
set autoindent
" custom indenting by file type
autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2
autocmd Filetype typescript setlocal shiftwidth=2 tabstop=2

" 5 line buffer when scrolling
set scrolloff=5

" always display status bar
set laststatus=2
" remove default status bar
set noshowmode

" stop comments from being automatically inserted
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" make j and k move to the next row, not file line
nnoremap j gj
nnoremap k gk

" fix delay escaping to normal mode
set ttimeoutlen=50

" enable highlight search
set hlsearch
" highlight while search
set incsearch
" case insensitivity pattern matching
set ignorecase
" overrides ignorecase if pattern contains uppercase
set smartcase
" Press <leader> Enter to remove search highlights
noremap <silent> <leader><cr> :noh<cr>

" sets default vim register to clipboard
set clipboard=unnamedplus
