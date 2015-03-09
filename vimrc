" Temp for reloading lavalamp.vim colorscheme
autocmd! bufwritepost lavalamp.vim source %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'Indent-Guides'
Plug 'justinmk/vim-sneak'
Plug 'Shougo/vimproc.vim'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'SirVer/ultisnips'
Plug 'haya14busa/incsearch.vim'
Plug 'ervandew/supertab'

" Languages
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'plasticboy/vim-markdown'

" Colors and color tools
Plug 'gerw/vim-HiLinkTrace'
Plug 'ap/vim-css-color'
Plug 'godlygeek/csapprox'

Plug 'chriskempson/base16-vim'

call plug#end()

" Required:
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 256 color support for terminal
set t_Co=256

" no vi compatability
set nocompatible

" set pwd to current directory
cd $PWD

" Enable filetype detection
filetype on

" Enable filetype-specific indenting
filetype indent on

" Enable filetype-specific plugins
filetype plugin on

" Sets how many lines of history VIM has to remember
set history=200

" Set to auto read when a file is changed from the outside
set autoread

" Don't line break in the middle of words
set lbr

" Save when focus lost
:au FocusLost * silent! wa

let mapleader = ","
let g:mapleader = ","

" Fast saving
map <Esc><Esc> :w<CR>
map <leader>w :w<CR>
inoremap jk <esc>

" Close buffer, but leave split open
nnoremap <Leader>d :bp\|bd #<CR>

" Fast buffer switching
:nnoremap <D-[> :bprevious<CR>
:nnoremap <D-]> :bnext<CR>

" Copy paragraphs / blocks of code
noremap cp yap<S-}>p

" Fast access to : commands
nnoremap <Space> :

" Turn off highlighting
nnoremap <leader><space> :noh<CR>

" Easy expansion of current directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
map <leader>ew :e %%

" Faster escape timeout
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

" CSScomb
nnoremap <leader>c :silent !php ~/dev/csscomb/csscomb.php -i %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.md set syntax=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>v :e  ~/.vimrc<CR>
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore compiled files
set wildignore+=*.DS_Store,*~,,.git\*,.svn\*,*.swp,*.tmp,*.zip
set wildignore+=*.gif,*.jpg,*.png,*.sketch,*.psd

"Always show current position
set ruler

" Line numbers
set number

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Remove scrollbars
set guioptions-=r " right scrollbar
set go-=L " left scrollbar

" No annoying sound on errors
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set tm=500

" Tab handling
set expandtab
set tabstop=2
set shiftwidth=2

" Consider more more chars as words for autocomplete
set iskeyword+=-,$

" Highlight current line
if has("gui_running")
  set cursorline
endif

" Turn off blinking cursor in command mode
set gcr=n:blinkon0

" Indenting
set smartindent
filetype indent on

" Insert blank lines above and below
nnoremap <CR> o<Esc>k
nnoremap <s-CR> O<Esc>j

" Increment / decrement numbers
" <C-a> for increment
:nnoremap <C-z> <C-x>

" Navigate splits
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" consistent menu navigation
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" Paste from system clipboard
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=light
colorscheme lavalamp
" colorscheme Tomorrow

set guifont=Consolas\ for\ Powerline:h17

" Always use dark bg in console
if !has("gui_running")
  set background=dark
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

nmap <F5> :call ToggleBackgroundColour()<CR>

function! ToggleBackgroundColour()
  if (&background == 'light')
    set background=dark
  else
    set background=light
  endif
  source ~/dev/lavalamp/vim/autoload/airline/themes/lavalamp.vim
  AirlineRefresh
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile
set undofile
set undolevels=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines
map j gj
map k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Strip trailing whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Currently stripping for all filetypes
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)
vmap <Enter><Enter> :EasyAlign =<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" incsearch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>t :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>r :CtrlPMRU<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tComment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <D-/> gcc
vmap <D-/> gc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_guide_size = 1
"Toggle with <Leader>ig

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>g :Ag!<space>
let g:agprg="/opt/boxen/homebrew/bin/ag -U --column --ignore-case --ignore vendor/cache/ --ignore vendor/gems/ --ignore vendor/ruby/ --ignore .log --ignore log/ --ignore tmp/"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_scss_checkers = ['scss_lint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='lavalamp'
let g:airline_section_x=""
let g:airline_section_y="%{strlen(&ft)?&ft:'none'}"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-textobj-user
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime macros/matchit.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HiLinkTrace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>h :HLT<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_leader_key='<C-a>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnip
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sneak
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:sneak#s_next=1
let g:sneak#streak=1
