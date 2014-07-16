set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
" file tree
Bundle 'scrooloose/nerdtree'
" commenting
Bundle 'scrooloose/nerdcommenter'
" fuzzy file open
Bundle 'kien/ctrlp.vim'
" yank history
Bundle 'YankRing.vim'
Bundle 'Valloric/YouCompleteMe'
" git integration
Bundle 'tpope/vim-fugitive'
" syntax checking on save
Bundle 'scrooloose/syntastic'
" TextMate-style snippets
Bundle 'msanders/snipmate.vim'
" manipulation of surraunding parens, quotes, etc.
Bundle 'tpope/vim-surround'
" 'ack' searching integration
Bundle 'mileszs/ack.vim'
" text object based on indent level (ai, ii)
Bundle 'austintaylor/vim-indentobject'
" global search & replace
Bundle 'greplace.vim'
" end certain structures automatically, e.g. begin/end etc.
Bundle 'tpope/vim-endwise'
" automatic closing of quotes, parenthesis, brackets, etc.
Bundle 'Raimondi/delimitMate'
" switch segments of text with predefined replacements. e.g. '' -> ""
Bundle 'AndrewRadev/switch.vim'

" Ruby/Rails

" rails support
Bundle 'tpope/vim-rails'
" bundler integration (e.g. :Bopen)
Bundle 'tpope/vim-bundler'
" rake integration
Bundle 'tpope/vim-rake'
" A custom text object for selecting ruby blocks (ar/ir)
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" color themes
Bundle 'altercation/vim-colors-solarized'
Bundle 'davidkariuki/sexy-railscasts-256-theme'

" syntax support

Bundle 'vim-ruby/vim-ruby'
Bundle 'tsaleh/vim-tmux'
Bundle 'JSON.vim'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vitaly/vim-syntastic-coffee'
Bundle 'wavded/vim-stylus'
Bundle 'slim-template/vim-slim'

" Support and minor

" replacement for the repeat mapping (.) to support plugins
Bundle 'tpope/vim-repeat'
" hide .gitignore-d files from vim
Bundle 'vitaly/vim-gitignore'
" repeat motion with <Space>
Bundle 'scrooloose/vim-space'

"Bundle 'tpope/vim-unimpaired'

Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'

Bundle 'junegunn/goyo.vim'
Bundle 'junegunn/limelight.vim'
Bundle 'christoomey/vim-tmux-navigator' 



" ---------------------------------------------------
set term=xterm-256color
set t_Co=256
colorscheme sexy-railscasts-256
syntax on
filetype plugin indent on
set noeol
set binary

if has('multi_byte')
  scriptencoding utf-8
  set encoding=utf-8
end


set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo   
set nobackup   
set nowrap
set noswapfile   
set showmatch
let mapleader=","   
set autoindent    " always set autoindenting on   
set copyindent    " copy the previous indentation on autoindenting   
set number        " always show line numbers   
set numberwidth=4 
set ignorecase    " ignore case when searching   
set hlsearch      " highlight search terms   
set incsearch     " show search matches as you type   
set smartcase
set visualbell           " don't beep   
set noerrorbells         " don't beep   
set scrolloff=2         " 2 lines above/below cursor when scrolling   
set matchpairs+=<:>   
set clipboard+=unnamed " yank goto clipboard   
set ttimeoutlen=50      " fast Esc to normal mode
set ts=2  " Tabs are 2 spaces 
set sw=2                " number of spaces for indent
set et                  " expand tabs into spaces
set virtualedit=onemore   
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set autoread
set backspace=indent,eol,start
set nobackup            " do not write backup files
set noswapfile          " do not write .swp files
    
nnoremap ; :   
    
nmap <silent> // :nohlsearch<CR>   
    
" Easy window navigation   
  "map <C-h> <C-w>h   
  "map <C-j> <C-w>j   
  "map <C-k> <C-w>k   
  "map <C-l> <C-w>l   
      
cmap w!! w !sudo tee % >/dev/null   
    
let g:ctrlp_map = '<Leader><Leader>'   
    
" mapping vim-rails file relations   
map <Leader>rc :Rcontroller<CR>   
map <Leader>rm :Rmodel<CR>   
map <Leader>rv :Rview<CR>   
map <Leader>rh :Rhelper<CR>   
map <Leader>rt :A<CR>    
    
nmap ,bb Obinding.pry<Esc>j   
nmap ,b, ?binding.pry<Enter>dd   
    
nnoremap <CR> :w<CR>   



"--------------------------------- plugins config
" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_wq=0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

nmap <silent> <Leader>n :NERDTreeToggle<CR>
" nerdcommenter
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>>)

nmap <leader>s :Switch<cr>

nmap <C-f> :Ack --type=ruby 


highlight LineNr ctermbg=234
highlight NonText ctermfg=234

" Goyo
let g:goyo_width=100
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7

function! GoyoBefore()
  Limelight
endfunction

function! GoyoAfter()
  Limelight!
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]

au BufNewFile,BufRead *.prawn set filetype=ruby
