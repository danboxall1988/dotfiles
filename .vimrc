" <F3>  :  Open vertical terminal
" <F4>  :  Save all and make (build) program using makefile
" <F5>  :  Save file and compile and/or run program (for C, CPP and Python)
" <F6>  :  Save all and make (build) and run C/CPP program (assumes exe named
"          'main')
" <F7>  :  Compile file without running
" <F8>  :  Run executable without compiling (assumes there is already an
"          executable named the same as the file)
" <C-h> :  Opens or creates header file with the same name as the c file
" <C-n> :  Opens or creates a Makefile 
" 


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'git://git.wincent.com/command-t.git'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" ColorScheme 
Plugin 'https://github.com/mhartington/oceanic-next.git'

" Awesome auto completer!!!
Plugin 'https://github.com/jayli/vim-easycomplete.git'
" All of your Plugins must be added before the following line


" rainbow colored braces - match braces wtih ease!
Plugin 'https://github.com/luochen1990/rainbow.git'

call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
if (has("termguicolors"))
	set termguicolors
endif
colorscheme OceanicNext


set number " numbered lines
let g:rainbow_active = 1
let g:loaded_matchparen = 1
let g:rainbow#max_level=16


" prevents addition of extra files
set noswapfile
set nobackup

" editor stuff
set belloff=all
set backspace=indent,eol,start
set backspace=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab " convert tabs to 4 spaces"

" coding stuff
set autoindent
set smartindent
set ignorecase
set incsearch
set shellcmdflag =-ic
set autochdir " allows for using of relative path "

" sort out mouse
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
set cursorline
set mouse=a

" stuff for autocomplete 
" this changes the color of the autocomplete menu
autocmd VimEnter * highlight Pmenu ctermbg=gray

let delimitMate_expand_cr = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" KEYMAPS """""""""""""""""""""""
"  <F2>  :  Open horizontal terminal
"  <F3>  :  Open vertical terminal 
"  <F4>  :  Make c/cpp
"  <F5>  :  Compile and/or run c/cpp/python
"  <F6>  :  Make and run main.exe
"  <F7>  :  Compile c/cpp without running
"  <F8>  :  Run c/cpp without compiling
"  <F12> :  Exit all without saving  (:qa!)
"  <C-h> :  Open/create header file
"  <C-n> :  Open/create makefile
"
inoremap jk <ESC>
vnoremap jk <ESC>
inoremap kj <ESC>
vnoremap kj <ESC>
map gh :w <cr>
map fj :wq <cr>
nnoremap <F12> :qa! <cr>

nnoremap <BS> :call Backspace() <cr>

function! Backspace()
    let line = getline('.')
    let char = l:line[col('.')-1]
    let idx = col('.')-1
    ""echo l:line
    if (len(line) > 0)
        echo printf("deleted char %s from line %d col %d\n", char, line, idx)

         x
    endif
endfunction

inoremap ' ''<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<cr> {<cr>}<esc>0
inoremap {;<cr> {<cr><cr>};<up><tab>
""inoremap {<cr> {<cr><cr>}<up><tab>
""inoremap {<cr> {<cr>}<esc>0
""inoremap {;<cr> {<cr>};<esc>0


" open horizontal terminal
map <F2> :term <cr>

" open vertical terminal
map <F3> :vert :term <cr>

" build c/cpp
autocmd FileType cpp nnoremap <F4> :wa <cr> :!make && echo <cr>
autocmd FileType c nnoremap <F4> :wa <cr> :!make && echo <cr>

" compile and/or run (for c, cpp and python)
autocmd FileType cpp nnoremap <F5> :w <cr> :!g++ % -o %< && ./%< && echo <cr>
autocmd FileType c nnoremap <F5> :w <cr> :!gcc % -o %< && ./%< && echo<cr>
autocmd Filetype python nnoremap <F5> :w <cr> :!python % <cr>

" build and run c/cpp (assumes executable is named 'main')
autocmd FileType cpp nnoremap <F6> :wa <cr> :!make && ./main && echo <cr>
autocmd FileType c nnoremap <F6> :wa <cr> :!make && ./main && echo <cr>

" compile without running
autocmd FileType cpp nnoremap <F7> :w <cr> :!g++ % -o %< && echo <cr>
autocmd FileType c nnoremap <F7> :w <cr> :!gcc % -o %< && echo <cr>

" run without compiling (assumes there is already an executable)
autocmd FileType cpp nnoremap <F8> :!./%< && echo <cr>
autocmd FileType c nnoremap <F8> :!./%< && echo <cr>

" c and cpp header file
autocmd FileType c nnoremap <C-h> :vsplit %<.h <cr>
autocmd FileType cpp nnoremap <C-h> :vsplit %<.hpp <cr>

" makefile
autocmd FileType c nnoremap <C-n> :vsplit Makefile <cr>
autocmd FileType cpp nnoremap <C-n> :vsplit Makefile <cr>



