"
" Author:         Di Wen <ifyouseewendy@gmail.com>
" Last Modified:  2015-06-03
"

"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin("~/.vim/bundle")

Plug 'ferranpm/vim-autopairs'
Plug 'Yggdroot/indentLine'                                      " A vim plugin to display the indention levels with thin vertical lines
Plug 'benmills/vimux'                                           " Vim plugin to interact with tmux
Plug 'ervandew/supertab'                                        " Perform all your vim insert mode completions with Tab
Plug 'majutsushi/tagbar'                                        " Vim plugin that displays tags in a window, ordered by scope
Plug 'rking/ag.vim'                                             " Vim plugin for the_silver_searcher, 'ag'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }          " A tree explorer plugin for vim
Plug 'terryma/vim-expand-region'                                " Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination.
Plug 'tomtom/tcomment_vim'                                      " An extensible & universal comment plugin that also handles embedded filetypes
Plug 'tpope/vim-endwise'                                        " wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-fugitive'                                       " a Git wrapper so awesome
Plug 'tpope/vim-ragtag', { 'for': ['html', 'erb'] }             " Ghetto HTML/XML mappings (formerly allml.vim)
Plug 'tpope/vim-repeat'							                            " repeat.vim: enable repeating supported plugin maps with '.'
Plug 'tpope/vim-surround' 					                            " surround.vim: quoting/parenthesizing made simple
Plug 'itchyny/lightline.vim'                                    " A light and configurable statusline/tabline plugin for Vim
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'                                         " 🌸 A command-line fuzzy finder written in Go
Plug 'janko-m/vim-test'                                         " Run your tests at the speed of thought
Plug 'rakr/vim-one'                                             " Adaptation of one-light and one-dark colorschemes for Vim
Plug 'w0rp/ale'                                                 " Asynchronous Lint Engine
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " Dark powered asynchronous completion framework for neovim/Vim8
Plug 'docunext/closetag.vim',       { 'for': ['html', 'erb'] }  " Functions and mappings to close open HTML/XML tags
Plug 'pangloss/vim-javascript',     { 'for': 'javascript' }     " Vastly improved Javascript indentation and syntax support in Vim.
Plug 'mxw/vim-jsx',                 { 'for': 'javascript' }     " React JSX syntax highlighting and indenting for vim.
Plug 'leafgarland/typescript-vim',  { 'for': 'typescript' }     " Typescript syntax files for Vim
Plug 'neovimhaskell/haskell-vim',   { 'for': 'haskell' }        " Syntax Highlighting and Indentation for Haskell and Cabal
Plug 'dag/vim-fish',                { 'for': 'fish' }           " Vim support for editing fish scripts
Plug 'fatih/vim-go',                { 'for': 'go', 'do': 'make' }      " Go development plugin for Vim
Plug 'mdempsky/gocode',             { 'for': 'go', 'rtp': 'vim', 'do': '~/.vim/bundle/gocode/vim/symlink.sh' } " An autocompletion daemon for the Go programming language
" Plug 'deoplete-plugins/deoplete-go', { 'for': 'go' }            " Asynchronous Go completion for Neovim. deoplete source for Go
Plug 'mattn/webapi-vim',            { 'for': 'rust' }           " vim interface to Web API
Plug 'rust-lang/rust.vim',          { 'for': 'rust' }           " Vim configuration for Rust.
Plug 'https://github.com/alok/notational-fzf-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'kshenoy/vim-signature'                                    " Plugin to toggle, display and navigate marks
Plug 'neoclide/coc.nvim', {'branch': 'release'} 		" Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode

