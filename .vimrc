set nocp

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/dense-analysis/ale.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/mattn/emmet-vim.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-sensible.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/fatih/vim-go.git'
Plug 'https://github.com/tmhedberg/SimpylFold.git'
Plug 'rizzatti/dash.vim'
" Initialize plugin system
call plug#end()


" Settings for ale linter
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['prettier'],
\  'python': ['autopep8', 'autoimport', 'isort'],
\  'json': ['fixjson'],
\}

" Settings for Kite
"let g:kite_supported_languages = ['python', 'javascript', 'go']
"let g:kite_tab_complete=1

" Enable folding
let g:SimpylFold_docstring_preview = 1

" Syntax highlighting
syntax enable
filetype plugin indent on
set autoindent
set expandtab
set tabstop=2 " set indent to 4 spaces
set softtabstop=2
set shiftwidth=2
set showmatch " show bracket matches
set ignorecase " ignore case in search
set hlsearch " highlight all search matches
set incsearch " show typeahead search results
set ruler " show row and column in footer
"set clipboard=unnamed " use system clipboard
set wildmenu " enable bash style tab completion
" initialize statusline
"set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line"

" Indentation settings
" Python settings
au BufNewFile,BufRead *.py
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set textwidth=79 |
        \ set expandtab |
        \ set autoindent |
        \ set fileformat=unix |

" Full stack development
au BufNewFile,BufRead *.js, *.html, *.css
        \ set tabstop=2 |
        \ set softtabstop=2 |
        \ set shiftwidth=2 |

" Go settings
au BufNewFile,BufRead *.go
        \ set tabstop=2 |
        \ set softtabstop=2 |
        \ set shiftwidth=2 |

" Set leader key
let mapleader=","

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
set runtimepath^=~/.vim/plugged/ctrlp.vim
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
let g:go_bin_path="/Users/felix/code/go/bin"
let g:go_path="/Users/felix/code/go"
" Syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" Automatically insert import paths
let g:go_fmt_command = "goimports"
set autowrite "No save required before building
let g:go_list_type = "quickfix" "all error lists are of type quickfix list
let g:go_metalinter_autosave = 1 " Run gometalinter on save
let g:go_metalinter_autosave_enabled = [] " Turn off linter for now
let g:go_metalinter_deadline = "5s" " Time out gometalinter after five seconds
" Shortcuts for :GoAlternate function
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" :GoInfo settings
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1 " Show information automatically
set updatetime=100 " Update more frequently
" GoTest shortcut
autocmd FileType go nmap <Leader>t <Plug>(go-test)
" GoBuild shortcut
autocmd FileType go nmap <Leader>b <Plug>(go-build)
" GoCoverageToggle shortcut
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" Text search
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --no-group\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <Leader>g :Ag<SPACE>
