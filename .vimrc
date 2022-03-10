" <F3>   :    make
" <F4>   :    open terminal in vsplit
" <F5>   :    compile and/or run program
" <F6>   :    open or create makefile in vsplit
" <F7>   :    run c/cpp program, as long as it has the same name as the file
" <F8>   :    compile without running

set laststatus=2
set noshowmode


"""""""""" REQUIRED FOR VUNDLE, DO NOT DELETE!!! """"""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'ycm-core/YouCompleteMe'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'tpope/vim-fugitive'

" syntax highlighter
Plugin 'https://github.com/vim-syntastic/syntastic.git'

" not sure yet...
Plugin 'https://github.com/tpope/vim-unimpaired'

" rainbow colored braces - match braces wtih ease!
Plugin 'https://github.com/luochen1990/rainbow.git'

" auto insert matching braces
Plugin 'https://github.com/jiangmiao/auto-pairs.git'

" not sure if this actually does anything !
Plugin 'octol/vim-cpp-enhanced-highlight'

" Awesome auto completer!!!
Plugin 'https://github.com/jayli/vim-easycomplete.git'

" for file exploring
Plugin 'https://github.com/preservim/nerdtree.git'

" ColorScheme 
Plugin 'https://github.com/mhartington/oceanic-next.git'

Plugin 'https://github.com/itchyny/lightline.vim.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line





""""""""""""""""""""STUFF FOR SYNTASTIC PLUGIN""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_jump = 1
let g:syntastic_loc_list_height = 5




""""""""""""""""""""""""""" MAIN EDITOR STUFF """""""""""""""
" vim looks
syntax on
if (has("termguicolors")) " needed for colorscheme
  set termguicolors
endif
colorscheme OceanicNext "elflord


set number " numbered lines
let g:rainbow_active = 1
let g:loaded_matchparen = 1
let g:rainbow#max_level=16


" For enhanced cpp highlighting 

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1


" keymaps
inoremap jk <ESC>
map gh :w <cr>
map fj :wq <cr>
map <C-h> :vsplit %<.hpp <cr>
map <C-m> :vsplit Makefile <cr>

" compiler commands
"map <F5> :w <cr> :!g++ % -o %< && ./%< && echo
map <F3> :make <cr>
map <F4> :vert :term <cr>

" STILL GOT <F9><F10><F11><F12> TO CONFIGURE!!!  " keymapping to compile and/or run based on filetype autocmd FileType python nnoremap <F5> :w <cr> :!python % & <cr>
autocmd FileType cpp nnoremap <F5> :w <cr> :!g++ % -o %< && ./%< && echo <cr>
autocmd FileType c nnoremap <F5> :w <cr> :!gcc % -o %< && ./%< && echo <cr>

" run c/cpp programs without compiling
autocmd FileType cpp nnoremap <F7> :!./%< && echo <cr>
autocmd FileType c nnoremap <F7> :!./%< && echo <cr>

" compile c/cpp programs without running
autocmd FileType cpp nnoremap <F8> :!g++ % -o %< & <cr> 
autocmd FileType c nnoremap <F8> :!gcc % -o %< & <cr> 


" normal mode commands

" prevents addition of extra files
set noswapfile
set nobackup

" editor stuff
set expandtab " convert tabs to 4 spaces"
set belloff=all
set backspace=2
set tabstop=4
set softtabstop=4
set shiftwidth=4

" coding stuff
set autoindent
set smartindent
set ignorecase
set incsearch
set shellcmdflag =-ic
let g:AutoPairsFlyMode = 1
set autochdir " allows for using of relative path "

" sort out mouse
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
set cursorline
set mouse=a

" this changes the color of the autocomplete menu
autocmd VimEnter * highlight Pmenu ctermbg=gray


