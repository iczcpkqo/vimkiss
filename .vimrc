""""""""""""""""""""""""""""""""""""""""
"               环境变量
""""""""""""""""""""""""""""""""""""""""

" 文件编码
set fileencodings=utf-8,ucs-bom,cp936,big5     " 文件编码尝试顺序
set fileencoding=utf-8                         " 文件保存格式
set encoding=utf-8                             " 内部编码格式

" 非vi兼容模式
set nocompatible     " 使用更多vim的高级功能

" 文件备份
set noundofile     " 禁用文件编辑历史
set nobackup       " 禁用保存文件时创键副本
set noswapfile     " 禁用崩溃时保存文件

" 启用文件类型检测、插件和缩进。
filetype plugin indent on     " 自动检测文件类型。| 加载与文件类型相关的插件。 | 加载与文件类型相关的缩进规则。

" 超时时间
" terminal timeout length
" set ttimeoutlen=0

""""""""""""""""""""""""""""""""""""""""
"               交互效果                
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""
"       声音       "
""""""""""""""""""""

" 提示音
set vb t_vb=

""""""""""""""""""""
"       光标       "
""""""""""""""""""""

" 光标
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50   " 下划线
let &t_EI = "\e[1 q"                                         " 普通模式 为方块
let &t_SI = "\e[5 q"                                         " 插入模式 为竖线
let &t_SR = "\e[3 q"                                         " 替换模式 为下划线

augroup cursor_settings
    autocmd!

    " 启动 Vim 并进入插入模式时，光标将变为竖线光标
    autocmd VimEnter * silent! let &t_EI = "\e[1 q"
augroup END

""""""""""""""""""""
"      行设置      "
""""""""""""""""""""

" 显示行号
" set nu
set rnu

" 显示当前行的绝对行号
set number

" 行宽提示线
set colorcolumn=81

""""""""""""""""""""
"       缩进       "
""""""""""""""""""""

" 缩进量
set tabstop=2        " 设置制表符宽度为2个空格
set shiftwidth=2     " 设置自动缩进宽度为2个空格
set expandtab        " 使用空格替代制表符
set smarttab         " 智能缩进设置

" 启用自动缩进 
set autoindent

" C语言缩进
set cindent

" 智能缩进
set smartindent

""""""""""""""""""""
"       标签       "
""""""""""""""""""""

" 标签高亮
highlight TabLineFill ctermfg=Grey ctermbg=DarkGrey     " 标签条背景颜色
highlight TabLine ctermfg=LightGrey ctermbg=Grey        " 未被选中的标签颜色
highlight TabLineSel ctermfg=White ctermbg=DarkGrey     " 被选中的标签颜色

""""""""""""""""""""
"     文本样式     "
""""""""""""""""""""

" 设置背景色, 黑色
" set background=dark

" 移除背景色
function! AdaptColorscheme()
    highlight Normal ctermbg=NONE guibg=NONE
    highlight Normal ctermbg=NONE guibg=NONE
    highlight LineNr ctermbg=NONE guibg=NONE
    highlight Folded ctermbg=NONE guibg=NONE
    highlight NonText ctermbg=NONE guibg=NONE
    highlight SpecialKey ctermbg=NONE guibg=NONE
    highlight VertSplit ctermbg=NONE guibg=NONE
    highlight SignColumn ctermbg=NONE guibg=NONE
    highlight StatusLine ctermbg=NONE guibg=NONE
    highlight StatusLineNC ctermbg=NONE guibg=NONE
    highlight Pmenu ctermbg=NONE guibg=NONE
    highlight CursorLineNr ctermbg=NONE guibg=NONE
endfunction
autocmd ColorScheme * call AdaptColorscheme()

" 启用真彩色支持
if has("termguicolors")
    set termguicolors
endif

" 括号匹配显示
set showmatch

" 代码折叠
set foldenable     " 插入模式, 输入(, { ,匹配 ) }
set fdm=syntax     " 语法折叠, 根据语法规则自动折叠代码块

""""""
" 开启语法高亮
syntax enable

" 允许用指定语法高亮配色方案替换默认方案
if &t_Co > 2 || has("gui_running")
    syntax on
endif

" 设置颜色主题
colorscheme desert

" 如果终端支持真彩色
if has('termguicolors')
    set termguicolors
endif

""""""

" 折叠方法, 手动
set foldmethod=manual

" 设置初始折叠级别
set foldlevelstart=99     " 打开文件时, 展开折叠的内容

" 始终显示状态栏
set laststatus=2


" 设置垂直分隔线的填充字符
set fillchars=vert:/

" 设置状态栏左侧的填充字符
set fillchars=stl:/

" 设置非当前窗口状态栏的填充字符
set fillchars=stlnc:/

augroup text_style_settings
    autocmd!

    " 离开插入模式时禁用光标行高亮
    autocmd InsertLeave * se nocul

    " 进入插入模式时启用光标行高亮
    autocmd InsertEnter * se cul
augroup END


""""""""""""""""""""
"     底部设置     "
""""""""""""""""""""

" 在状态栏显示光标位置（行号和列号）。
set ruler

" 在命令行显示部分命令（例如移动命令）正在被输入时的状态。
set showcmd

" 设置短消息选项，以减少屏幕上的信息杂乱
" a：避免在文件写入时显示额外的消息
" t：避免在文件被截断时显示额外的消息
" I：在启动时禁用 Vim 插件信息的显示
set shortmess=atI

" 启用确认模式
set confirm     " 当你试图关闭一个有未保存更改的文件时, 有提示

""""""""""""""""""""
"       其他       "
""""""""""""""""""""

" 系统剪贴板, "+ 寄存器
set clipboard=unnamedplus

" 启用增量搜索
set incsearch     " 实时显示搜索结果

" 启用鼠标支持。
set mouse=a     " 在所有模式下都可以使用鼠标进行操作（选择、滚动、点击等）

" 自动加载
set autoread    " 外部修改, 文档自动更新

""""""""""""""""""""""""""""""""""""""""
"               按键绑定
""""""""""""""""""""""""""""""""""""""""

" 使用退格删除
set backspace=indent,eol,start     " 允许在插入模式中使用退格删除内容

" Leader键
let mapleader=","

" 分屏
nmap <Leader>\ :vsp<CR>
nmap <Leader>- :sp<CR>

" 缩进
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv
imap <tab> <space><space>

" 标签切换
nmap <C-tab> gt
nmap <C-S-tab> gT
vmap <C-tab> gt
vmap <C-S-tab> gT
imap <C-tab> gt
imap <C-S-tab> gT

" Ctrl+s 保存
nmap <C-s> <Esc>:update<CR>
vmap <C-s> <Esc>:update<CR>
imap <C-s> <Esc>:update<CR>

" Ctrl+a 全选
nmap <C-a> <Esc>gg<s-v>G
vmap <C-a> <Esc>gg<s-v>G
imap <C-a> <Esc>gg<s-v>G

" Ctrl+c 复制
vmap <C-c> "+y

" Ctrl+v 粘贴
imap <C-v> <ESC>"+pa

" 空格键切换折叠状态
nnoremap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>

""""""""""""""""""""""""""""""""""""""""
"            文件目录浏览器 
""""""""""""""""""""""""""""""""""""""""

" 基本 netrw 配置
let g:netrw_banner = 0              " 关闭顶部的帮助信息
let g:netrw_liststyle = 3           " 使用树形目录风格
let g:netrw_browse_split = 4        " 左侧打开文件浏览窗口
let g:netrw_altv = 1                " 右侧打开文件
let g:netrw_winsize = 35            " 设置文件浏览器窗口宽度为 35
set autochdir                       " 打开文件时将当前目录更改为当前缓冲区的目录。

augroup netrw_mapping_settings
    autocmd!

    " o - 打开文件/目录但保持netrw打开
    autocmd FileType netrw nmap <buffer> o <CR>

    " u - 进入上级目录
    autocmd FileType netrw nmap <buffer> u -

    " go - 光标处文件/目录预览,但保持焦点在netrw
    autocmd FileType netrw nmap <buffer> go <CR><C-w>p

    " gi - 水平分割打开
    autocmd FileType netrw nmap <buffer> gi :split<CR><CR>
augroup END

" 使用<F3>开关资源管理器
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_id = win_getid()
          exec expl_win_num . 'windo close'
          let prev_win_num = win_id2win(cur_win_id)
          if prev_win_num != 0
              exec prev_win_num . 'wincmd w'
          endif
      endif
      unlet t:expl_buf_num
  else
      exec '1wincmd w'
      Lexplore
      let t:expl_buf_num = bufnr("%")
      vertical resize 35
  endif
endfunction
map <silent> <F3> :call ToggleVExplorer()<CR>
