set nocompatible
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" These are the bundles that can be installed using vundle. After adding the
" Github username/reponame here, open up vim and run :BundleInstall
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails.git'
Bundle 'desert-warm-256'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdtree'

" This is the Rspec function that allows me to run tests within vim 
function! RSpecFile()
	  execute("!clear && bundle exec rspec " . expand("%p"))
endfunction
	map <leader>R :call RSpecFile() <CR>
	command! RSpecFile call RSpecFile()

function! RSpecCurrent()
	execute("!clear && bundle exec rspec " . expand("%p") . ":" . line("."))
endfunction
	map <leader>r :call RSpecCurrent() <CR>
    	command! RSpecCurrent call RSpecCurrent()

" How can I open a NERDTree automatically when vim starts up if no files were specified?
    autocmd vimenter * if !argc() | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" How can I close vim if the only window left open is a NERDTree?  
"   filetype plugin indent on
" How can I set up code folding?
    set foldmethod=syntax
    set foldnestmax=5
