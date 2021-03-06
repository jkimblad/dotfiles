""""""""""""""""""""""""""""VUNDLE START""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'irrationalistic/vim-tasks'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'yggdroot/indentline'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'rhysd/vim-clang-format'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'kergoth/vim-bitbake'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'zivyangll/git-blame.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""VUNDLE END""""""""""""""""""""""""""""""
set number                          " Show line numbers
set wrap
set linebreak                       " Break lines at word (requires Wrap lines)
set nolist                          " list disables linebreak
set showbreak=+++                   " Wrap-broken line prefix
set showmatch                       " Highlight matching brace
set visualbell                      " Use visual bell (no beeping)
" Disable vim from wraping in buffer
set textwidth=0
set wrapmargin=0

syntax on

set hlsearch                        " Highlight all search results
set smartcase                       " Enable smart-case search
set ignorecase                      " Always case-insensitive
set incsearch                       " Searches for strings incrementally

set autoindent                      " Auto-indent new lines
set cindent                         " Use 'C' style program indenting
set expandtab                       " Use spaces instead of tabs
set shiftwidth=4                    " Number of auto-indent spaces
set smartindent                     " Enable smart-indent
set smarttab                        " Enable smart-tabs
set softtabstop=0                   " Number of spaces per Tab
set noexpandtab
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

set ruler                           " Show row and column ruler information
 
set undolevels=1000                 " Number of undo levels
set backspace=indent,eol,start      " Backspace behaviour

set conceallevel=0                  " Dont hide formatting characters in latex, md, etc.
let g:AutoPairsShortcutFastWrap = "<C-f>"   " Get å working in vim

let mapleader = "\<space>"

" Easier navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

""""""""""""""""""""""""FILE SPECIFIC SETTINGS""""""""""""""" 
"These settings should be kept in $HOME/.vim/ftplugin/<FileType>.vim


""""""""""""""""""""""""PLUGIN SETTING"""""""""""""""""""""""
""""""""""""""""""""""""NerdTree"""""""""""""""""""""""
" Nerdtree
" Bind key to open
map <C-n> :NERDTreeToggle<CR>

" Nerdtree git plugin
" Set icons for git-nerdtree-plugin
let g:vim_markdown_folding_disabled = 1
let g:NERDTreeDirArrows = 0
let g:NERDTreeShowGitStatus = 1
let g:NERDTreeUpdateOnWrite = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
""""""""""""""""""""""""Clang-formatter"""""""""""""""""""""""""""
" Toggle auto formatting with <space> c:
nmap <Leader>C :ClangFormatAutoToggle<CR>

""""""""""""""""""""""""YouCompleteMe"""""""""""""""""""""""""""
" Map FixIt to key
map <leader>f :YcmCompleter FixIt<CR>

" Use semantic completion
let g:ycm_semantic_triggers =  {
  \   'c,cpp,objc': [ 're!\w{3}', '_' ],
  \ }

" Do not run YCM for vim
let g:loaded_youcompleteme = 1

"""""""""""""""""""""""NERDCommenter"""""""""""""""""""""""""""
" Use line comment instead of block comment for C
let g:NERDCustomDelimiters = { 'c': { 'left': '// ','right': '' } }
""""""""""""""""""""""""CTRLP"""""""""""""""""""""""""""
" Bind ctrlp to ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Ignore files in /build/ to not parse an enormous amount of files in yocto
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](build)$',
  \ }
""""""""""""""""""""""""GIT-BLAME.vim"""""""""""""""""""""""""""
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
"""""""""""""""""""""""""CUSTOM FUNCTIONS"""""""""""""""""""""""
" Draw up a diff of current file from last time it was saved
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

