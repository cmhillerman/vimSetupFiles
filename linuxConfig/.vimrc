"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""                                               """
"""      Clint Hillerman's Custom Vimrc File      """
"""                                               """
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" ===================================================
" Set Variables
" ===================================================

" Set map leader for <leader> variable
let mapleader=" "
" this allows space to be used as leader
" by default space is mapped to <right>
" and doesn't behave as expected
nnoremap <SPACE> <Nop>

"--------------------------------
"Tabs
"--------------------------------
set expandtab               " Expand tabs to spaces
set tabstop=2               " One tab equals 2 spaces (default is 8)
set shiftwidth=2            " Auto-indent uses 2 spaces (default is 8)
set shiftround              " Rounds tab value instead of absolute

"--------------------------------
" searching
"--------------------------------
set ignorecase              " ignores case while searching
set smartcase               " Smartcase: ignore case except when upper case is typed
set noincsearch             " Don't do incremental searching
set incsearch               " moves cursor to matching string while searching
set nohlsearch              " doesn't highlight search results

"--------------------------------
" indentation
"--------------------------------
set autoindent              " Use the current line to set the indent level
set smartindent             " Predict the indent level of new line
set smarttab                " insert tabs on the start of aline according to shiftwidth, not tabstop

"--------------------------------
"line numbers
"--------------------------------
set number                  " Show the line numbers
set numberwidth=2           " Set number of characters for line number

"--------------------------------
"mouse features
"--------------------------------
"set mousefocus              " set windows to focus when mouse enter it
set mouse=a                 " enable mouse support in terminal

"--------------------------------
" line wrapping
"--------------------------------
set nowrap                  " Wrap lines
"navigate to wraped lines like expected
"map j gj                    
"map k gk

"--------------------------------
" Fixes backspace issues 
"--------------------------------
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set backspace=2             " Allow backspacing over everything in insert mode

"--------------------------------
" Color Scheme 
"--------------------------------
colors vividchalk  

"--------------------------------
" Misc
"--------------------------------
set viminfo='1000,nc:\users\chillerman\_viminfo
set nocompatible            " use Vim defaults
syntax on                   "turn on syntax highlighting
set viminfo='20,\"50        " Read/write a .viminfo file, don't store more
set ruler                   " Show the cursor position all the time
set showcmd                 " Display incomplete commands
set complete-=i
filetype plugin indent on   " Align comments on following new lines
filetype plugin on          " use filetype specific setting from /after/ftplugin 
set history=1000            " Buffer command history to 1000
set undolevels=1000         " Buffer undo history to 1000
"set paste                   "stop the cascading paste problem
set autowrite               " Automatically save before commands like buffer switch
set showcmd                 " show partial command in status line
set showmatch               " show matching brackets
set formatoptions-=c        " Prevent continuation of comment lines.
set mousehide               " hide mouse while typing
set ch=2                    " set command line hieght
set hidden                  " buffers can exist in background 
set mat=2                   " How many tenths of a second to blink when matching brackets
set showmatch               " Show matching brackets when text indicator is over them

"set spell                   "turn on spell check
"set nowrapscan             " Don't search from the top if end-of-file is reached
" setup to behave like microsoft windows
"behave mswin                " add windows commands like ctrl-v, ctrl-c, etc
"source $"VIMRUNTIME/mswin.vim

"--------------------------------
" swap and backup file settings
"--------------------------------
set updatetime=1000 "time to update swap file (milliseconds)
"set noswapfile     " disable swap file
" set no backup

"--------------------------------
" Error settings  
"--------------------------------
set noerrorbells
"set visualbell
set t_vb=
set tm=500

" ===================================================
" Auto Commands
" ===================================================

"--------------------------------
" Folds
"--------------------------------
au BufWinLeave * silent! mkview     " save folds on exist
au BufWinEnter * silent! loadview   " load folds on open

" automatically create folds out of text with the same indent
" level, but allow user to still define them manually 
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

"--------------------------------
" Sessions
"--------------------------------
" automatic sessioning (saves when you exist loads when you open) 
"au VimEnter * nested :call LoadSession()
"au VimLeave * :call MakeSession()

"--------------------------------
" Templates
"--------------------------------
autocmd BufNewFile * silent! 0r C:/Program Files (x86)/Vim/vimfiles/templates/%:e.template

" ===================================================
"  Keymappings
" ===================================================

"--------------------------------
" Leader 
"--------------------------------

" switch buffers with d and f
nnoremap <leader>d :bp<CR>
nnoremap <leader>f :bn<CR>

