"""""""""""""""""""""" KEYS """"""""""""""""""""""
"  <F2>  :  Open horizontal terminal
"  <F3>  :  Open vertical terminal 
"  <F4>  :  Make c/cpp
"  <F5>  :  Compile and/or run c/cpp/python
"  <F6>  :  Make and run main.exe
"  <F7>  :  Compile c/cpp without running
"  <F8>  :  Save all and exit vim
"  <F9>  :  Compile and run sfml test file 
"  <F12> :  Exit all without saving  (:qa!)
"  <C-h> :  Open/create header file
"  <C-n> :  Open/create makefile
"
""""""""""""""""""""""""""""""""""""""""""""""
""""""""" REQUIRED FOR VUNDLE -- DO NOT DELETE   """""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" something to do with git - required for vundle
Plugin 'tpope/vim-fugitive'

" ColorScheme 
Plugin 'https://github.com/mhartington/oceanic-next.git'

" Excellent code completion
Plugin 'https://github.com/ycm-core/YouCompleteMe.git'

" rainbow colored braces - match braces wtih ease!
Plugin 'https://github.com/luochen1990/rainbow.git'

" error highlighting"
Plugin 'https://github.com/vim-syntastic/syntastic.git'

" extra code highlighting"
Plugin 'octol/vim-cpp-enhanced-highlight'

" file viewer"
Plugin 'https://github.com/preservim/nerdtree.git'

" automatically closes braces
Plugin 'https://github.com/jiangmiao/auto-pairs.git'

" a nice-looking status bar "
Plugin 'https://github.com/itchyny/lightline.vim.git'

" Automatically comment out blocks of code
Plugin 'https://github.com/tpope/vim-commentary.git'

call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""STUFF FOR SYNTASTIC PLUGIN""""""""""""""""""""

"set statusline+=%#warningmsg#
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
""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" YCM """"""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion = 1


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
let g:easycomplete_diagnostics_enable = 1
let g:easycomplete_lsp_checking = 1

"""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" MAIN EDITOR STUFF """""""

" fix meta-keys which generate <Esc>a .. <Esc>z
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInstert = '<M-b>'
let g:AutoPairsShortcutFastWrap = '<M-j>'

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
set clipboard=unnamedplus

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

set splitbelow 
set splitright 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" KEYMAPS """""""""""""""""""""""

fu! PrintKeymaps() 
    echo "<F2>  :  Open horizontal terminal"
    echo "<F3>  :  Open vertical terminal" 
    echo "<F4>  :  Make c/cpp" 
    echo "<F5>  :  Compile and/or run c/cpp/python"
    echo "<F6>  :  Make and run main.exe"
    echo "<F7>  :  Compile c/cpp without running"
    echo "<F8>  :  Save all and exit all"
    echo "<F9>  :  Compile and run test sfml file"
    echo "<F12> :  Exit all without saving  (:qa!)"
    echo "<C-h> :  Open/create header file"
    echo "<C-n> :  Open/create makefile"
endfunction

" Command to remind me of my keymaps
command Keys call PrintKeymaps()


inoremap jk <ESC>
inoremap kj <ESC>
vnoremap df <ESC>
vnoremap fd <ESC>
map gh :w <cr>
map fj :wq <cr>
nnoremap ty gt
nnoremap yt gt

inoremap {;<cr> {<cr>};<esc>O


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

" Save all and exit
nnoremap <F8> :wqa <cr>

" compile single sfml test script using sfml function defined
" in .bash_aliases
autocmd FileType cpp nnoremap <F9> :w <cr> :!sfml % && ./%< && echo <cr>

" Exit all without saving"
nnoremap <F12> :qa! <cr>

" c and cpp header file
autocmd FileType c nnoremap <C-h> :vsplit %<.h <cr>
autocmd FileType cpp nnoremap <C-h> :vsplit %<.hpp <cr>

" makefile
autocmd FileType c nnoremap <C-n> :tabe Makefile <cr>
autocmd FileType cpp nnoremap <C-n> :tabe Makefile <cr>
