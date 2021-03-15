" 基础设置
" 文件识别 
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" 光标修改
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" 行号显示
set nu
" 设置ESC响应时间
set ttimeout 						
set ttimeoutlen=100
" 语法高亮显示
syntax on
" 移动光标始终预留20行
set scrolloff=20 						
" tab为2
set tabstop=2 							
set shiftwidth=2						" 缩进为2
set autoindent							" 自动缩进
" 凸显行号
set relativenumber						
" 禁止换行
set nowrap							
" 高亮匹配括号
set showmatch							
" 设置历史记录条数
set history=1000       						 
" 高亮显示所在行
set cursorline							
let &t_ut=''
set encoding=utf-8

" 快捷键
map <F8> :w<CR>
map Q :q<CR>
map s <nop>
map R :source $MYVIMRC<CR>
" 分屏
map si :set splitright<CR>:vsplit<CR>
map sn :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:vsplit<CR>
map se :set splitbelow<CR>:vsplit<CR>
" 调节分屏大小
map <C-up> :res +5<CR>
map <C-down> :res -5<CR>
map <C-left> :vertical resize-5<CR>
map <C-right> :vertical resize+5<CR>
" 外部复制粘贴
map <F5> "+p
map <F6> "+y
" MarkDown 预览
nnoremap <F9> :MarkdownPreview<CR>
nnoremap <F10> :MarkdownPreviewStop<CR>
" NerdTree 快捷键
nnoremap <C-t> :NERDTreeToggle<CR>

" 插件安装
call plug#begin('~/AppData/Local/nvim/plugged')
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 文件管理
Plug 'preservim/nerdtree'

" 自动补全 引号 括号
Plug 'jiangmiao/auto-pairs' 				
Plug 'kien/rainbow_parentheses.vim'
" JS 
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'neoclide/vim-jsx-improve'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'
" 提示
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 主题
Plug 'hzchirs/vim-material'
Plug 'iCyMind/NeoSolarized'
call plug#end()
let g:material_style='oceanic'
set background=dark
colorscheme vim-material
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" markdown 配置
let g:mkdp_path_to_chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
let g:mkdp_markdown_css = expand("~/github-markdown.css")
" 回显url
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = '127.0.0.1'
let g:mkdp_port = 8080
function! g:Open_browser(url)
   silent exe '!lemonade open 'a:url
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'
let g:mkdp_echo_preview_url = 1
" 输入法设置
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()
"autocmd InsertEnter * call Fcitx2zh()