" navigate between windows with hjkl
nnoremap <silent> <leader>k  :wincmd k<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>l :wincmd l<CR>

" Comment lines and blocks with c and v (in normal mode)
nnoremap <leader>c <INSERT>/*<space><ESC>A<space>//*/<left><left><left><left><left>
nnoremap <leader>v <INSERT>/*<ESC>}<INSERT>//*/<ESC>

" comment/uncomment blocks of code (in visual mode)
vnoremap <leader>c :s/^/#/gi<Enter>
vnoremap <leader>v :s/^#//gi<Enter>

" toggle highlight search with t
nnoremap <leader>t :set hlsearch!<CR>

" easy way to write all, quit, and quit all
nnoremap <leader>w :wa!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :xa<CR>

" split and vertical split with s and S
nnoremap <leader>S :sp<CR>
nnoremap <leader>s :vsp<CR>

" show register content with r
nnoremap <leader>r :reg<CR>

" set all windows to equal size with = 
nnoremap <leader>= <c-w>=

" go to buffer number with leader buffer#
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>

" handle folds with z
nnoremap <leader>z za
onoremap <leader>z <C-C>za
vnoremap <leader>z zf
noremap  <m-z>    zd 

" cursor movement shortcuts 
nnoremap <leader>u 0
vnoremap <leader>u 0
nnoremap <leader>i ^
vnoremap <leader>i ^
nnoremap <leader>o $
vnoremap <leader>o $

" go to mark i.e. to goto mark a type:
" <leader>ma 
nnoremap <leader>m `

"make find and replace easier
nnoremap <leader>n :%s///gc<left><left><left><left>

" make macro repeat easier
nnoremap <leader>2 @@

"--------------------------------
" Misc Key Mappings 
"--------------------------------

" Make enter and shift enter insert new lines
nnoremap <CR> o<ESC>
nnoremap <s-CR> O<ESC>

" increase split size with + and -
if bufwinnr(1)
  noremap <Right> :vertical resize +5<CR>
  noremap <Left> :vertical resize -5<CR>
  noremap <Up> :resize +5<CR>
  noremap <Down> :resize -5<CR>
endif

" Show buffers with leader b
nnoremap <leader>b :buffers<cR>

" map Y to yank the rest of line (instead of the same as yy)
noremap Y y$          

"Exit insert mode with jk  
inoremap jk <ESC>

" make backspace work outside of insert
noremap <backspace> <S-x>

" go to tab number with alt#
noremap <A-1> :tabn 1<CR>
noremap <A-2> :tabn 2<CR>
noremap <A-3> :tabn 3<CR>
noremap <A-4> :tabn 4<CR>
noremap <A-5> :tabn 5<CR>
noremap <A-6> :tabn 6<CR>
noremap <A-7> :tabn 7<CR>
noremap <A-8> :tabn 8<CR>
noremap <A-9> :tabn 9<CR>

" Tag setup
" ctrl-y is into tag and ctrl-t is back out of tag
noremap <C-y> g<C-]>     
"ctrl-e is edit other file
noremap <C-e> :e#<CR>   

nnoremap <insert> :call ToggleMouse()<CR>

"--------------------------------
" Function Keys
"--------------------------------

" edit VIMRC
nnoremap <F3> :so $MYVIMRC<CR>
nnoremap <F4> :e $MYVIMRC<CR>

" toggles spell check
noremap <F10> :setlocal spell! spelllang=en_us<CR>

" open file explorer
noremap <F9> :Vexplore<CR> 

" manual sesioning
noremap <C-f12> :call MakeSession()<CR>
noremap <f12>   :call LoadSession()<CR>

" ===================================================
" Functions
" ===================================================

" Save session (including tabs, buffers, etc)
" only one per working directory
function! MakeSession()
  let b:sessiondir = getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

" Load session (including tabs, buffers, etc)
" only one per working directory
function! LoadSession()
  let b:sessiondir = getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc
" ===================================================
" Plugin setting
" ===================================================

"--------------------------------
" Pathogen
"--------------------------------
execute pathogen#infect()

"--------------------------------
" taglist 
"--------------------------------
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1

"--------------------------------
" nerd tree
"--------------------------------
" toggle nerd tree
nnoremap <f7> :NERDTreeToggle<CR>  
" find dir of current file
noremap <leader>r :NERDTreeFind<cr>

" ===================================================
"  Abbreviations
" ===================================================

" Catch stupid typos 
command WQ wq
command Wq wq
command W w
command Q q

" ===================================================
" Experimental 
" ===================================================




