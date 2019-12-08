" Show git status on Nerd Tree
let g:NERDTreeGitStatusWithFlags = 1

" ignore node-modules
let g:NERDTreeIgnore = ['^node_modules$', '^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" Open current directory of current file when toggle nerd tree
autocmd BufEnter * lcd %:p:h

" use Ctrl+f, after open tree to focus current file.

" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" close tree when open
let g:NERDTreeQuitOnOpen = 1

" don't open Nerdtree when open directory
let g:NERDTreeHijackNetrw = 0 