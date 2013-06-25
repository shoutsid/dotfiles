set ts=2 et sw=2
colo wombat

autocmd vimenter * NERDTree

" Show trailing white space
match ExtraSpace /\s\+$/
autocmd BufWinEnter * match ExtraSpace /\s\+$/
autocmd InsertEnter * match ExtraSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraSpace /\s\+$/
autocmd BufWinLeave * call clearmatches()
