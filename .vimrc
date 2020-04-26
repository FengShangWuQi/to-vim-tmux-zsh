
"==========================================
" 基本设置
"==========================================
" 取消备份
set nobackup
set noswapfile

" 文件编码
set encoding=utf-8

" 查找
set ic
set hls
set is




"==========================================
"  显示设置
"==========================================
" 显示行号
set number

" 显示光标当前位置
set ruler

" 设置缩进
set cindent

set tabstop=2
set shiftwidth=2

" 突出显示当前行
set cursorline

" 左下角显示当前 vim 模式
set showmode

" 启动 vim 时关闭折叠代码
set nofoldenable

" 主题
syntax enable
set background=dark
colorscheme solarized

hi Normal  ctermfg=252 ctermbg=none





"==========================================
" vim-plug
"==========================================

call 	plug#begin('~/.vim/plugged')                                                                     

" -----------------------------------------------
" 树形目录
" -----------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }





" -----------------------------------------------
" 代码，引号，路径自动补全
" -----------------------------------------------
Plug 'Valloric/YouCompleteMe'
Plug 'Raimondi/delimitMate'





" -----------------------------------------------
" 语法高亮，检查
" -----------------------------------------------
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '▶'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)





" -----------------------------------------------
" 文件，代码搜索，打开最近打开的文件
" -----------------------------------------------
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'

let g:ackprg = "ag --vimgrep"
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|DS_Store|dist|build|coverage)|(\.(git|hg|svn)$)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }





" -----------------------------------------------
" 加强版状态条
" -----------------------------------------------
Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }





" -----------------------------------------------
" 代码注释
" -----------------------------------------------
Plug 'scrooloose/nerdcommenter'

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
			\ 'javascript': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
			\ 'less': { 'left': '/*', 'right': '*/' }
		\ }

let g:NERDAltDelims_javascript = 1
let g:NERDDefaultNesting = 1






" -----------------------------------------------
" git
" -----------------------------------------------
set updatetime=100

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

let g:gitgutter_max_signs = 800





" -----------------------------------------------
" Markdown
" -----------------------------------------------
Plug 'suan/vim-instant-markdown'
Plug 'junegunn/goyo.vim'

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0




" -----------------------------------------------
" Emmet
" -----------------------------------------------
Plug 'mattn/emmet-vim'

let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
 		\ 'javascript.jsx' : {
    		\ 'extends' : 'jsx',
    	\ },
 		\ }






" -----------------------------------------------
" css3
" -----------------------------------------------
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END






" -----------------------------------------------
" JavaScript
" -----------------------------------------------
Plug 'pangloss/vim-javascript'

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1







" -----------------------------------------------
" React
" -----------------------------------------------
Plug 'mxw/vim-jsx'







" -----------------------------------------------
" Prettier
" -----------------------------------------------
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync






" -----------------------------------------------
" 盘古之白
" -----------------------------------------------
Plug 'hotoo/pangu.vim'







" -----------------------------------------------
" TypeScript 
" -----------------------------------------------
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'






" -----------------------------------------------
" WakaTime 
" -----------------------------------------------
Plug 'wakatime/vim-wakatime'







call plug#end()

" PlugInstall
" PlugUpdate
" PlugClean
" PlugUpgrade
" PlugStatus
" PlugDiff
" PlugSnapshot



