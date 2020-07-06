version 4.0
set background=dark
set graphic
set nocompatible
set report=1
set history=1000
set ruler
set backspace=2
set nojoinspaces
set showcmd
set showmatch
set directory=~/tmp,/tmp,.
set hlsearch
set smartindent
set expandtab
set wildmenu
set shiftwidth=2

" turn search highlighting on and off
map  <F5>      :set hls!<bar>set hls?<CR>
imap <F5> <Esc>:set hls!<bar>set hls?<CR>i

" turn syntax on and off
:map <F7> :if exists("syntax_on") <Bar>
	\   syntax off <Bar>
	\ else <Bar>
	\   syntax enable <Bar>
	\ endif <CR>
" turn autoindent on and off
:nnoremap <F8> :setl noai nocin nosi inde=<CR>

" map Ctrl-A, Ctrl-E, and Ctrl-K in *all* modes. map! makes the mapping work
" in insert and commandline modes too.
map  <C-A> <Home>
map  <C-E> <End>
map  <C-K> J
map! <C-A> <Home>
map! <C-E> <End>
imap <C-K> <Esc>Ji

" map shifted cursor
" noremap  [A <S-Up>
" noremap! [A <S-Up>
" noremap  [B <S-Down>
" noremap! [B <S-Down>
" noremap  [C <S-Right>
" noremap! [C <S-Right>
" noremap  [D <S-Left>
" noremap! [D <S-Left>

syntax on

if  &term =~ "^xterm" || &term =~ "^linux"
   set t_kD=[3~

   noremap  Op 0
   noremap! Op 0
   noremap  Oq 1
   noremap! Oq 1
   noremap  Or 2
   noremap! Or 2
   noremap  Os 3
   noremap! Os 3
   noremap  Ot 4
   noremap! Ot 4
   noremap  Ou 5
   noremap! Ou 5
   noremap  Ov 6
   noremap! Ov 6
   noremap  Ow 7
   noremap! Ow 7
   noremap  Ox 8
   noremap! Ox 8
   noremap  Oy 9
   noremap! Oy 9
   noremap  On .
   noremap!  On .
   "noremap  OM ^M
   "noremap! OM ^M
   
   noremap OS <kMinus>
   noremap! OS <kMinus>
   noremap Ol <kPlus>
   noremap! Ol <kPlus>
   noremap OR <kMultiply>
   noremap! OR <kMultiply>
   noremap OQ <kDivide>
   noremap! OQ <kDivide>
   noremap OP <Help>
   noremap! OP <Help>


endif

if has("terminfo")
   set t_Co=16
   "Novy
   "set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
   "set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
   
   "Puvodni
   set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{32}%+5;%;%dm
   set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{22}%+1;%;%dm
endif

if has("autocmd")
  filetype plugin indent on
  autocmd FileType text setlocal textwidth=79
endif
 
" Color statusline
set laststatus=2
set statusline=%1*[%02n]%*\ %\<%f\ %y%m%2*%r%*%=[%b,0x%B]\ \ %l/%L,%c%V\ \ %P
hi statusline term=inverse cterm=bold,inverse ctermfg=Black ctermbg=Yellow
"       User1: color for buffer number
hi    User1 ctermfg=Black   ctermbg=Yellow cterm=bold,inverse
