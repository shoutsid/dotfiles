" YEY!!!!

function Search(searchTerm)
  let g:command = ':vimgrep /' . a:searchTerm . '/gj ./**/*.*'

  try
    execute  g:command
  finally
    :cw
  endtry
endfunction

command! -nargs=1 Search call Search(<f-args>)
