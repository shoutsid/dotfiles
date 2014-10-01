execute pathogen#infect()

" 2 Space indentation
set ts=2 et sw=2

" Relative Line Numbers
set relativenumber

" Auto NERDTree onlvim start
autocmd vimenter * NERDTree
" Switch out of nerdtree pane into the file pane
autocmd vimenter * wincmd p

" Map our leader key
let mapleader = ','

syntax on
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre     *.rb :call TrimWhiteSpace()

" Hack for Zsh Powerline tool
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

set clipboard=unnamed

" Change font style to be bigger and more readable
set guifont=Menlo\ Regular:h13

let g:ctrlp_map = '<D-p>'
let g:ctrlp_cmd = 'CtrlP'

map <D-t> <D-p>

" Rspec Runner
let g:rspec_runner = "os_x_iterm"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let CoVim_default_name = "james"
let CoVim_default_port = "8123"  
