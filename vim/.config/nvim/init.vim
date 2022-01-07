set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set shell=/bin/bash
set showcmd
set cmdheight=2
set hidden
set nofixeol
set history=10000
set wildmenu
set wildmode=full
set mouse=a
if has("nvim-0.5.0") || has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif
set cursorline
set nobackup
set nowritebackup
set noswapfile
set incsearch
set ignorecase
set smartcase
set autoread
set updatetime=100
set shortmess+=c
set textwidth=80
set formatoptions-=t
set colorcolumn=+1,+2,+3

if has('persistent_undo')
    set undofile
endif

" Plugin
if has('nvim')
    let autoload_path = '~/.local/share/nvim/site/autoload/plug.vim'
else
    let autoload_path = '~/.vim/autoload/plug.vim'
endif

if empty(glob(autoload_path))
    execute '!curl -fLo ' . autoload_path . ' --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync
endif

let mapleader=","
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode = 3
let g:NERDTreeUseTCD = 1
let g:NERDTreeMinimalUI = 1
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:polyglot_disabled = ['sensible']
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'
Plug 'felleg/TeTrIs.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'lambdalisue/suda.vim'
let g:suda_smart_edit = 1
Plug 'mhinz/vim-startify'
let g:startify_bookmarks = [
    \ {'a': '~/workspace/algo'},
    \ {'b': '~/.bashrc'},
    \ {'d': '~/dotfiles'},
    \ {'i': '~/.config/nvim/init.vim'},
    \ {'t': '~/TODO.md'}
    \ ]
let g:startify_custom_header ='startify#center(startify#fortune#cowsay())'
if has('nvim')
    autocmd TabNewEntered * redir => t | silent history -1 | redir END
        \ | if bufname() == '' && t !~ 'checkhealth' | Startify | endif
else
    autocmd BufWinEnter *
        \ if !exists('t:startify_new_tab')
        \     && empty(expand('%'))
        \     && empty(&l:buftype)
        \     && &l:modifiable |
        \   let t:startify_new_tab = 1 |
        \   Startify |
        \ endif
endif
autocmd User Startified nmap <buffer> . :e .<CR>
Plug 'aymericbeaumet/vim-symlink'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'rhysd/clever-f.vim'
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)
Plug 'easymotion/vim-easymotion'
Plug 'farmergreg/vim-lastplace'
Plug 'gcmt/taboo.vim'
Plug 'vim-scripts/LargeFile'
Plug 'alvan/vim-closetag'
let g:clsoetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript'
Plug 'nathanaelkane/vim-indent-guides'
nmap <leader>i <Plug>IndentGuidesToggle
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_default_mapping = 0
call plug#end()

cabbrev W write
cabbrev ㅈ write
cabbrev ㅂ quit
cabbrev ㅈㅂ wq
cabbrev ㅂㅁ qa

nnoremap <C-s>      :update<CR>
inoremap <C-s> <ESC>:update<CR>
vnoremap <C-S> <ESC>:update<CR>

nnoremap <F5>      :update<CR>:!cat % \| sed '/^\s*$/d' \| xclip -selection clipboard -rmlastnl<CR>:!solve %<CR>
inoremap <F5> <ESC>:update<CR>:!cat % \| sed '/^\s*$/d' \| xclip -selection clipboard -rmlastnl<CR>:!solve %<CR>
vnoremap <F5> <ESC>:update<CR>:!cat % \| sed '/^\s*$/d' \| xclip -selection clipboard -rmlastnl<CR>:!solve %<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> <C-w>q

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

set background=dark
colorscheme dracula

if has("syntax")
    syntax on
endif

set autoindent
set cindent

set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

autocmd FileType html,css,javascript setlocal ts=2 sw=2 sts=0 et

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

function! EditTC(name)
    silent execute "!touch" a:name . ".in" a:name . ".out" a:name . ".ans"
    execute "split" a:name . ".ans"
    execute "normal \<c-w>J"
    execute "vs" a:name . ".out"
    execute "vs" a:name . ".in"
endfunction

function! EditTCs(...)
    if !exists("t:is_tctab")
        let l:pname = substitute(bufname(), '\v(_|\.).*', '', '')
        let l:path = './testcase/' . l:pname
        if !isdirectory(l:path)
            execute '!mkdir -p ' . l:path
        endif
        execute "tabe " . l:path
        execute ":tcd " . l:path
        execute "TabooRename " . "TC:" . l:pname
        let t:is_tctab = 1
    endif
    let l:names = a:000
    if a:0 == 0
        let l:names = []
        for name in split(globpath('.', '*.in'), '\n')
            let l:names += [name[2:-4]]
        endfor
    endif
    for s in l:names
        call EditTC(s)
    endfor
    if bufname() !~# 'NERD_tree'
        execute "NERDTreeClose"
    endif
endfunction

function! ClearTC()
    silent execute "!rm *"
    execute ":only"
    execute ":e ."
    execute "NERDTreeRefreshRoot"
endfunction

function! CloseTC()
    windo bd
endfunction

function! DeleteTC()
    echo pass
endfunction

command! -nargs=* Et call EditTCs(<f-args>)
command! Ct call CloseTC()
cnoreabbrev et Et
cnoreabbrev ct Ct

autocmd BufNewFile,BufRead *     set modifiable
autocmd BufNewFile,BufRead *.out set nomodifiable
autocmd WinLeave *.in  update
autocmd WinLeave *.ans update
