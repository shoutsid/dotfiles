call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-haml'
Plug 'scrooloose/nerdtree'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --ts-completer' }
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()


" 2 Space indentation
set ts=2 et sw=2

" Relative Line Numbers
set relativenumber

" Auto NERDTree on vim start
autocmd vimenter * NERDTree
" Switch out of NERDTree pane into the file pane
autocmd vimenter * wincmd p
" Show hiddedn files in NERDTree
let NERDTreeShowHidden=1

" Map our leader key
let mapleader = ','

syntax on
set background=dark

" Force red highlight for trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Hack for Zsh Powerline tool
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

if $TMUX == ''
  set clipboard=unnamed
endif

" Change font style to be bigger and more readable when using gvim
set guifont=Menlo\ Regular:h13

" Rspec Runner
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Remove trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre     *.* :call TrimWhiteSpace()

" Suggested column size
if exists('+colorcolumn')
  set colorcolumn=160
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>160v.\+', -1)
endif

autocmd filetype crontab setlocal nobackup nowritebackup
