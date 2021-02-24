"--------------Vundle-----------------"
set nocompatible              " be iMproved, required
filetype off                  " required

" Get the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" themes
Plugin 'mhartington/oceanic-next'
Plugin 'arcticicestudio/nord-vim'
" Base plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'easymotion/vim-easymotion'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter'
Plugin 'vimwiki/vimwiki', {'pinned': 1}
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
Plugin 'vim-scripts/loremipsum'
Plugin 'dense-analysis/ale'
Plugin 'danro/rename.vim'
Plugin 'junegunn/fzf.vim'
"Plugin 'https://github.com/alok/notational-fzf-vim'
"Plugin 'blindFS/vim-taskwarrior'
"Plugin 'tbabej/taskwiki'
Plugin 'majutsushi/tagbar'
Plugin 'chrisbra/csv.vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'tpope/vim-speeddating'
Plugin 'vim-scripts/utl.vim'
Plugin 'jceb/vim-orgmode'

" autocompletion
Plugin 'ervandew/supertab'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'Valloric/ListToggle'
Plugin 'SirVer/ultisnips'
Plugin 'https://github.com/ternjs/tern_for_vim.git'

" git
"Plugin 'tpope/vim-fugitive'

"html
Plugin 'mattn/emmet-vim'

" css
Plugin 'styled-components/vim-styled-components'

" js
Plugin 'prettier/vim-prettier'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'

" haskell
"Plugin 'neovimhaskell/haskell-vim'
"Plugin 'Shougo/vimproc.vim'
"Plugin 'eagletmt/neco-ghc'
"Plugin 'eagletmt/ghcmod-vim'


"" word processing
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'luochen1990/rainbow'

" python
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"-----------Vundle---END--------------"

"------------Settings-----------------"
syntax enable
set t_Co=16
set guioptions-=T                               "Removse top toolbar
set guioptions-=r                               "Removes right hand scroll bar
set go-=L                                       "Removes left hand scroll bar
set showmode                    		"always show what mode we're currently editing in
set nowrap                      		"wrap lines
set tabstop=2                   		"a tab is four spaces
set smarttab
set tags=tags
set softtabstop=2               		"when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   		"expand tabs by default (overloadable per file type later)
set shiftwidth=2                		"number of spaces to use for autoindenting
set shiftround                  		"use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  		"allow backspacing over everything in insert mode
set autoindent                  		"always set autoindenting on
set smartindent                 		"increate the indent in a new block
set copyindent                  		"copy the previous indentation on autoindenting
set number                      		"always show line numbers
set ignorecase                  		"ignore case when searching
set smartcase                   		"ignore case if search pattern is all lowercase,
set timeout timeoutlen=500 ttimeoutlen=100
set novisualbell           			"don't beep
set noerrorbells         			"don't beep
set autowrite  					"Save on buffer switch
set guicursor=a:blinkOn0
set mouse=a
set iskeyword-=_
set modifiable
set clipboard=unnamed
"set guifont=Fira\ Code\ for\ Powerline\ 12
set linespace=7
set updatetime=100
"---------Settings---END--------------"

"----------------Keys-----------------"
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>				"fast saves
nmap <leader>x :q<cr>				  "fast quit
nmap <leader>s :saveas		    "save as

nmap <leader><leader>n :!node %<cr>
nmap <leader><leader>r :!ruby %<cr>
nmap <leader><leader>e :!elixir %<cr>

nmap <leader><esc> :nohlsearch<cr>
nnoremap ,cd :cd %:p:h<CR>:pwd<CR> 		"Auto change directory to match current file ,cd
"nmap <C-v> :vertical resize +5<cr>

nmap :bp :BufSurfBack<cr>			"go backward in buffer
nmap :bn :BufSurfForward<cr>			"go forward in buffer
map <leader>n :NERDTreeToggle<CR>
"-------------Keys---END--------------"
"
"-----------------CtrlP---------------"
"map <D-p> :CtrlP<cr>
"nmap <C-d> :CtrlPBufTag<cr>
"nmap <C-e> :CtrlPMRUFiles<cr>
"
"" I don't want to pull up these folders/files when calling CtrlP
"set wildignore+=*/vendor/**
"set wildignore+=*/public/forum/**
"set wildignore+=*/node_modules/**
"set wildignore+=*/bin/**
"
"let g:ctrlp_match_window = 'top,order::ttb,min:1,max:30,results:30'
"-------------CtrlP---END-------------"

"-----------------fzf---------------"
map <C-p> :Files<CR>
nmap <C-e> :History<cr>
nmap <C-u> :Marks<cr>
"-------------fzf---END-------------"

"-----------Powerline-----------------"
let g:powerline_pycmd = 'py3'
let g:Powerline_symbols = 'fancy'
set laststatus=2   				"Always show the statusline
set encoding=utf-8 				"Necessary to show Unicode glyphs
set noshowmode 					"Hide the default mode text (e.g. -- INSERT -- below the statusline)
"--------Powerline---END--------------"

"-----------UltiSnips-----------------"
" youcompleteme remap tab
let g:ycm_key_list_select_completion=['<Down>']
"let g:ycm_key_list_previous_completion=[]
"
" Set ultisnips triggers
"let g:UltiSnipsExpandTrigger="<c-m>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

