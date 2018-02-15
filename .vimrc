" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.
set nocompatible              " be iMproved, required
set wrap
set linebreak
set foldmethod=marker
filetype off                  " required
execute pathogen#infect()
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
call vundle#rc()
" Vundle plugins
" ---------------------------------------------------------------------------
Plugin 'gmarik/Vundle.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bling/vim-airline'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'gisphm/vim-gitignore'
" Snippets for ^
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'jelera/vim-javascript-syntax'
" ---------------------------------------------------------------------------
call vundle#end()            " required
filetype plugin indent on    " required
let g:livedown_browser = 'firefox'
let g:livedown_autorun = 0
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" Airline config
" ---------------------------------------------------------------------------

" statusline
set laststatus=2

" airline UI
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" separators
" let g:airline#extensions#tabline#left_sep = '▶'
" let g:airline#extensions#tabline#left_alt_sep = '▶'
" let g:airline#extensions#tabline#right_sep = '◀'
" let g:airline#extensions#tabline#right_alt_sep = '◀'
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = '▶'
" let g:airline_right_sep = '◀'
" let g:airline_right_alt_sep = '◀'
"let g:airline_symbols.branch = '▶'
"let g:airline_symbols.readonly = '▶'
"let g:airline_symbols.linenr = '▶'

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode',' ','branch'])
  let g:airline_section_b = airline#section#create_left(['%F'])
  let g:airline_section_c = airline#section#create(['ffenc',' ','[%Y]'])
  let g:airline_section_x = airline#section#create(['%P'])   "P
  let g:airline_section_y = airline#section#create(['row:%l/%L ','(%03p%%)'])
  let g:airline_section_z = airline#section#create_right(['col:%03c'])
endfunction
autocmd VimEnter * call AirlineInit()

" ---------------------------------------------------------------------------
" Visual indents
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" Syntastic settings 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" enable all checkers on same file
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers = ['flake8']
"  Показывать номера строк
set number
" Включить подсветку синтаксиса
syntax on
" Поиск в процессе набора
set incsearch
" Подсвечивание результатов поиска
set hlsearch
set tabstop=4 " tab for 4 spaces
set shiftwidth=4
set smarttab
set expandtab
set smartindent
map <C-p> :LivedownPreview<CR>
let airline_powerline_fonts = 1
set t_Co=256
set laststatus=2
" let g:airline_theme='zenburn'
