syntax on
set smartindent
set background=dark
set helplang=ja
set nu
set nobackup
set noswapfile
set cursorline
set cursorcolumn
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
set expandtab
set tabstop=2
set shell=$SHELL
set shiftwidth=2
set list
set listchars=tab:\▸\-,trail:·,extends:»,precedes:«,nbsp:%
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set hlsearch
set ignorecase
set ruler
set nocompatible
set autoread
set backspace=indent,eol,start
set exrc
set secure
set wildmenu
set wildmode=full
set encoding=UTF-8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set splitbelow
set splitright
set foldtext=FoldCCtext()
set foldcolumn=1
set fillchars=vert:\|
filetype plugin on
au BufNewFile,BufRead .pryrc setf ruby
au BufNewFile,BufRead Steepfile setf ruby
au BufNewFile,BufRead .env* setf sh
au BufNewFile,BufRead Dockerfile* setf dockerfile

nnoremap <C-[><C-[> :nohlsearch<CR><Esc>
nnoremap <C-@><C-@> :nohlsearch<CR><Esc>
nnoremap <C-n> gt<CR>
nnoremap <C-p> gT<CR>
nnoremap <C-g> :tabe<CR>:GFiles<CR>
imap <C-h> <Left>
imap <C-l> <Right>
nnoremap j gj
nnoremap k gk
nnoremap zs :sp<CR><C-w>w
nnoremap zv :vs<CR><C-w>w
nnoremap zl <C-w>l
nnoremap zk <C-w>k
nnoremap zh <C-w>h
nnoremap zj <C-w>j
nnoremap te :execute ":tabe" expand("%:h")<CR>
inoremap <C-r> <C-r>"
nnoremap J gJ"]]


"dein Scripts-----------------------------
if &compatible
	set nocompatible               " Be iMproved
endif
"
" Required:
set  runtimepath+=/Users/otsuboshunya/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/otsuboshunya/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/otsuboshunya/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

call dein#add("cohama/lexima.vim")
call dein#add("junegunn/fzf.vim")
call dein#add("junegunn/fzf")
call dein#add("tpope/vim-surround")
call dein#add("tpope/vim-commentary")
call dein#add("thinca/vim-quickrun")
call dein#add("rhysd/clever-f.vim")
call dein#add("tyru/open-browser.vim")
call dein#add("cocopon/vaffle.vim")
call dein#add("inkarkat/vim-SyntaxRange")
call dein#add("lambdalisue/fern.vim")
call dein#add("lambdalisue/fern-git-status.vim")
call dein#add("lambdalisue/glyph-palette.vim")
call dein#add("lambdalisue/nerdfont.vim")
call dein#add("lambdalisue/fern-renderer-nerdfont.vim")
call dein#add("907th/vim-auto-save")
call dein#add("prettier/vim-prettier", {'build': 'yarn install'})
call dein#add("alvan/vim-closetag")
call dein#add("Yggdroot/indentLine")
call dein#add("vim-denops/denops.vim")
call dein#add("neoclide/coc.nvim", {"merged":0, "rev": "release"})

nmap go <Plug>(openbrowser-smart-search)"
vmap go <Plug>(openbrowser-smart-search)"

nnoremap <silent> <Leader>''' :Files <CR>
nnoremap <silent> <Leader>a :Ag <CR>
nnoremap <silent> <Leader>b :Buf<CR>

" Required:
call dein#end()

" Required:
        filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

"End dein Scripts-------------------------
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=35<CR>
augroup my-glyph-palette
	autocmd! *
	autocmd FileType fern call glyph_palette#apply()
	autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

augroup vimrc_vaffle
	autocmd!
	autocmd FileType vaffle call
augroup END

nnoremap <silent> <Leader>f :execute ":Vaffle" expand("%:h")<CR>
let g:vaffle_show_hidden_files = 1
let g:vaffle_auto_cd = 0
let g:vaffle_use_default_mappings = 0
let g:vaffle_open_selected_split_position =  'rightbelow'
let g:vaffle_open_selected_vsplit_position  = 'rightbelow'
let g:vaffle_render_custom_icon =  'VaffleRenderCustomIcon'

let g:fern#renderer = 'nerdfont'
let g:fern#default_hidden=1

let g:auto_save = 0
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_path = "/Users/otsuboshunya/.vim/pack/plugins/start/vim-prettier/node-modules/.bin/prettier"
let g:prettier#quickfix_enabled = 0
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.php,*.vue'

let g:indentLine_color_term = 239
let g:indentLine_setColors = 0
let g:indentLine_bgcolor_term = 202
    let g:indentLine_bgcolor_gui = '#FF5F00'

set cmdheight=2
set completeopt=menuone,noinsert
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

set completeopt=menuone,noinsert
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"

nnoremap <C-p> :FZF<CR>
nnoremap <C-l> :Prettier<CR>

"CocConfig------------------------------
let g:coc_global_extensions = 'coc-json,coc-yaml,coc-pyright,coc-tsserver,coc-solargraph,coc-tabnine'
nmap <silent> <space><space> :<C-u>CocList<CR>
nmap <silent> <space>df <Plug>(coc-definition)
nmap <silent> <space>rf <Plug>(coc-references)
