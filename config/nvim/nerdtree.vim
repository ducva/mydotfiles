" <leader>n | NERD Tree
nnoremap <leader>n :NERDTreeToggle<cr>

" auto change directory to current working directory"
autocmd BufEnter * silent! lcd %:p:h

