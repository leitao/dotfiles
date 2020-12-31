set nocompatible
set bg=dark
filetype off
filetype plugin indent on
set noswapfile 
set nocp
call pathogen#infect()
syntax on

let g:gitgutter_enabled = 1

:command WQ wq
:command Wq wq
:command W w
:command Q q
"cmap q qa
cmap <C-R> History: <CR>
"nnoremap ; :
"

" Emacs helps
map <C-a> <ESC>^
imap <C-a> <ESC>I
map <C-e> <ESC>$
imap <C-e> <ESC>A
inoremap <M-f> <ESC><Space>Wi
inoremap <M-b> <Esc>Bi
inoremap <M-d> <ESC>cW
map <M-d> <ESC>cW

" Control space to auto complete
inoremap <C-Space> <C-N>


" Terminal fixes?
inoremap <C-H> <C-W>
inoremap <C-^H> <C-W>
map <Esc>[A <up>
map <Esc>[B <down>
map <Esc>[C <right>
map <Esc>[D <left>

" Backspace delete in normal mode
nnoremap <BS> X


if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" Show trailing space on C
let c_space_errors = 1
set ts=2
set shiftwidth=2
set expandtab
syn match tab display "\t"
hi link tab Error

" Trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"Golang
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.bb set filetype=bb
au BufRead,BufNewFile *.cconf set filetype=python
au BufRead,BufNewFile *.tw set filetype=python
au BufRead,BufNewFile *.bbappend set filetype=bb

"Python
" Do not show call signature
let g:jedi#show_call_signatures = "0"

" Control N for file navitagion
map <C-n> :NERDTreeToggle<CR>

"set term=cons25

"bufexplore
set wildchar=<Tab> wildmenu wildmode=full
nnoremap <F10> :BufExplorer <CR>
nnoremap <F6> :History <CR>

map <C-c> :qa!<cr>
imap <C-c> :qa!<cr>
map <C-x> :x<cr>

" Regenereate ctags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Add new line with [/] Space
nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>

call plug#begin()
" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'mhinz/vim-signify'

call plug#end()



" Vim only
"nmap ]h <Plug>GitGutterNextHunk
"nmap [h <Plug>GitGutterPrevHunk
nmap ]h <plug>(signify-next-hunk)
nmap [h <plug>(signify-prev-hunk)


" Show function name if inside the funciton
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>


"buffers
"nnoremap <leader><tab> :b#<cr>
"nnoremap <F5> :buffers<CR>:buffer<Space>

" Tabs
let notabs = 0
nnoremap <silent> <S-Up> :tabnew<CR>
nnoremap <silent> <S-Down> :tabclose<CR>
nnoremap <silent> <S-Left> :tabprevious<CR>
nnoremap <silent> <S-Right> :tabnext<CR>
nnoremap <silent> <S-C-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-C-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>
hi TabLineSel ctermfg=Red ctermbg=Yellow


" Grep
nnoremap <C-k> :vimgrep! /<C-R><C-W>/j * <CR> :copen <CR>
nnoremap <F4> :ccl <CR>
nnoremap <silent> <Leader>! :Rg <C-R><C-W><CR>

" Look for tags
"nnoremap <C-i> :Tags <cr>

" Basic settings
set hlsearch
set ignorecase
set smartcase
set t_Co=256

"nmap <F9> :!clear ; make && clear && ./a.out<CR>
nmap <F5> :!clear ; cargo run <CR>


" Select without moving cursor
nnoremap & *``


" Change the collor for vim-signify
highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE

set splitbelow             " split splits below the current pane

" Searching {{{
set incsearch       " Search as characters are entered (incremental search)
set hlsearch        " Highlight matches when searching
set ignorecase      " Searches are case insensitive...
set smartcase       " ... unless they contain at least one capital letter
" }}}
"
" feature install myc
"set rtp+=/usr/local/share/myc/vim

set ruler

set cursorline
hi CursorLine cterm=none ctermbg=233

"Folding

hi Folded ctermbg=0 ctermfg=8
set foldlevel=1
set foldmethod=syntax " fold based on syntax highlighting
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

set fillchars=fold:\ 
set foldtext=SimpleFoldText()
function! SimpleFoldText() " {{{2
  let text = getline(v:foldstart)
  if text[-1:] != ' '
    let text .= ' '
  endif
  return text
endfunction



" Omnicompletetion
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->


" Rust
let g:ycm_rust_src_path = '/home/leitao/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1


" FZF
nnoremap <C-f> :Files<CR>
nnoremap <leader><leader> :History:<CR>
nnoremap <C-h> :History<CR>
nnoremap <silent> <Leader>m :FZFMru<CR>


augroup previewWindowPosition
   au!
   autocmd BufWinEnter * call PreviewWindowPosition()
augroup END
function! PreviewWindowPosition()
   if &previewwindow
      wincmd L
   endif
endfunction

