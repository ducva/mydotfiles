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
set encoding=utf-8
let using_neovim = has('nvim')
let using_vim = !using_neovim

call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" Improved motion in Vim
Plug 'easymotion/vim-easymotion'
" {{{
  let g:EasyMotion_do_mapping = 0
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_off_screen_search = 0
  nmap ; <Plug>(easymotion-s2)
" }}}

" === Javascript Plugins === "
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" Code auto suggestion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" show gutter
Plug 'airblade/vim-gitgutter'

" fuzzy find files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'christoomey/vim-tmux-navigator'

" color scheme
Plug 'morhetz/gruvbox'

" keep focus
Plug 'junegunn/limelight.vim'
" {{{
  let g:limelight_default_coefficient = 0.7
  let g:limelight_conceal_ctermfg = 238
  let g:limelight_paragraph_span = 1
  let g:limelight_priority = -1
  nmap <silent> gl :Limelight!!<CR>
  xmap gl <Plug>(Limelight)
" }}}
" zen mode
Plug 'junegunn/goyo.vim'
"{{{
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()

  nnoremap <Leader>G :Goyo<CR>

  function! s:goyo_enter()
    if has('gui_running')
      set fullscreen
      set background=light
      set linespace=7
    elseif exists('$TMUX')
      silent !tmux set status off
    endif
    Limelight
    let &l:statusline = '%M'
    hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
  endfunction

  function! s:goyo_leave()
    if has('gui_running')
      set nofullscreen
      set background=dark
      set linespace=0
    elseif exists('$TMUX')
      silent !tmux set status on
    endif
    Limelight!
  endfunction
"}}}


"Nerd Tree"
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Language "
Plug 'chrisbra/unicode.vim', { 'for': 'journal' }
Plug 'junegunn/vim-easy-align'
" {{{
  let g:easy_align_ignore_comment = 0 " align comments
  vnoremap <silent> <Enter> :EasyAlign<cr>
  let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '\': { 'pattern': '\\' },
\ '/': { 'pattern': '//\+\|/\*\|\*/', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] },
\ ']': {
\     'pattern':       '\]\zs',
\     'left_margin':   0,
\     'right_margin':  1,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       ')\zs',
\     'left_margin':   0,
\     'right_margin':  1,
\     'stick_to_left': 0
\   },
\ 'f': {
\     'pattern': ' \(\S\+(\)\@=',
\     'left_margin': 0,
\     'right_margin': 0
\   },
\ 'd': {
\     'pattern': ' \ze\S\+\s*[;=]',
\     'left_margin': 0,
\     'right_margin': 0
\   }
\ }

" Start interactive EasyAlign in visual mode
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap ga <Plug>(EasyAlign)
nmap gaa ga_

xmap <Leader>ga   <Plug>(LiveEasyAlign)
" nmap <Leader><Leader>a <Plug>(LiveEasyAlign)

" inoremap <silent> => =><Esc>mzvip:EasyAlign/=>/<CR>`z$a<Space>


" }}}

" increase search "
Plug 'haya14busa/is.vim'

Plug 'vim-airline/vim-airline'
" {{{
" plugin settings
"
let g:airline_theme='light'
let g:airline_powerline_fonts = 1
let g:airline_section_x = '%F'
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1 "Show tablines"
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'


"}}}
Plug 'vim-airline/vim-airline-themes'


Plug 'tpope/vim-commentary'

Plug 'Yggdroot/indentline'
" {{{
" plugin settings
" }}}

" Async autocompletion
" if using_neovim
"     Plug 'Shougo/deoplete.nvim', {'do': ':autocmd VimEnter * UpdateRemotePlugins'}
" else
"     Plug 'Shougo/deoplete.nvim'
" endif

" Completion from other opened files
Plug 'Shougo/context_filetype.vim'

Plug 'machakann/vim-sandwich'

Plug 'SirVer/ultisnips'
" {{{
"
"
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}

" Initialize plugin systmachakann/vim-sandwichem

Plug 'tpope/vim-fugitive'
" git command wrapper

" A very fast, multi-syntax context-sensitive color name highlighter
Plug 'ap/vim-css-color'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['/usr/local/bin/javascript-typescript-stdio'],
    \ }

call plug#end()

source ~/.config/nvim/coc.vim

source ~/.config/nvim/fzf.vim
source ~/.config/nvim/nerdtree.vim
