" clpm's fantastic .vimrc
" Feel free to copy, modify or distribute this file as you wish.

" --------------- SETTINGS OF REMARKABLY GOOD TASTE ---------------

" First let's get Pathogen to work
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax on                
filetype plugin indent on

" We want to keep this here just in case the machine we're in doesn't have wombat.
colo slate
" If it does, though, let's use it!
colo wombat

" If we can, let's use DejaVu Sans Mono. Otherwise, whatever we have is good.
set guifont=DejaVu\ Sans\ Mono

" Make the statusline a little nicer
set stl=%f\ (#%n%(,\ %Y%))\ %m%r%=(%v-%c,%l/%L)\ %P

set autochdir      " Sets the working dir as the current file's
set autoindent     " Always set autoindenting on
set cursorline     " Highlight the line where the cursor is
set cursorcolumn   " Highlight the column where the fish are
set enc=utf-8      " Use UTF-8 encoding
set expandtab      " Use spaces instead of tabs
set fillchars=""   " Remove the |s in window separators
set fo=tcq1        " Sets formatoptions how I like it. Mostly don't add comment leaders
set guioptions=c   " Remove toolbar and menu and don't use popup dialogs
set hidden         " Allow unsaved buffers to go to the background
set history=100    " Keep 100 lines of command line history
set hlsearch       " Highlight search results
set ignorecase     " Don't make Vim case-sensitive!
set incsearch      " Do incremental searching
set laststatus=2   " Always show status line
set lazyredraw     " Don't redraw the screen when executing macros
set lbr            " Break lines 'artifically' to match words
set mouse=a        " Nobody's perfect - sometimes I use the mouse too
set nostartofline  " G, gg, ^U, ^F, etc. keep current column
set number         " Show line numbers
set ruler          " Show the cursor position all the time
set scrolloff=7    " Sets the cursor scroll area to 7
set shellslash     " Backslashes suck
set shiftwidth=4   " Use four spaces for shifts
set showcmd        " Display incomplete commands
set showmode       " Tell me which mode I'm in
set smartcase      " Make Vim case-sensitive only when there are capitals involved
set softtabstop=4  " Use four spaces for tabs
set ve=block       " Allow cursor to boldly go where no cursor has gone before in visual block mode
set visualbell     " Make the screen flash and give you epileptic seizures instead of beeping
set wrapscan       " Wrap around the file when searching

set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set grepprg=ack\ -n\ --column  " Use ack instead of grep
set grepformat=%f:%l:%c:%m
set switchbuf=useopen,usetab   " Don't switch the current window's buffer if the one you want is already open
set wildmode=list:longest      " Autocomplete with longest match and display a list

let mapleader=" "

" --------------- MAKING WAY FOR GLORIOUS ACHIEVEMENTS ---------------

" Configure tags
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
set tags+=~/.vim/tags/allegro
" Build tags for the current project with C-F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Python syntax highlighting
let python_slow_sync = 1 " Work with triple-quoted strings, be slow
let python_hightlight_all = 1

" --------------- THE MOST EXCELLENT MAPPINGS IN THE NEW WORLD ---------------
" Type ,t to add a date and time stamp
nmap ,t :execute "normal i" . strftime("[%d/%m/%y %H:%M] ")<Esc>

" Don't move whole lines if the line is broken. We can use ^n and ^p for that
map j gj
map k gk

" Make Y behave more intuitively (and usefully)
map Y y$

" 0 is soft bol, ^ is hard bol
nnoremap 0 ^
nnoremap ^ 0

" Quickfix is great, but typing :cn all the time is tiresome.
" Let's use <C-Enter> instead
nmap <C-CR> :cn<CR>
nmap <C-S-CR> :cp<CR>

" Alt- is a shortcut for C-w
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

map <A-H> <C-w>H
map <A-J> <C-w>J
map <A-K> <C-w>K
map <A-L> <C-w>L

map <A-_> <C-w>_

" Alt-w/W/b/B/e/E to move faster
map <A-w> 5w
map <A-W> 5W
map <A-b> 5b
map <A-B> 5B
map <A-e> 5e
map <A-E> 5E

" I sometimes find it comfortable to be able to go down with C-d and up with C-s
nmap <C-s> <C-u>

" gs to split a line
nmap gs i<Return><Esc>
" This one works backwards
nmap gS i<Return><Esc>kddp

" Swap words (stolen from Derek Wyatt)
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Make the directory that contains the file in the current buffer.
nmap  ,md :!mkdir -p %:p:h<CR>

" <C-^> is too annoying to press
nmap ,, <C-^>

" As is :A
nmap ,a :A<CR>
" Edit and source the .vimrc
nmap <silent> ,vs :vs $MYVIMRC<CR>
nmap <silent> ,vh :sp $MYVIMRC<CR>
nmap <silent> ,vv :e  $MYVIMRC<CR>
nmap <silent> ,so :so $MYVIMRC<CR>

" Toggle search highlighting with the spacebar
nmap <Leader>s :set invhls<cr>:set hls?<CR>

" Make it easier to copy the entire file to the external buffer
noremap  <silent><F8> mngg"+yG'n
inoremap <silent><F8> <Esc>mngg"+yG'n

" Navigate through tabs like a human being
noremap <C-Tab> gt
noremap <C-S-Tab> gT

" Use arrow keys for useful things
nmap <Up> :<Up>
nmap <Down> :A<CR>
nmap <Left> :bprev<CR>
nmap <Right> :bnext<CR>

" & seems pretty useless to me; :&& is much better
map <silent> & :&&<CR>

" NERDTree
nmap <F6> :NERDTreeToggle<CR>

" Conque
nmap <F1> :ConqueTermVSplit bash<CR>

" FuzzyFinder
nmap <Leader>b :FufBuffer<CR>
nmap <Leader>f :FufFile<CR>
nmap <Leader>e :FufFile<CR>

" Press F9 or F10 to make and run
function! RunBuffer()
python << EOF
import vim
if vim.current.buffer[0].startswith("#!"):
    vim.command("!" + vim.current.buffer[0][2:] + " %")
else:
    vim.command("make go")
EOF
endfunction

nmap <silent><F9> :w<CR>:call RunBuffer()<CR>
nmap <silent><F10> :make -B go<CR>

" --------------- PLUGINS FOR EXTENDING PERFECTION ----------------
"
" BUNDLE: http://github.com/vim-scripts/Align.git
" BUNDLE: http://github.com/vim-scripts/a.vim.git
" BUNDLE: http://github.com/vim-scripts/camelcasemotion.git
" BUNDLE: http://github.com/vim-scripts/clang-complete.git
" BUNDLE: http://github.com/vim-scripts/Conque-Shell.git
" BUNDLE: http://github.com/vim-scripts/CSApprox.git
" BUNDLE: http://github.com/vim-scripts/FuzzyFinder.git
" BUNDLE: http://github.com/vim-scripts/L9.git
" BUNDLE: http://github.com/vim-scripts/matchit.zip.git
" BUNDLE: http://github.com/vim-scripts/pyflakes.vim.git
" BUNDLE: http://github.com/vim-scripts/ragtag.vim.git
" BUNDLE: http://github.com/vim-scripts/repeat.vim.git
" BUNDLE: http://github.com/vim-scripts/ReplaceWithRegister.git
" BUNDLE: http://github.com/vim-scripts/ReplaceWithRegister.git
" BUNDLE: http://github.com/vim-scripts/surround.vim.git
" BUNDLE: http://github.com/vim-scripts/The-NERD-Commenter.git
" BUNDLE: http://github.com/vim-scripts/The-NERD-tree.git
" BUNDLE: http://github.com/vim-scripts/VisIncr.git
" BUNDLE: http://github.com/vim-scripts/Wombat.git