set completeopt-=preview "Remove preview window
"--------UltiSnips---END--------------"

"---------------Misc=-----------------"
highlight Search cterm=underline
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch
command! H let @/="" 				                  "Remove search results

"----------VimWiki----------"

let wiki_1 = {}
let wiki_1.path = '$HOME/wiki'
"let wiki_1.syntax = 'markdown'
"let wiki_1.ext = '.md'

"let wiki_2 = {}
"let wiki_2.name = 'personal'
"let wiki_2.path = '$HOME/wiki/wiki-personal'
"let wiki_2.syntax = 'markdown'
"let wiki_2.ext = '.md'

let g:vimwiki_list = [wiki_1]
let g:vimwiki_folding = 'list'


:map <leader>c <Plug>VimwikiToggleListItem

let g:taskwiki_markup_syntax = "markdown"

let g:instant_markdown_autostart = 0 "disable autostart
map <leader>md :InstantMarkdownPreview<CR>
let g:instant_markdown_browser = "google-chrome-stable --new-window"

"----------------"
set thesaurus+=~/Dropbox/Config/mthesaur.txt
let g:vroom_use_colors = 1
"------------Misc---END---------------"

"----------------Tabs-----------------"
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
"--------------Tabs---END-------------"

" Create/edit file in the current directory
"nmap <leader>e :edit %:p:h/

" For local replace
nnoremap gr *:%s///gc<left><left><left>

autocmd FileType vue runtime! ftplugin/html/sparkup.vim

"----------------- Commands -------------------"
command DiaryTime execute "put=system('date +%H:%M')"
:command! -nargs=1 VueSpec execute 'e test/unit/specs/<args>.spec.js <bar> split src/components/<args>.vue'
:command! -nargs=1 VueSpecPage execute 'e test/unit/specs/<args>.spec.js <bar> split src/pages/<args>.vue'

"autocmd BufNewFile,BufRead *.vue set filetype=html "When opening or creating a .vue file set the filetype to HTML for proper rendering
"JSX
let g:jsx_ext_required = 0
" enable sparkup in jsx
autocmd FileType javascript.jsx runtime! ftplugin/html/sparkup.vim
let g:closetag_filenames = "*.html,*.erb,*.jsx"
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" emmmet
let g:user_emmet_settings={'javascript.jsx': {'extends':'jsx'}}

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['tsserver', 'eslint'],
\  'python': ['flake8', 'pylint']
\}
let g:ale_echo_msg_format = '%linter%: %s'

" vue
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" ycm blacklist purescript
let g:ycm_filetype_blacklist = {'purescript': 1}

" add omnicompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" neco-ghc
let g:ycm_semantic_triggers = {'haskell' : ['.'], 'elm': ['.']}
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1

" file navigation
"nnoremap <Leader>c :e *.cabal<CR>
nnoremap <Leader>p :e package.json<CR>
nnoremap <Leader>wc :e webpack.config.js<CR>
nnoremap <Leader>gc :e gatsby-config.js<CR>
nnoremap <Leader>gn :e gatsby-node.js<CR>

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

" typescript
"autocmd FileType typescript setlocal completeopt-=menu

" List Toggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 5

" Lucius theme
"colorscheme lucius
"autocmd VimEnter * LuciusLightHighContrast
"let g:lucius_no_term_bg = 1
"let g:lucius_contrast_bg = 'high'
"colorscheme OceanicNext
"colorscheme nord
"hi Visual term=reverse cterm=reverse guibg=Grey

let g:tsuquyomi_disable_quickfix = 1

"prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yml,*.yaml,*.html Prettier

let g:rainbow_active = 1

"spellchecking
set nospell
let g:pandoc#spell#enabled = 0


"opening tag brackets
hi htmlTag ctermfg=4

"opening tag brackets
hi htmlTagName ctermfg=14

"component tag
hi tsxTagName ctermfg=14

"closing tag brackets
hi tsxCloseTag ctermfg=4
"single tag closing bracket
hi tsxCloseString ctermfg=4

"attribute name
hi tsxAttrib ctermfg=12 cterm=italic
"attribute equal
hi tsxEqual ctermfg=4
"attribute string
hi tsxString ctermfg=13

hi tsxCloseTagName ctermfg=14

hi tsxAttributeBraces ctermfg=9

hi String ctermfg=13
hi Number ctermfg=11
hi Comment ctermfg=4
hi LineNr ctermfg=8

highlight ALEWarning ctermfg=0 ctermbg=11
highlight ALEError ctermfg=15 ctermbg=9

let g:deoplete#enable_at_startup = 1

"folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

"remap za to space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"make views automatic
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"notational fzf
"let g:nv_search_paths = ['~/wiki', 'docs.md' , './notes.md']
"let g:nv_default_extension = '.wiki'
"noremap <silent> <C-s> :NV<CR>

let maplocalleader = "\\"

" change current word (like ciw) but repeatable with dot . for the same next
" word
nnoremap <silent> <C-n> :let @/=expand('<cword>')<cr>cgn