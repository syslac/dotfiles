"Comment here
"call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()
"call pathogen#infect()
syntax enable

" Vundle config
set nocompatible
filetype off
set clipboard=unnamed

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle "altercation/vim-colors-solarized"
Bundle "Shougo/unite.vim"
Bundle "scrooloose/syntastic"
Bundle "Lokaltog/powerline"
Bundle "Valloric/YouCompleteMe"
Bundle "kien/ctrlp.vim"
Bundle "majutsushi/tagbar"
Bundle "vim-scripts/greplace.vim"

filetype plugin indent on

set background=dark
set t_Co=256
set ttimeoutlen=50
let g:solarized_termtrans = 1
"set background=dark
colorscheme solarized
let g:Powerline_symbols = "fancy"
let g:Powerline_colorscheme = "solarized256"

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

set number
set relativenumber
set encoding=utf8
set autochdir
set directory=~/.vim/swap/
set wildmenu
set wildmode=full
"syntax on

""if &t_Co > 2 || has("gui_running")
"syntax on
"colorscheme hemisu
"endif

set cursorcolumn
set cursorline
set laststatus=2
set report=0
set ruler
set showcmd
set showmatch
set backspace=indent,eol,start
set autoread

set smartcase
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set timeout timeoutlen=1000 ttimeoutlen=100

set tags=./tags;
nnoremap -* :CtrlPTag<cr>
nnoremap <silent> _* :TagbarToggle<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" To test
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

set spelllang=it_it
nnoremap _s :set spell!<CR>
inoremap noe one

"folding settings
set foldenable
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set foldlevel=100       

" Octave Syntax
augroup filetypedetect
     au! BufRead,BufNewFile *.m setfiletype octave
augroup END 

"Key mappings
map <S-Space> <C-Y>
map <Space> <C-E>
map <F3> :NERDTreeToggle<CR><CR>
map <leader>q :Bclose
map U :redo<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"
" Use the damn hjkl keys
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop> 
map <k2> <C-U>
map <k1> <C-D>
imap <k2> <C-O><C-U>
imap <k1> <C-O><C-D>

" Or better yet, use vim motions
" autocmd VimEnter,BufNewFile,BufReadPost * call HardMode()
nnoremap <leader>h <Esc>:call EasyMode()<CR>
nnoremap <leader>H <Esc>:call HardMode()<CR>

map _y "*y
map _yy "*yy
map _p "*p

nnoremap <C-p> :Unite -start-insert file<CR>

map <F9> :w!<CR>:!aspell check %<CR>:e! %<CR>
map _d I\begin{definition}{}<CR>\end{definition}<CR><Esc>kk/{}/<CR>a
map _t I\begin{theorem}{}<CR>\end{theorem}<CR><Esc>kk/{}/<CR>a
map _o I\begin{oss}{}<CR>\end{oss}<CR><Esc>kk/{}/<CR>a

if has("gui_running")
	colorscheme solarized
	set mousehide
	set guifont=Monospace\ 12
endif

let g:slime_target = "tmux"

"Typewriter sound - disabled by default
function! PlaySound()
  silent! exec '!play /home/syslac/.vim/type.wav >& /dev/null &'
endfunction
"autocmd CursorMovedI * call PlaySound()

" >80 columns line warning
map <leader>o :highlight OverLength ctermbg=red ctermfg=white guibg=#592929 <CR> :match OverLength /\%81v.\+/<CR>

function SelectIndent()
  let cur_line = line(".")
  let cur_ind = indent(cur_line)
  let line = cur_line
  while indent(line - 1) >= cur_ind
    let line = line - 1
  endw
  exe "normal " . line . "G"
  exe "normal V"
  let line = cur_line
  while indent(nextnonblank(line)) >= cur_ind
    let line = line + 1 
  endw
  exe "normal " . line . "G"
endfunction
nnoremap vip :call SelectIndent()<CR>

command! Prose inoremap <buffer> . .<C-G>u|
            \ inoremap <buffer> ! !<C-G>u|
            \ inoremap <buffer> ? ?<C-G>u|
            \ setlocal spell spelllang=it
            \     nolist nowrap tw=74 fo=t1 nonu|
            \ augroup PROSE|
            \   autocmd InsertEnter <buffer> set fo+=a|
            \   autocmd InsertLeave <buffer> set fo-=a|
            \ augroup END

command! Code silent! iunmap <buffer> .|
            \ silent! iunmap <buffer> !|
            \ silent! iunmap <buffer> ?|
            \ setlocal nospell list nowrap
            \     tw=74 fo=cqr1 showbreak=… nu|
            \ silent! autocmd! PROSE * <buffer>
nnoremap <leader>s ea<C-X><C-S>
