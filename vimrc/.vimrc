" Vim config file.


" Global Settings: {{{
call pathogen#infect()              " use pathogen to manage plugins
syntax on                           " highlight syntax
filetype plugin indent on           " auto detect file type

set nocompatible                    " out of Vi compatible mode
set number                          " show line number
set numberwidth=3                   " minimal culumns for line numbers
set textwidth=0                     " do not wrap words (insert)
set nowrap                          " do not wrap words (view)
set showcmd                         " show (partial) command in status line
set ruler                           " line and column number of the cursor position
set wildmenu                        " enhanced command completion
set wildmode=list:longest,full      " command completion mode
set laststatus=2                    " always show the status line
set mouse=a                         " use mouse in all mode
set foldenable                      " fold lines
set foldmethod=marker               " fold as marker 
set noerrorbells                    " do not use error bell
set novisualbell                    " do not use visual bell
set t_vb=                           " do not use terminal bell

set wildignore=.svn,.git,*.swp,*.bak,*~,*.o,*.a
set autowrite                       " auto save before commands like :next and :make
set cursorline
set hidden                          " enable multiple modified buffers
set history=100                     " record recent used command history
set autoread                        " auto read file that has been changed on disk
set backspace=indent,eol,start      " backspace can delete everything
set completeopt=menuone,longest     " complete options (insert)
set pumheight=10                    " complete popup height
set scrolloff=5                     " minimal number of screen lines to keep beyond the cursor
set autoindent                      " automatically indent new line
set cinoptions=:0,l1,g0,t0,(0,(s    " C kind language indent options

set tabstop=4                       " number of spaces in a tab
set softtabstop=4                   " insert and delete space of <tab>
set shiftwidth=4                    " number of spaces for indent
set expandtab                       " expand tabs into spaces
set incsearch                       " incremental search
set hlsearch                        " highlight search match
set ignorecase                      " do case insensitive matching
set smartcase                       " do not ignore if search pattern has CAPS
set nobackup                        " do not create backup file
set noswapfile                      " do not create swap file
set backupcopy=yes                  " overwrite the original file
set nobackup
set noswapfile
set backspace=eol,start,indent

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=gb2312,utf-8,gbk,gb18030
set fileformat=unix

set list
"show tab with >---
set listchars=tab:>-,trail:-

set background=dark
"colorscheme SolarizedDark_modified 
"colorscheme wombat_modified
colorscheme mycolor
" gui settings
if has("gui_running")
    set guioptions-=T " no toolbar
    set guioptions-=r " no right-hand scrollbar
    set guioptions-=R " no right-hand vertically scrollbar
    set guioptions-=l " no left-hand scrollbar
    set guioptions-=L " no left-hand vertically scrollbar
    autocmd GUIEnter * simalt ~x " window width and height
    source $VIMRUNTIME/delmenu.vim " the original menubar has an error on win32, so
    source $VIMRUNTIME/menu.vim    " use this menubar
    language messages zh_CN.utf-8 " use chinese messages if has
endif

" Restore the last quit position when open file.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif
"}}}

" Key Bindings: {{{
let mapleader = ","
let maplocalleader = "\\"

" map : -> <space>
map <Space> :

" move between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Don't use Ex mode, use Q for formatting
map Q gq

"make Y consistent with C and D
nnoremap Y y$

" toggle highlight trailing whitespace
nmap <silent> <leader>l :set nolist!<CR>

" Ctrol-E to switch between 2 last buffers
nmap <C-E> :b#<CR>

" ,e to fast finding files. just type beginning of a name and hit TAB
nmap <leader>e :e **/

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" ,n to get the next location (compilation errors, grep etc)
nmap <leader>n :cn<CR>
nmap <leader>p :cp<CR>

" Ctrl-N to disable search match highlight
nmap <silent> <C-N> :silent noh<CR>

" center display after searching
nnoremap n   nzz
nnoremap N   Nzz
nnoremap *   *zz
nnoremap #   #zz
nnoremap g*  g*zz
nnoremap g#  g#z

" %:h<tab> filename <tab>,open currect dir filename
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" Grep
nnoremap <silent> <F3> :Grep<CR>
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

" system clicpboard , need install gvim
vmap <C-c> "+y
"}}}

" Plugin Settings: {{{
if has("win32") " win32 system
    let $HOME  = $VIM
    let $VIMFILES = $HOME . "/vimfiles"
else " unix
    let $HOME  = $HOME
    let $VIMFILES = $HOME . "/.vim"
endif

" mru
let MRU_Window_Height = 10
nmap <Leader>r :MRU<cr>

" taglist
let g:Tlist_WinWidth = 25
let g:Tlist_Use_Right_Window = 0
let g:Tlist_Auto_Update = 1
let g:Tlist_Process_File_Always = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Show_One_File = 1
let g:Tlist_Enable_Fold_Column = 0
let g:Tlist_Auto_Highlight_Tag = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
nmap <Leader>t :TlistToggle<cr>

" nerdtree
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 30
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeQuitOnOpen = 1
nmap <Leader>f :NERDTreeToggle<CR>
nmap <Leader>F :NERDTreeFind<CR>

" snipMate
let g:snip_author   = "Jeffy Du"
let g:snip_mail     = "jeffy.du@163.com"
let g:snip_company  = "SIC Microelectronics CO. Ltd"

" man.vim - view man page in VIM
"source $VIMRUNTIME/ftplugin/man.vim

" cscope
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>

"nmap <F9> :!ctags -R <cr><cr>
"nmap <F9> :!ctags -R --c-kinds=+cdefgmnpstuv --c++-kinds=+p --fields=+iaS --extra=+q<cr><cr>
nmap <F10> :!cscope -Rbkq<cr><cr>

if has("cscope")
    "set csto=1
    set cst
    set nocsverb
    set cscopequickfix=s-,c-,d-,i-,t-,e-,f-
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

"paste
"vmap <C-c> "+y
"nmap <C-v> "+p
set pastetoggle=<F12>

set tags=/home/leo/workspace/ct02/Qualcomm_5_1_1_MSM8974AAAALABF111038108x740/tags
set tags=tags
"set autochdir

" display column highlight
"nmap <leader>c  :set cuc!<cr><cr>
"set cuc cul
"

" tselect
"nmap <leader>d :tselect <C-R>=expand("<cword>")<cr><cr>

" vimgdb.vim
if has("gdb")
	set asm=0
	let g:vimgdb_debug_file=""
	run macros/gdb_mappings.vim
endif


set nocompatible               " be iMproved
filetype off                   " required!       /**  从这行开始，vimrc配置 **/

set rtp +=~/.vim/bundle/vundle/

call vundle#rc()
" let Vundle manage Vundle
" required! 
"Bundle 'gmarik/vundle'

" My Bundles here:  /* 插件配置格式 */
"   
" original repos on github （Github网站上非vim-scripts仓库的插件，按下面格式填写）
Bundle 'tpope/vim-fugitive'
Plugin 'mbbill/echofunc'
Plugin 'vim-syntastic/syntastic'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos  （vim-scripts仓库里的，按下面格式填写）
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos   (非上面两种情况的，按下面格式填写)
"Bundle 'git://git.wincent.com/command-t.git'
" ... 

filetype plugin indent on     " required!   /** vimrc文件配置结束 **/
"                                           /** vundle命令 **/
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo 
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"   
" see :h vundle for more details or wiki for FAQ 
" NOTE: comments after Bundle command are not allowed..
 
 
 
"   fugitive
nmap <Leader>gd :Gdiff<CR>



"Set over 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%160v.\+/




"for auth auto
"进行版权声明的设置
"添加或更新头
map <F4> :call TitleDet()<cr>'s
function AddTitle()
    call append(0, "/* Copyright (c) 2012-2016, The Linux Foundataion. All rights reserved.")
    call append(1, "*")
    call append(2, "* Redistribution and use in source and binary forms, with or without")
    call append(3, "* modification, are permitted provided that the following conditions are")
    call append(4, "* met:")
    call append(5, "*     * Redistributions of source code must retain the above copyright")
    call append(6, "*       notice, this list of conditions and the following disclaimer.")
    call append(7, "*     * Redistributions in binary form must reproduce the above")
    call append(8, "*       copyright notice, this list of conditions and the following")
    call append(9, "*       disclaimer in the documentation and/or other materials provided")
    call append(10, "*       with the distribution.")
    call append(11, "*     * Neither the name of The Linux Foundation nor the names of its")
    call append(12, "*       contributors may be used to endorse or promote products derived")
    call append(13, "*       from this software without specific prior written permission.") 
    call append(14, "*")
    call append(15, "* THIS SOFTWARE IS PROVIDED \"AS IS\" AND ANY EXPRESS OR IMPLIED")
    call append(16, "* WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF")
    call append(17, "* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT")
    call append(18, "* ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS")
    call append(19, "* BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR")
    call append(20, "* CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF")
    call append(21, "* SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR")
    call append(22, "* BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,")
    call append(23, "* WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE")
    call append(24, "* OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN")
    call append(25, "* IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.")
    call append(26, "*")
    call append(27,"***********************************************************************")
    call append(28,"* Author: Leo.Liu @ ThunderSoft")
    call append(29,"* Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(30,"* Filename: ".expand("%:t"))
    call append(31,"* Description: ")
    call append(32,"***********************************************************************")
    call append(33, "*/")

    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/* *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/* *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=27
    "默认为添加
    while n < 33
        let line = getline(n)
        if line =~ '^\*\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction



" for doxygen
let g:DoxygenToolKit_briefTag_pre="@Synopsis"
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="----------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Leo.Liu"
let g:DoxygenToolkit_licenseTag="My own license  <-- !!! Does not end with\<enter>"

let g:DoxygenToolkit_briefTag_pre="@brief      "
let g:DoxygenToolkit_paramTag_pre="@param      "
let g:DoxygenToolkit_returnTag="@returns       "
let g:DoxygenToolkit_authorTag="@author        "
let g:DoxygenToolkit_dateTag="@date            "
let g:DoxygenToolkit_versionTag="@version      "
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

nmap <F3><CR> :Dox<CR>
nmap <F2><CR> :DoxAuthor<CR>


"  Copen && CClose
nmap <C-c>o :copen<CR>
nmap <C-c>c :cclose<CR>
nmap <C-c>s :AsyncRun myscp -c<CR>


"ctrpvim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,out/*     " MacOSX/Linux
set runtimepath^=~/.vim/bundle/ctrlp.vim

"synatastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_aggregate_errors = 1

"tabular
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>

"gundo
nnoremap <Leader>u :GundoToggle<CR>

nnoremap <Leader>mr :MRU<CR>


set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "文件路径
set statusline+=%2*\ %y\                                  "文件类型
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "编码1
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "编码2
set statusline+=%4*\ %{&ff}\                              "文件系统(dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "语言 & 是否高亮，H表示高亮?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "光标所在行号/总行数 (百分比)
set statusline+=%9*\ col:%03c\                            "光标所在列
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Read only? Top/bottom
function! HighlightSearch()
    if &hls
        return 'H'
    else
        return ''
    endif
endfunction
hi User1 ctermfg=white  ctermbg=100
hi User2 ctermfg=white  ctermbg=100
hi User3 ctermfg=white  ctermbg=100
hi User4 ctermfg=darkred  ctermbg=100
hi User5 ctermfg=darkred  ctermbg=100
hi User7 ctermfg=darkred  ctermbg=100  cterm=bold
hi User8 ctermfg=darkred  ctermbg=white
"hi User9 ctermfg=#ffffff  ctermbg=#810085
hi User0 ctermfg=yellow  ctermbg=138

