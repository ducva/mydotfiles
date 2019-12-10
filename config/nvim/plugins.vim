" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "
" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
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

" show gutter
Plug 'airblade/vim-gitgutter'

" fuzzy find files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'christoomey/vim-tmux-navigator'

" color scheme
Plug 'morhetz/gruvbox'

" zen mode
Plug 'junegunn/goyo.vim'

" keep focus
Plug 'junegunn/limelight.vim'

" Initialize plugin system
call plug#end()

" Load plugin settings
source ~/.config/nvim/coc.vim

source ~/.config/nvim/denite.vim