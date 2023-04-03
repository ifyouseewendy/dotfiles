" Colorscheme
" colorscheme one
" set background=dark

" Basic configuration
syntax on
set nu
set ruler                                   " Show the line and column number of the cursor position.
set showcmd                                 " Show the size of block one selected in visual mode.
set nobackup
set noswapfile                              " Disable swap to prevent annoying messages.
set fdm=marker
set bs=2
set backspace=indent,eol,start              " Allow backspacing over everything in insert mode
set diffopt+=iwhite                         " Ignore whitespaces with vimdiff
set statusline+=%f                          " Display relative path
set complete-=i                             " Don't scan included files. The .tags file is more performant
set nrformats=                              " Treat all numerals as decimal. Use <c-a> on 007 and return 008, not octal 010
set laststatus=2                            " Always show window statuses, even if there's only one.
set autoread                                " Reload unchanged files automatically.
set fileformats+=mac                        " Support all kind of EOLs by default.
set history=1000                            " Increase history size to 1000 items.
" set cursorline                              " Highlight line under cursor. It helps with navigation.
set scrolloff=8                             " Keep 8 lines above or below the cursor when scrolling.
set sidescroll=1                            " Keep 15 columns next to the cursor when scrolling horizontally.
set sidescrolloff=15
set noerrorbells                            " Disable any annoying beeps on errors.
set visualbell
set nomodeline                              " Don't parse modelines (google 'vim modeline vulnerability')
set iskeyword+=-                            " Use dash as word separator.
set wildchar=<Tab> wildmenu wildmode=full   " Tab triggers buffer-name auto-completion
set wildmenu                                " Autocomplete commands using nice menu in place of window status.

" Line Wrapping
" set textwidth=100
set textwidth=0
set wrapmargin=0
set colorcolumn=+1
set wrap
set linebreak
set showbreak=" "

" Tab/indent configuration
" https://stackoverflow.com/a/48390668/1331774
function! UseTabs()
  set tabstop=4                             " Size of a hard tabstop (ts).
  set shiftwidth=4                          " Size of an indentation (sw).
  set noexpandtab                           " Always uses tabs instead of space characters (noet).
  set autoindent                            " Copy indent from current line when starting a new line (ai).
endfunction

function! UseSpaces()
  set tabstop=2                             " Size of a hard tabstop (ts).
  set shiftwidth=2                          " Size of an indentation (sw).
  set expandtab                             " Always uses spaces instead of tab characters (et).
  set softtabstop=2                         " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
  set autoindent                            " Copy indent from current line when starting a new line.
  set smarttab                              " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction
call UseSpaces()

" Search configuration
set smartcase                               " Don't ignore case when search has capital letter (although also don't ignore case by default).
set ignorecase                              " Ignore case when searching.
set hlsearch                                " Enable search highlighting.
set incsearch                               " Enable highlighted case-insensitive incremential search.

" Undo file settings
set undodir=~/.vim/.undo
set undofile
set undolevels=1000
set undoreload=10000

" Encoding configuration
set encoding=utf-8 nobomb
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese
set formatoptions+=mM
set ambiwidth=double

" Highlight trailing whitespace
" highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Filetype detection
autocmd BufNewFile,BufRead Thorfile set filetype=ruby
autocmd BufNewFile,BufRead *.thor set filetype=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Capfile set filetype=ruby
autocmd BufNewFile,BufRead pryrc set filetype=ruby
autocmd BufNewFile,BufRead *.god set filetype=ruby
autocmd BufNewFile,BufRead *.less set filetype=css
" autocmd BufNewFile,BufRead *.mkd, *md set ai formatoptions=tcroqn2 comments=n:> columns=120 textwidth=80
autocmd BufNewFile,BufRead *.babel set filetype=javascript
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript
autocmd BufNewFile,BufRead *.wat set filetype=wast
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd Filetype gitcommit setlocal textwidth=72
autocmd FileType c setlocal tabstop=8 shiftwidth=4 softtabstop=4
autocmd FileType elm set ai ts=4 sw=4 sts=4 et
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype go setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype wast setlocal ts=2 sw=0 sts=0 expandtab
autocmd Filetype rust setlocal ts=4 sw=4 sts=0 expandtab
" autocmd Filetype rust call UseTabs()
" Disable quote concealing in JSON files
autocmd Filetype json :IndentLinesDisable
autocmd Filetype json setlocal conceallevel=0
autocmd BufNewFile,BufRead Justfile set filetype=make

