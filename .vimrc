set nocp
execute pathogen#infect()

" Syntax highlighting
syntax enable
filetype plugin indent on
set autoindent
set ts=4 " set indent to 4 spaces
set showmatch " show bracket matches
set ignorecase " ignore case in search
set hlsearch " highlight all search matches
set incsearch " show typeahead search results
set ruler " show row and column in footer
set clipboard=unnamed " use system clipboard
set wildmenu " enable bash style tab completion

" Line numbers
set relativenumber " relative line numbers
set number " absolute line number on current line

" Appearance
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" ruler at 80 characters
if (exists('+colorcolumn'))
	set colorcolumn=80
	highlight ColorColumn ctermbg=8
endif

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>' " Invoke search with ctrl-p
let g:ctrlp_cmd = 'CtrlP' " Invoke search with :CtrlP command
let g:ctrlp_working_path_mode = 0 " find project dir using vcs folders
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Splits
" Make navigation between splits easier
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>
set splitbelow " split below
set splitright " split to the right
    
" Vim-go
" Go bin path
let g:go_bin_path="C:/Users/Felix/Documents/projects/go/bin"
let g:go_path="C:/Users/Felix/Documents/projects/go"
" Syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" Automatically insert import paths
let g:go_fmt_command = "goimports"
