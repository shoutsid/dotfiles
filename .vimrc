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

" Allow CTRL+P to be CMD+P
let g:ctrlp_map = '<D-p>'
let g:ctrlp_cmd = 'CtrlP'
map <D-t> <D-p>

" Rspec Runner
let g:rspec_runner = "os_x_iterm"
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

" C++ mappings
noremap <leader>m :call RunMake() <CR>

function! RunMake()
  silent !clear
  execute "!./make.sh"
endfunction

" Support Syntastic C++11
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_include_dirs = [ './include/' ]
let g:syntastic_cpp_auto_refresh_includes = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
