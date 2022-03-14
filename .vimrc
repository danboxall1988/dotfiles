" <F3>  :  Open vertical terminal
" <F4>  :  Save all and make (build) program using makefile
" <F5>  :  Save file and compile and/or run program (for C, CPP and Python)
" <F6>  :  Save all and make (build) and run C/CPP program (assumes exe named
"          'main')
" <F7>  :  Compile file without running
" <F8>  :  Run executable without compiling (assumes there is already an
"          executable named the same as the file)
" <F9>  :  Opens NERDTree file viewer 
" <F12> :  Killall, without saving 
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

" ColorScheme 
Plugin 'https://github.com/mhartington/oceanic-next.git'

" Awesome auto completer!!!
Plugin 'https://github.com/jayli/vim-easycomplete.git'

" rainbow colored braces - match braces wtih ease!
Plugin 'https://github.com/luochen1990/rainbow.git'

" error highlighting"
Plugin 'https://github.com/vim-syntastic/syntastic.git'

" extra code highlighting"
Plugin 'octol/vim-cpp-enhanced-highlight'

" file viewer"
Plugin 'https://github.com/preservim/nerdtree.git'

"" auto-closing brackets. I've given it a slight edit though, so that curly
" braces in functions line up properly"
Plugin 'ClosePairs'

" a nice-looking status bar "
Plugin 'https://github.com/itchyny/lightline.vim.git'



call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""STUFF FOR SYNTASTIC PLUGIN""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_enable_balloons = 1
let g:syntastic_auto_jump = 1
let g:syntastic_loc_list_height = 5


""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""" ENHANCED CPP HIGHLIGHTING """""""

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" LIGHTLINE STATUS BAR SETUP """""""""""

set laststatus=2
set noshowmode
let g:lightline={
    \ 'colorscheme' : 'solarized'
    \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" AUTO-COMPLETOR """"""""""""""""""""""

" this changes the color of the autocomplete menu
autocmd VimEnter * highlight Pmenu ctermbg=gray

" disable lsp server warning when opening files"
let g:easycomplete_diagnostics_enable = 0
let g:easycomplete_lsp_checking = 0

"""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" MAIN EDITOR STUFF """""""

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
set expandtab 

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
"  <F9>  :  nerdtree 
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

map <F9> :NERDTree <cr>

