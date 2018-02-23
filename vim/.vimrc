set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Shougo/neocomplete.vim'
Plugin 'majutsushi/tagbar'
Plugin 'garyburd/go-explorer'
Plugin 'Shougo/neosnippet.vim'

call vundle#end()
filetype plugin indent on

syntax on
set number
set background=dark
let g:neocomplete#enable_at_startup = 1
nmap <F8> :TagbarToggle<CR>