" == Deprecated
"
" Plug 'Shougo/neocomplcache'                                   " Ultimate auto-completion system for Vim.
" Plug 'Shougo/neosnippet'                                      " neo-snippet plugin contains neocomplcache snippets source
" Plug 'christoomey/vim-tmux-navigator'                         " Seamless navigation between tmux panes and vim splits
" Plug 'danchoi/ri.vim'                                         " browse ri documentation from Vim
" Plug 'dracula/vim'                                            " A dark theme for Vim
" Plug 'flazz/vim-colorschemes'                                 " one colorscheme pack to rule them all!
" Plug 'hail2u/vim-css3-syntax'                                 " Add CSS3 syntax support to vim's built-in `syntax/css.vim
" Plug 'ifyouseewendy/vim-snippets'                             " Vim-snipmate default snippets
" Plug 'scratch.vim'                                            " Plugin to create and use a scratch Vim buffer
" Plug 'taglist.vim'                                            " Source code browser
" Plug 'tpope/vim-abolish'                                      " Easily search for, substitute, and abbreviate multiple variants of a word
" Plug 'lambdatoast/elm.vim'
" Plug 'scrooloose/syntastic'                                   " Syntax checking hacks for vim
" Plug 'tpope/vim-rails' 							                          " rails.vim: Ruby on Rails power tools
" Plug 'elmcast/elm-vim'                                        " Elm plugin for Vim
" Plug 'vim-scripts/wombat256.vim'                              " Wombat for 256 color xterms
" Plug 'airblade/vim-gitgutter'                                 " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks
" Plug 'danro/rename.vim'                                       " Rename the current file in the vim buffer + retain relative path.
" Plug 'duwanis/tomdoc.vim'                                     " A simple syntax add-on for vim that highlights your TomDoc comments.
" Plug 'mhartington/oceanic-next'                               " Oceanic Next theme for neovim
" Plug 'tmux-plugins/vim-tmux-focus-events'                     " Makes the autoread option work properly for terminal vim
" Plug 'Townk/vim-autoclose'                                    " This plugin for Vim enable an auto-close chars feature for you
" Plug 'terryma/vim-multiple-cursors'                             " True Sublime Text style multiple selections for Vim
" Plug 'ap/vim-css-color',            { 'for': ['css', 'scss'] }  " Preview colours in source code while editing
" Plug 'vim-ruby/vim-ruby',           { 'for': 'ruby' } 					" Vim/Ruby Configuration Files
" Plug 'godlygeek/tabular'                                        " Vim script for text filtering and alignment

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme
" set t_Co=256
" colorscheme wombat256mod
colorscheme one
set background=dark

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
set textwidth=100
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
highlight ExtraWhitespace ctermbg=red guibg=red
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
nmap <leader>so :source ~/.vimrc<cr>
nmap <leader>se :vsp ~/.vimrc<cr>
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-fish{{{
if &shell =~# 'fish$'
    set shell=sh
endif
""}}}

