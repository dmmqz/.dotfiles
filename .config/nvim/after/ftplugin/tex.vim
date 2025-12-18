" Spellcheck
setlocal spell
set spelllang=nl
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Keybinds for changing spellcheck language
nnoremap <leader>se :setlocal spelllang=en_gb<CR>
nnoremap <leader>sn :setlocal spelllang=nl<CR>
