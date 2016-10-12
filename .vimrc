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
filetype off                  " required
execute pathogen#infect()
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
call vundle#rc()
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-airline'
Plugin 'vim-airline-themes'
call vundle#end()            " required
filetype plugin indent on    " required
let g:livedown_browser = 'google-chrome-stable'
let g:livedown_autorun = 0
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

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
:map <C-p> :LivedownPreview<CR>
let airline_powerline_fonts = 1
set t_Co=256
set laststatus=2
let g:airline_theme='zenburn'
