if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
	Plug 'AndrewRadev/bufferize.vim'
	Plug 'franbach/miramare'
	Plug 'felixhummel/setcolors.vim'
	Plug 'flazz/vim-colorschemes'
	Plug 'dense-analysis/ale'
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

language en_US.UTF-8
colorscheme miramare

set title
set clipboard+=unnamedplus
set ignorecase
set smartcase

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

nmap <leader>cr :source $MYVIMRC<CR>
nmap <leader>ce :edit $MYVIMRC<CR>

nnoremap <silent> <leader> :WhichKey '\'<CR>

nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-h> <C-w>h 
nnoremap <C-l> <C-w>l
nnoremap <C-S-e> :NERDTreeToggle<CR>

autocmd FileType go set noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