" scratch.vim"{{{
" map <leader>ss :Sscratch<ESC>i
"}}}

" lightline"{{{
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" }}}

" vim-airline"{{{
" set laststatus=2
" set noshowmode
"
" let g:airline#extensions#branch#enabled = 0
" let g:airline_theme='one'
"
" let g:airline_extensions = ['coc']
"
" let g:airline#extensions#default#layout = [
"       \ [ 'a', 'b', 'c' ],
"       \ [ 'x', 'y', 'z', 'error', 'warning' ]
"       \ ]
"
" " Display airline symbols
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"
"
" " Display ale linting result
" let g:airline#extensions#ale#enabled = 1
"
" " When use powerline font, the percentage/line/column chaos displayed
" " let g:airline_powerline_fonts = 1
"
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
"}}}

" vim-speeddating"{{{
" map <c-i> <c-a>
"}}}

" vim-fugtive"{{{
nmap <leader>gb :Gblame<cr>
" nmap <leader>gd :Gdiff<cr>
" nmap <leader>gh :Git hist<cr>
" nmap <leader>gl :Git l<cr>
" nmap <leader>gs :Gstatus<cr>
" nmap <leader>gc :Gcommit<cr>
" nmap <leader>gt :!tig status<cr>
"}}}

" nerdtree "{{{
let NERDTreeWinSize = 26
let NERDTreeAutoCenter=1
map <F1> :NERDTreeToggle<CR>"}}}

" ag.vim "{{{
let g:ag_working_path_mode="r" "always start searching from your project root instead of the cwd
let g:ag_prg="rg --vimgrep --no-heading --smart-case"

nnoremap <leader>a :Rg 

" Word under cursor
nnoremap <leader>A :Rg! <C-R><C-W><CR>

" Close quickfix window
map <leader>cc :ccl<cr>
map <leader>co :copen<cr>
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction"}}}

" tabular"{{{
" vmap <leader>= :Tab /=<cr>
vmap <leader>: :Tab /:\zs<cr>
vmap <leader>ta :Tab /
"}}}

" tagbar (ctags) "{{{
" Configure according to https://users.rust-lang.org/t/taglist-like-vim-plugin-for-rust/21924/13
nmap <F2> :TagbarToggle<CR>

let g:rust_use_custom_ctags_defs = 1
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/local/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }
"}}}

" supertab"{{{
let g:SuperTabDefaultCompletionType = "<c-n>""}}}

" vim-test && vimux "{{{
let test#strategy = "vimux"

nmap <silent> <leader>tl :TestNearest<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>tg :TestVisit<CR>

nmap <silent> <leader>cb :call VimuxRunCommand("cargo build")<CR>
nmap <silent> <leader>cc :call VimuxRunCommand("cargo check")<CR>
nmap <silent> <leader>cr :call VimuxRunCommand("cargo run")<CR>

let test#javascript#jest#options = {
\ 'suite': '--bail',
\}
"}}}

" vim-expand-region"{{{
vmap v <Plug>(expand_region_expand)
vmap <c-v> <Plug>(expand_region_shrink)"}}}

" indentLine"{{{
let g:indentLine_color_term=239
"}}}

" vim-signature"{{{
"
" Check ':help signature' for default usage
"
" Tweak usage:
"
"   Add:
"
"     + Use mm to auto set next mark, or unset marks:w
"     + Use ma, mb, mc to set mark manually
"
"   Del:
"
"     + Use m<Space> to unset all
"     + Use mm to unset
"
"   Navi:
"
"     + Use mn to jump next, mp to jump prev
"     + Use 'a, 'b, 'c to jump manually
"
"   Show:
"
"     + Use m/
"
let g:SignatureIncludeMarks = 'abcdefghijkloqrstuvwxyz'
let g:SignatureIncludeMarkers = ''

let g:SignatureMap = {
  \ 'ToggleMarkAtLine'   :  "mm",
  \ 'DeleteMark'         :  "dm",
  \ 'PurgeMarks'         :  "m<Space>",
  \ 'GotoNextSpotAlpha'  :  "mn",
  \ 'GotoPrevSpotAlpha'  :  "mp",
  \ 'ListBufferMarks'    :  "m/",
  \}
" }}}

" elm.vim"{{{
" https://github.com/lambdatoast/elm.vim
" nnoremap <leader>el :ElmEvalLine<CR>
" vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
" nnoremap <leader>em :ElmMakeCurrentFile<CR>
"
" :au BufWritePost *.elm ElmMakeCurrentFile
" :au BufWritePost *.elm ElmMakeFile("Main.elm")
" :au! BufWritePost *.elm

" https://github.com/ElmCast/elm-vim
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1
" }}}

" ale.vim"{{{
" Run linters only a file is saved
let g:ale_lint_on_text_changed = 'never'
" Don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

" Use quickfix instead of loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Open list to show warnings or errors
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 0

" Enable particular linters
let g:ale_linters = {
\   'eruby': [],
\   'go': ['gometalinter'],
\   'haskell': ['hlint', 'stack-ghc-mod'],
\   'javascript': ['stylelint', 'eslint', 'flow'],
\   'json': ['jsonlint'],
\   'ruby': ['ruby', 'rubocop'],
\   'rust': ['cargo'],
\   'scss': ['stylelint'],
\   'typescript': ['eslint'],
\   'yaml': ['yamllint'],
\}

let g:ale_rust_cargo_use_clippy = 1
let g:ale_yaml_yamllint_options = "-c ~/.yamllint"

" Use stylelint to lint jsx
" let g:ale_linter_aliases = {'jsx': 'css'}

" Config :ALEFix to use prettier
let g:ale_fixers = {
\  'javascript': ['eslint', 'prettier'],
\  'json': ['prettier'],
\  'ruby': ['rubocop'],
\  'css': ['stylelint'],
\  'haskell': ['brittany'],
\  'rust': ['rustfmt'],
\}

let g:ale_javascript_prettier_options = "--trailing-comma all"
let g:ale_scss_stylelint_options = "--fix"
" let g:ale_haskell_brittany_options = ""

" Run fixer on save
let g:ale_fix_on_save = 0

" Message format
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nmap <silent> <leader>lj <Plug>(ale_next_wrap)
nmap <silent> <leader>lk <Plug>(ale_previous_wrap)

" nmap <F8> <Plug>(ale_fix)
nmap <silent> <leader>= <Plug>(ale_fix)
"}}}

"{{{vim-jsx
let g:jsx_ext_required = 0
"}}}

"{{{fzf
silent! nnoremap <unique> <silent> <leader>f :FZF<CR>
silent! nnoremap <unique> <silent> <leader>b :Buffers<CR>
" silent! nnoremap <unique> <silent> <leader>fg :Commits<CR>
" Maps, Tags, BCommits are also useful ones.

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log'
let g:fzf_commits_log_options ='--pretty=format:"%C(yellow)%h%Creset %ad %s %C(red)[%an]%Creset" --graph --date=short'

command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview(s:ag_opts, 'down:50%')
  \           : fzf#vim#with_preview(s:ag_opts, s:horiz_preview_layout, '?'),
  \   <bang>0)

"}}}

"{{{vim-javascript
let g:javascript_plugin_flow = 1
"}}}

" Use deoplete{{{
" let g:deoplete#enable_at_startup = 1
" inoremap <expr><C-e> deoplete#close_popup()
" set completeopt-=preview
"}}}

" vim-go{{{
function! SetupMapForVimGo()
  nmap <leader>gi <Plug>(go-info)
  nmap <leader>gr <Plug>(go-run)
  nmap <leader>gt <Plug>(go-test)

  nmap <leader>gd :<C-u>GoDeclsDir<CR>
  nmap <leader>gl :<C-u>GoDecls<CR>
endfunction

autocmd FileType go call SetupMapForVimGo()

" Disable default shortcut s-k
let g:go_doc_keywordprg_enabled = 0

" https://github.com/fatih/vim-go/wiki/Tutorial
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
"}}}

" rust.vim{{{
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'
"}}}

"{{{ notational-fzf-vim
" https://github.com/Alok/notational-fzf-vim#optional-settings-and-their-defaults
let g:nv_search_paths = ['~/notes']
nmap <leader>nn :NV<cr>

" Dictionary with string keys and values. Must be in the form 'ctrl-KEY':
" 'command' or 'alt-KEY' : 'command'. See examples below.
let g:nv_keymap = {
                    \ 'ctrl-s': 'split ',
                    \ 'ctrl-v': 'vertical split ',
                    \ 'ctrl-t': 'tabedit'
                    \ }

" String. Must be in the form 'ctrl-KEY' or 'alt-KEY'
let g:nv_create_note_key = 'ctrl-o'

" }}}

"{{{ vim_markdown_folding_style_pythonic
" Use :Toch to open a TOC window
let g:vim_markdown_folding_style_pythonic = 1

"Allow for the TOC window to auto-fit when it's possible for it to shrink
let g:vim_markdown_toc_autofit = 1

"To disable concealing
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Enable strikethrough
let g:vim_markdown_strikethrough = 1

" Adjust new list item indent
let g:vim_markdown_new_list_item_indent = 0
"}}}

"{{{ coc.nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" Implement methods for trait
nnoremap <silent> <space>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<cr>

" Show actions available at this location
nnoremap <silent> <space>a  :CocAction<cr>
"}}}
