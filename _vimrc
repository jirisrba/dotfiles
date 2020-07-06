set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" UTF-8 encoding
"set enc=utf-8

set graphic
set report=1
set history=1000
set ruler
set backspace=2
set nojoinspaces
set showcmd
set showmatch
"set directory=~/tmp,/tmp,.
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

if has("autocmd")
  filetype plugin indent on
  autocmd FileType text setlocal textwidth=79
endif

" Color statusline
"set laststatus=2
"set statusline=%1*[%02n]%*\ %\<%f\ %y%m%2*%r%*%=[%b,0x%B]\ \ %l/%L,%c%V\ \ %P
"hi statusline term=inverse cterm=bold,inverse ctermfg=Black ctermbg=Yellow
"       User1: color for buffer number
"hi    User1 ctermfg=Black   ctermbg=Yellow cterm=bold,inverse

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
