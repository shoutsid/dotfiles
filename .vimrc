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
"colorscheme solarized
"let g:solarized_termcolors=256

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

" Change font style to be bigger and more readable
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
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

autocmd filetype crontab setlocal nobackup nowritebackup
