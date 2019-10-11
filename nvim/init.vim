"
" Vim
"
" :: Settings
" :: Mappings
" :: Plugins

"
" Settings
"

filetype plugin indent on
syntax enable

set autoindent
set backspace=indent,eol,start
set complete=.,w,b,u,t,k
set dictionary=/usr/share/dict/words
set directory=~/.cache/nvim/swap//
set encoding=utf-8
set expandtab shiftwidth=4 softtabstop=4
set fillchars+=vert:\ 
set foldenable foldmethod=indent foldlevelstart=99
set hidden
set incsearch
set ignorecase smartcase
set laststatus=0
set lazyredraw
set list listchars=tab:│\ ,trail:·
set nobackup nowritebackup
set nohlsearch
set nojoinspaces
set nowrap
set number relativenumber
set signcolumn=yes
set shortmess+=c
set spelllang=en_us
set splitbelow splitright
set undofile undodir=~/.cache/nvim/undo//
set updatetime=100
set wildmenu wildignorecase wildmode=list:longest,list:full

let &helpheight = &lines / 2
let &previewheight = &lines / 2
let g:mapleader = "\<space>"
let g:netrw_altfile = 1
let g:netrw_dirhistmax = 0
let g:netrw_fastbrowse = 0
let g:python_host_prog = $PYTHON_HOST_PROG
let g:python4_host_prog = $PYTHON3_HOST_PROG
let g:ruby_host_prog = $RUBY_HOST_PROG
let g:vim_indent_cont = &shiftwidth

augroup settings
    autocmd!
    autocmd FileType * setlocal formatoptions-=o
augroup end

"
" Mappings
"

nmap j gj
nmap k gk
nmap Y y$
nmap Q @q
nmap c* *``cgn
nmap c# #``cgN
nmap d* *``dgn
nmap d# #``dgN
nmap g= mmgg=G`m
nmap <bs> <c-^>

nnoremap <silent> <leader>q :call close#smart()<cr>
nnoremap <silent> <leader>t :tabedit<cr>
nnoremap <silent> <leader>s :split<cr>
nnoremap <silent> <leader>v :vsplit<cr>
nnoremap <silent> <leader>p :tabprevious<cr>
nnoremap <silent> <leader>n :tabnext<cr>
nnoremap <silent> <leader>P :-tabmove<cr>
nnoremap <silent> <leader>N :+tabmove<cr>
nnoremap <silent> <leader>h 20<c-w><
nnoremap <silent> <leader>j 20<c-w>-
nnoremap <silent> <leader>k 20<c-w>+
nnoremap <silent> <leader>l 20<c-w>>

"
" Plugins
"

call plug#begin($HOME . '/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dag/vim-fish'
Plug 'junegunn/fzf', { 'do': './install --all --no-bash --no-zsh' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-dirvish'
Plug 'jwalton512/vim-blade'
Plug 'michaeljsmith/vim-indent-object'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'sirver/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()

if has_key(g:plugs, 'coc.nvim')
    let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-docker',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-phpls',
        \ 'coc-tsserver',
        \ 'coc-ultisnips',
        \ 'coc-vimlsp',
        \ 'coc-vetur',
        \ 'coc-yaml',
        \ ]

    nmap <silent> ]<cr> <plug>(coc-diagnostic-next)
    nmap <silent> [<cr> <plug>(coc-diagnostic-prev)
    nmap <silent> <cr>d <plug>(coc-definition)
    nmap <silent> <cr>y <plug>(coc-type-definition)
    nmap <silent> <cr>i <plug>(coc-implementation)
    nmap <silent> <cr>r <plug>(coc-references)

    function! ShowDocumentation() abort
        if (index(['vim', 'help'], &filetype) >= 0)
            execute 'h ' . expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    nnoremap <silent> K :call ShowDocumentation()<cr>
    nnoremap <expr> <c-e> coc#util#has_float() ? coc#util#float_scroll(1) : "\<c-e>"
    nnoremap <expr> <c-y> coc#util#has_float() ? coc#util#float_scroll(0) : "\<c-y>"
endif

if has_key(g:plugs, 'fzf.vim') && executable('fzf')
    let git_commit_format = '--format="%C(red)%C(bold)%h%d%C(reset) %s %C(blue)%cr"'
    let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
    let g:fzf_commits_log_options = '--graph --color=always ' . git_commit_format
    let g:fzf_prefer_tmux = exists('$TMUX')

    command! -bang Commits call fzf#vim#commits({'options': '--no-preview'}, <bang>0)
    command! -bang BCommits call fzf#vim#commits({'options': '--no-preview'}, <bang>0)

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-j> <plug>(fzf-complete-file)
    imap <c-x><c-p> <plug>(fzf-complete-path)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    nnoremap <leader><space> :Files<cr>
    nnoremap <leader><tab> :Snippets<cr>
    nnoremap <leader><bs> :Buffers<cr>
    nnoremap <leader>\ :Commits!<cr>
    nnoremap <leader>\| :BCommits!<cr>
    nnoremap <leader>- :History<cr>
    nnoremap <leader>/ :History/<cr>
    nnoremap <leader>: :History:<cr>
    nnoremap <leader>? :Helptags<cr>
    nnoremap <leader>` :Marks<cr>
endif

if has_key(g:plugs, 'nord-vim')
    let g:nord_bold_vertical_split_line = 1
    let g:nord_italic = 1
    let g:nord_italic_comments = 1
    let g:nord_underline = 1

    silent! colorscheme nord

    highlight StatusLine ctermfg=0 ctermbg=0
    highlight StatusLineNC ctermfg=0 ctermbg=0
endif

if has_key(g:plugs, 'ultisnips')
    let g:UltiSnipsSnippetDirectories = [$HOME . '/.config/nvim/ultisnips']
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

    nnoremap <s-tab> :UltiSnipsEdit<cr>
endif

if has_key(g:plugs, 'vim-dirvish')
    let g:dirvish_mode = ':sort | sort ,^.*[^/]$, r'
endif

if has_key(g:plugs, 'vim-easy-align')
    xmap ga <plug>(EasyAlign)
    nmap ga <plug>(EasyAlign)
endif

if has_key(g:plugs, 'vim-fugitive')
    nnoremap <silent> \b :Gblame<cr>
    nnoremap <silent> \c :Gcommit<cr>
    nnoremap <silent> \d :Ghdiffsplit<cr>
    nnoremap <silent> \e :Gedit<cr>
    nnoremap <silent> \l :0Glog<cr>
    nnoremap <silent> \r :Gcd<cr>
    nnoremap <silent> \s :Gstatus<cr>
    nnoremap <silent> \w :Gwrite<cr>
endif

if has_key(g:plugs, 'vim-gitgutter')
    let g:gitgutter_map_keys = 0

    nmap ]c <plug>(GitGutterNextHunk)
    nmap [c <plug>(GitGutterPrevHunk)
    omap ic <plug>(GitGutterTextObjectInnerPending)
    omap ac <plug>(GitGutterTextObjectOuterPending)
    xmap ic <plug>(GitGutterTextObjectInnerVisual)
    xmap ac <plug>(GitGutterTextObjectInnerVisual)
endif

if has_key(g:plugs, 'vim-unimpaired')
    nnoremap ]<bs> :bnext<cr>
    nnoremap [<bs> :bprevious<cr>
endif
