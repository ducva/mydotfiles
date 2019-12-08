" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" Improved motion in Vim
Plug 'easymotion/vim-easymotion'

" === Javascript Plugins === "
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" Code auto suggestion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fire manager
Plug 'scrooloose/nerdtree'

" Show git status on nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" enhance nerdtree view
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" show gutter
Plug 'airblade/vim-gitgutter'

" fuzzy find files
Plug 'ctrlpvim/ctrlp.vim' 

" comment
Plug 'scrooloose/nerdcommenter'

"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'christoomey/vim-tmux-navigator'

" color scheme
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" Load plugin settings
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/coc.vim

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
