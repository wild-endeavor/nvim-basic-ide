-- https://stackoverflow.com/questions/9721732/mapping-shift-arrows-to-selecting-characters-lines
vim.cmd([[
nnoremap <S-Up> v<Up>
nnoremap <S-Down> v<Down>
nnoremap <S-Left> v<Left>
nnoremap <S-Right> v<Right>
vnoremap <S-Up> <Up>
vnoremap <S-Down> <Down>
vnoremap <S-Left> <Left>
vnoremap <S-Right> <Right>
inoremap <S-Up> <Esc>v<Up>
inoremap <S-Down> <Esc>v<Down>
inoremap <S-Left> <Esc>v<Left>
inoremap <S-Right> <Esc>v<Right>
]])
vim.cmd([[
noremap <silent> <C-s>          :wa<CR>
vnoremap <silent> <C-s>         <C-C>:wa<CR>
inoremap <silent> <C-s>         <C-O>:wa<CR>
inoremap <silent> <D-s>         <C-O>:wa<CR>

inoremap <M-BS> <C-w>
inoremap <M-Del> <C-o>dw
]])

-- ctrl a and e
vim.cmd([[
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
nnoremap <C-a> ^
nnoremap <C-e> $
]])

vim.cmd([[
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
    silent! nunmap <buffer> j
    silent! nunmap <buffer> k
    silent! vunmap <buffer> j
    silent! vunmap <buffer> k

  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk
  endif
endfunction
set nowrap
call ToggleWrap()
]])