" Filetype colorschemes

" nvim
if has('nvim')
  " nmap <BS> <C-W>h
  " Fix c-h issue by https://github.com/neovim/neovim/issues/2048#issuecomment-162072750
  "
  " Udpate: Fix by https://github.com/neovim/neovim/issues/2048 without
  " setting c-h as escape [104;5u in iterm

  set mouse-=a                           " Disable mouse
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'

  if (has("termguicolors"))
    set termguicolors
  endif
endif

if !has('nvim')
  set ttyfast " Send more characters at a given time
endif

" Loading python is slow when first start neovim
" https://github.com/neovim/neovim/issues/2437
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move around splits with <c-hjkl>
nmap <C-k> <C-w><Up>
nmap <C-j> <C-w><Down>
nmap <C-l> <C-w><Right>
nmap <C-h> <C-w><Left>

imap <C-k> <Up>
imap <C-j> <Down>
imap <C-l> <Right>
imap <C-h> <Left>

" Buffer and tab operations with <s-hjkl>
nnoremap <s-h> :bprevious<cr>
nnoremap <s-l> :bnext<cr>
nnoremap <s-j> :tabnext<cr>
nnoremap <s-k> :tabprev<cr>
nnoremap <s-t> :tabnew<cr>

" Window navi
nnoremap <c-w>j 3<c-w>+
nnoremap <c-w>k 3<c-w>-
nnoremap <c-w>h 3<c-w><
nnoremap <c-w>l 3<c-w>>

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <c-n> :nohlsearch<cr>
endfunction
call MapCR()

" Paste with <F3>
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>

" Remove trailing whitespaces
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Replace invalid quotes
" https://stackoverflow.com/questions/43384677/in-vim-how-do-i-efficiently-search-and-replace-and-with-normal-double-quotes
function! ReplaceQuotes()
  silent! %s/[“”]/"/g
  silent! %s/’/'/g
endfunction
nnoremap <silent> <F6> :call ReplaceQuotes()<CR>


" Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Playback of recorded keys. http://goo.gl/ZlXa8X
" start by qq, end by q, replay by Q
noremap Q @q

" Auto center on matched string.
noremap n nzz
noremap N Nzz

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS with LEADERSHIP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","
nmap <leader>bp orequire'pry-byebug';binding.pry<ESC>
" Nab lines from ~/.pry_history (respects 'count')
nmap <Leader>bph :<c-u>let pc = (v:count1 ? v:count1 : 1)<cr>:read !tail -<c-r>=pc<cr> ~/.pry_history<cr>:.-<c-r>=pc-1<cr>:norm <c-r>=pc<cr>==<cr>
" nmap <leader>co i# Copyright (c) 2015 Di Wen <ifyouseewendy@gmail.com><ESC>
nmap <leader>no :set nonu<cr>
nmap <leader>nu :set nu<cr>
nmap <leader>nh :nohls<cr>
nmap <leader>so :source ~/.config/nvim/init.lua<cr>
nmap <leader>se :vsp ~/.config/nvim/init.lua<cr>
nmap <leader>w :wq<cr>
nmap <leader>s :w<cr>
nmap <leader>e :e!<cr>
nmap <leader>q :q!<cr>
cmap w!! %!sudo tee > /dev/null %
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S')<cr>
command! InsertDate :normal a<c-r>=strftime('%a, %d %b %Y')<cr>
nnoremap <F5> :InsertDate<cr>

" System clipboard copy/paste
" set clipboard=unnamedplus
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Quick window split
map <leader>sp :split<cr>
map <leader>vs :vsplit<cr>

" Select entire line without newline
nmap <leader>V ^v$h

" Enter normal mode in terminal mode (:term fish)
nmap <leader>T :term fish<cr>GA
tnoremap <C-[><C-[> <C-\><C-n>

" Open TOC in markdown files
nmap <leader>tc :Toch<cr>
