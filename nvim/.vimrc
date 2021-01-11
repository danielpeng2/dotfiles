" vim:fdm=marker

" Plug {{{
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tmsvg/pear-tree'
Plug 'pineapplegiant/spaceduck'

call plug#end()
" }}}

" Mappings {{{
noremap <SPACE> <Nop>
let mapleader=" "

map <C-p> :GFiles --exclude-standard --others --cached<CR>

nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>

" cut to black hole register
nnoremap <leader>x "_x
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dp

" make j and k move to the next row, not file line
nnoremap j gj
nnoremap k gk

" hunk operations for vim-signify
nnoremap <leader>hp :SignifyHunkDiff<CR>
nnoremap <leader>hu :SignifyHunkUndo<CR>
" }}}

" Theme / Status Bar{{{
" true colour support
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" theme
colorscheme spaceduck
syntax enable
highlight VertSplit guibg=NONE
highlight StatusLine guifg=#1b1c36
highlight StatusLineNC guifg=#1b1c36

" status bar
let g:lightline = {
\ 'colorscheme': 'spaceduck',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ],
\   'right': [ [ 'lineinfo' ],
\              [ 'percent' ],
\              [ 'filetype' ] ]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status',
\   'filename': 'LightlineFilename'
\ },
\ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
" }}}

" Indenting {{{
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
autocmd Filetype typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd Filetype json setlocal shiftwidth=2 tabstop=2
" }}}

" {{{ Misc
" 5 line buffer when scrolling
set scrolloff=5

" always display status bar
set laststatus=2
" remove default status bar
set noshowmode

" stop comments from being automatically inserted
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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

" sets default vim register to clipboard
set clipboard=unnamedplus

" always show sign column
set signcolumn=yes

" line numbers
set number

" pear-tree smart pairs
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" signify
highlight clear SignColumn
highlight SignifySignAdd    ctermfg=green  guifg=#5ccc96 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ce6f8f cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#f2ce00 cterm=NONE gui=NONE

" default updatetime 4000ms is not good for async update
set updatetime=100

" search only content, not filenames in AG
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
" }}}

"{{{ NERDTree
map <C-n> :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

let g:NERDTreeMapOpenVSplit = "<C-v>"
let g:NERDTreeMapOpenSplit = "<C-x>"

" close nerdtree if last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}}}

" Coc {{{
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-pyright'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" map <tab> to trigger completion and navigate to next item in coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Code actions
nmap <leader>. <Plug>(coc-codeaction)
" }}}
