" An example for a vimrc file.
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2002 Sep 19
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
"set encoding=utf-8
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
syntax enable
set fdm=marker
set noet
set sw=4
set ts=4
map W :w<CR>
map <F4> \be
"color desert
"let php_htmlInStrings = 1
"let php_sql_query = 1
"let php_noShortTags = 1
"let php_folding = 1
set encoding=utf-8
"set encoding=chinese
set fileencodings=utf-8,chinese,latin-1

"set cursorline
"set cursorcolumn

set diffopt+=iwhite
set guifont=consolas:h14
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let favex_fe='<f3>'
let favex_win_height=8
let TE_Ctags_Path = '/usr/bin/ctags'
set path=.,/usr/local/include,/usr/include,/var/www/pear,/var/www/htdocs/,~/generic

if has("vms")
    set nobackup        " do not keep a backup file, use versions instead
else
    set nobackup        " keep a backup file
endif
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
set guioptions-=T
map Q gq

"设置modeline查询文件首尾10行
set modelines=10

"vim7.1在windows下的编码设置。
"set encoding=utf-8
"if has("win32")
" set fileencoding=chinese
"else
" set fileencoding=utf-8
"endif
"
""解决菜单乱码
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"
""解决consle输出乱码
"language messages zh_CN.utf-8


" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
"   set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    autocmd BufNewFile,Bufread *.ros,*.inc,*.php set filetype=php
    " autocmd BufNewFile,Bufread *.ros,*.inc,*.php,*.php3,*.php4 set keywordprg="help"
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
    augroup END
else
    set autoindent      " always set autoindenting on
endif " has("autocmd")
set diffexpr=MyDiff()

function MyDiff()
    silent execute "!diff -abB ".v:fname_in." ".v:fname_new." > ".v:fname_out
endfunction

function MyCopy()
    call setline(line("."),"/**")
    call append(line(".")+0," * $RCSfile$ ".expand("%"))
    call append(line(".")+1," * @touch date ".strftime("%c"))
    call append(line(".")+2," * @author chris(<gongxiangfeng@jike.com>)")
    call append(line(".")+3," * @license http://www.zend.com/license/3_0.txt   PHP License 3.0")
    call append(line(".")+4," * @version $Id$ ")
    call append(line(".")+5,"*/")
endf
map <c-i> <Esc>:call MyCopy()<CR><Esc>

set dictionary-=~/php_function.txt dictionary+=~/php_function.txt
set complete-=k complete+=k


map <F10> :NERDTreeToggle<CR>

set viminfo='20,<100,s10,h
set nu

let TE_Ctags_Path='/home/chris/nginx-0.7.68/tags'
set tags+=/home/chris/nginx-0.7.68/tags

set expandtab	"使用空格代替tab
set tabstop=4 "四个空格
set shiftwidth=4 "自动缩进的宽度
