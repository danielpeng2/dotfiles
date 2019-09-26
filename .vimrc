call plug#begin('~/.vim/myPlugins')

Plug 'drewtempelmeyer/palenight.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jacoborus/tender.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'

call plug#end()

" vimtex settings
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" ultisnips settings
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" save file and generate latex pdf 
command Latex :w | :!latexmk -pdf

map <C-n> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>
set pastetoggle=<F2>
" gets rid of yellow highlighting that appears
set term=screen-256color
set t_ut=
" enable colorscheme
set background=dark
colorscheme palenight
" syntax highlighting
syntax enable

" relative line numbers
" set relativenumber
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

" 5 line buffer when scrolling
set scrolloff=5
" always display status bar
set laststatus=2
" remove default status bar
set noshowmode
" stop comments from being automatically inserted
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" disable bell sounds
set visualbell
set t_vb=
" Make j and k move to the next row, not file line
nnoremap j gj
nnoremap k gk

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

