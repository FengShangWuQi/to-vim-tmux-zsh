

"==========================================
" 基本设置
"==========================================
" 编码
set enc=utf-8

" 不和 vi 兼容
set nocompatible

" 备份和撤销文件
set nobackup
set noswapfile

if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undodir
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p', 0700)
  endif
endif

" 中文
set fileencodings=ucs-bom,utf-8,gb18030,latin1

" 鼠标支持
if has('mouse')
  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
    set mouse=a
  else
    set mouse=nvi
  endif
endif

set clipboard=unnamed

" 设置文本菜单
if has('gui_running')
  let do_syntax_sel_menu = 1
  let do_no_lazyload_menus = 1
endif

if !has('gui_running')
  if has('wildmenu')
    set wildmenu
    set cpoptions-=<
    set wildcharm=<C-Z>
    nnoremap <F10>      :emenu <C-Z>
    inoremap <F10> <C-O>:emenu <C-Z>
  endif
endif

" 查找
set ignorecase
set smartcase
set hlsearch
set incsearch

nnoremap <silent> <F2>      :nohlsearch<CR>
inoremap <silent> <F2> <C-O>:nohlsearch<CR>

set scrolloff=1






"==========================================
"  显示设置
"==========================================
" 显示行号
set number

" 设置缩进
set shiftwidth=2
set tabstop=2

" 突出显示当前行
set cursorline

" 启动 vim 时关闭折叠代码
set nofoldenable






"==========================================
" vim-plug
"==========================================

call 	plug#begin('~/.vim/plugged')

" -----------------------------------------------
" 主题
" -----------------------------------------------

Plug 'dracula/vim', { 'as': 'dracula' }               " https://draculatheme.com/vim
Plug 'rakr/vim-one'                                   " https://github.com/rakr/vim-one
Plug 'NLKNguyen/papercolor-theme'                     " https://github.com/NLKNguyen/papercolor-theme






" -----------------------------------------------
" 树形目录
" -----------------------------------------------
Plug 'scrooloose/nerdtree'                            " https://github.com/preservim/nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'                    " https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'ryanoasis/vim-devicons'                         " https://github.com/ryanoasis/vim-devicons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'        " https://github.com/tiagofumo/vim-nerdtree-syntax-highlight

nnoremap dt :tabclose<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" i Open selected file in a split window
" s Open selected file in a new vsplit
" t Open selected node/bookmark in a new tab
" J Jump down inside directories at the current tree depth
" K Jump up inside directories at the current tree depth
" r Recursively refresh the current directory
" R Recursively refresh the current roo
" m Display the NERDTree menu
" C Change the tree root to the selected directory
" u Move the tree root up one directory
" A Zoom (maximize/minimize) the NERDTree window
" I Toggle whether hidden files displayed







" -----------------------------------------------
" 自动补全
" -----------------------------------------------
Plug 'Valloric/YouCompleteMe'                         " https://github.com/ycm-core/YouCompleteMe
Plug 'Raimondi/delimitMate'                           " https://github.com/Raimondi/delimitMate

set completeopt=longest,menuone
nnoremap <Leader>jd :YcmCompleter GoToDefinition<CR>







" -----------------------------------------------
" 语法高亮，检查
" -----------------------------------------------
Plug 'sheerun/vim-polyglot'                           " https://github.com/sheerun/vim-polyglot
Plug 'w0rp/ale'                                       " https://github.com/w0rp/ale

let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '▶'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)





" -----------------------------------------------
" 全局搜索，快速打开文件
" -----------------------------------------------
Plug 'ctrlpvim/ctrlp.vim'                             " https://github.com/ctrlpvim/ctrlp.vim

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_regexp = 1

" <c-r>: switch to regexp mode.
" <c-t>：open the selected entry in a new tab.
" <c-v>、<c-x>：open the selected entry in a new split.
" <c-z>: mark/unmark multiple files






" -----------------------------------------------
" 状态条
" -----------------------------------------------
Plug 'vim-airline/vim-airline'                        " https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes'                 " https://github.com/vim-airline/vim-airline-themes

let g:airline_theme='alduin'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline_section_c = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#nerdtree_statusline = 0
let g:airline_extensions = ['tabline', 'hunks', 'branch', "ctrlp"]
let g:airline_highlighting_cache = 1

" :AirlineTheme <theme>                               " https://github.com/vim-airline/vim-airline-themes/tree/master/autoload/airline/themes





" -----------------------------------------------
" 注释
" -----------------------------------------------
Plug 'scrooloose/nerdcommenter'                       " https://github.com/preservim/nerdcommenter

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" <leader>c<space>: toggles the comment state of the selected line(s).
" <leader>ca: Switches to the alternative set of delimiters.
" <leader>cs: Comments out the selected lines ``sexily''
" <leader>cm: Comments the given lines using only one set of multipart delimiters.
" <leader>cA: Adds comment delimiters to the end of line and goes into insert mode between them.






" -----------------------------------------------
" git
" -----------------------------------------------
Plug 'airblade/vim-gitgutter'                         " https://github.com/airblade/vim-gitgutter
Plug 'tpope/vim-fugitive'                             " https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-rhubarb'                              " https://github.com/tpope/vim-rhubarb

set updatetime=100
let g:gitgutter_max_signs = -1

" jump to next hunk: ]c
" jump to previous hunk: [c
" stage the hunk: <Leader>hs
" undo the hunk: <Leader>hu
" preview the hunk: <Leader>hp

" :G
" :Gdiffsplit
" :GBrowse
"
" s: stage (add) the file or hunk under the cursor.
" u: unstage (reset) the file or hunk under the cursor.
" X: discard the change under the cursor.
" dd: perform a |:Gdiffsplit| on the file under the cursor.
" cc: create a commit.
" ca: amend the last commit and edit the message.
" ce: amend the last commit without editing the message.
" =: toggle an inline diff of the file under the cursor.






" -----------------------------------------------
" Markdown
" -----------------------------------------------
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }      " https://github.com/iamcco/markdown-preview.nvim

" :MarkdownPreview






" -----------------------------------------------
" Emmet
" -----------------------------------------------
Plug 'mattn/emmet-vim'                                " https://github.com/mattn/emmet-vim

let g:user_emmet_leader_key='<C-Z>'

" <C-Z>,






" -----------------------------------------------
" Prettier
" -----------------------------------------------
Plug 'prettier/vim-prettier', { 'do': 'npm install' }     " https://github.com/prettier/vim-prettier

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync







" -----------------------------------------------
" Wakatime
" -----------------------------------------------
Plug 'wakatime/vim-wakatime'                              " https://github.com/wakatime/vim-wakatime






" -----------------------------------------------
" Whitespace
" -----------------------------------------------
Plug 'ntpeters/vim-better-whitespace'                     " https://github.com/ntpeters/vim-better-whitespace

let g:better_whitespace_enabled=1

" :StripWhitespace






call plug#end()

" PlugInstall
" PlugUpdate
" PlugClean







" 主题
syntax enable
set background=dark
colorscheme dracula
" 背景透明
hi Normal ctermfg=252 ctermbg=none

