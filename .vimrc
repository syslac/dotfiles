"Comment here
"call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
syntax enable
"set background=dark
"colorscheme golden		"Fuck yeah! :D
let g:solarized_termtrans = 1
colorscheme solarized
"colorscheme hemisu
"colorscheme camo
"colorscheme blue		"Horrible
"colorscheme darkblue	"Not bad, but gloomy and highlight non working
"colorscheme default	"Similar to darkblue, but worse
"colorscheme delek		"Too blue/red
"colorscheme desert		"Meh...
"colorscheme elflord
"colorscheme evening
"colorscheme koehler
"colorscheme morning
"colorscheme murphy
"colorscheme pablo
"colorscheme peachpuff
"colorscheme ron
"colorscheme shine
"colorscheme slate
"colorscheme torte
"colorscheme zellner
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
set background=dark
"endif

"set cursorcolumn
"set cursorline
set laststatus=2
set report=0
"set ruler
set showcmd
set showmatch

set ignorecase
set infercase
set smartcase
set shiftwidth=4
set softtabstop=4
set tabstop=4

set spelllang=it_it
nnoremap _s :set spell!

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
map j jzz 
map k kzz

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

map _y "*y
map _yy "*yy
map _p "*p

map <F9> :w!<CR>:!aspell check %<CR>:e! %<CR>
map _d I\begin{definition}{}<CR>\end{definition}<CR><Esc>kk/{}/<CR>a
map _t I\begin{theorem}{}<CR>\end{theorem}<CR><Esc>kk/{}/<CR>a
map _o I\begin{oss}{}<CR>\end{oss}<CR><Esc>kk/{}/<CR>a

if has("gui_running")
	colorscheme golden
	set mousehide
	set guifont=Monospace\ 12
endif

let g:slime_target = "tmux"

function! PlaySound()
  silent! exec '!play /home/syslac/.vim/type.wav >& /dev/null &'
endfunction
"autocmd CursorMovedI * call PlaySound()

command! Prose inoremap <buffer> . .<C-G>u|
            \ inoremap <buffer> ! !<C-G>u|
            \ inoremap <buffer> ? ?<C-G>u|
            \ setlocal spell spelllang=it,en
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
