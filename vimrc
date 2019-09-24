"
" Author:         Di Wen <ifyouseewendy@gmail.com>
" Last Modified:  2015-06-03
"

"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin("~/.vim/bundle")

Plug 'ferranpm/vim-autopairs'
" Plug 'Townk/vim-autoclose'                                      " This plugin for Vim enable an auto-close chars feature for you
Plug 'Yggdroot/indentLine'                                      " A vim plugin to display the indention levels with thin vertical lines
Plug 'benmills/vimux'                                           " Vim plugin to interact with tmux
Plug 'ervandew/supertab'                                        " Perform all your vim insert mode completions with Tab
Plug 'godlygeek/tabular'                                        " Vim script for text filtering and alignment
Plug 'majutsushi/tagbar'                                        " Vim plugin that displays tags in a window, ordered by scope
Plug 'rking/ag.vim'                                             " Vim plugin for the_silver_searcher, 'ag'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }          " A tree explorer plugin for vim
Plug 'terryma/vim-expand-region'                                " Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination.
Plug 'tomtom/tcomment_vim'                                      " An extensible & universal comment plugin that also handles embedded filetypes
Plug 'tpope/vim-endwise'                                        " wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-fugitive'                                       " a Git wrapper so awesome
Plug 'tpope/vim-ragtag'                                         " Ghetto HTML/XML mappings (formerly allml.vim)
Plug 'tpope/vim-repeat'							                            " repeat.vim: enable repeating supported plugin maps with '.'
Plug 'tpope/vim-surround' 					                            " surround.vim: quoting/parenthesizing made simple
Plug 'vim-airline/vim-airline'                                  " Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'
Plug 'tmux-plugins/vim-tmux-focus-events'                       " Makes the autoread option work properly for terminal vim
Plug 'kshenoy/vim-signature'                                    " Plugin to toggle, display and navigate marks
Plug 'junegunn/fzf.vim'                                         " 🌸 A command-line fuzzy finder written in Go
Plug 'janko-m/vim-test'                                         " Run your tests at the speed of thought
Plug 'rakr/vim-one'                                             " Adaptation of one-light and one-dark colorschemes for Vim
Plug 'terryma/vim-multiple-cursors'                             " True Sublime Text style multiple selections for Vim
Plug 'tpope/vim-dispatch'                                       " dispatch.vim: asynchronous build and test dispatcher
Plug 'w0rp/ale'                                                 " Asynchronous Lint Engine
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " Dark powered asynchronous completion framework for neovim/Vim8
Plug 'vim-ruby/vim-ruby',           { 'for': 'ruby' } 					" Vim/Ruby Configuration Files
Plug 'docunext/closetag.vim',       { 'for': ['html', 'erb'] }  " Functions and mappings to close open HTML/XML tags
Plug 'pangloss/vim-javascript',     { 'for': 'javascript' }     " Vastly improved Javascript indentation and syntax support in Vim.
Plug 'mxw/vim-jsx',                 { 'for': 'javascript' }     " React JSX syntax highlighting and indenting for vim.
Plug 'leafgarland/typescript-vim',  { 'for': 'typescript' }     " Typescript syntax files for Vim
" Plug 'ap/vim-css-color',            { 'for': ['css', 'scss'] }  " Preview colours in source code while editing
Plug 'neovimhaskell/haskell-vim',   { 'for': 'haskell' }        " Syntax Highlighting and Indentation for Haskell and Cabal
Plug 'dag/vim-fish',                { 'for': 'fish' }           " Vim support for editing fish scripts
Plug 'fatih/vim-go',                { 'for': 'go', 'do': 'make' }      " Go development plugin for Vim
Plug 'mdempsky/gocode',             { 'for': 'go', 'rtp': 'vim', 'do': '~/.vim/bundle/gocode/vim/symlink.sh' } " An autocompletion daemon for the Go programming language
Plug 'deoplete-plugins/deoplete-go', { 'for': 'go' }            " Asynchronous Go completion for Neovim. deoplete source for Go
Plug 'rust-lang/rust.vim',          { 'for': 'rust' }           " Vim configuration for Rust.

" == Deprecated
"
" Plug 'Shougo/neocomplcache'             " Ultimate auto-completion system for Vim.
" Plug 'Shougo/neosnippet'                " neo-snippet plugin contains neocomplcache snippets source
" Plug 'christoomey/vim-tmux-navigator'   " Seamless navigation between tmux panes and vim splits
" Plug 'danchoi/ri.vim'                   " browse ri documentation from Vim
" Plug 'dracula/vim'                      " A dark theme for Vim
" Plug 'flazz/vim-colorschemes'           " one colorscheme pack to rule them all!
" Plug 'hail2u/vim-css3-syntax'           " Add CSS3 syntax support to vim's built-in `syntax/css.vim
" Plug 'ifyouseewendy/vim-snippets'       " Vim-snipmate default snippets
" Plug 'scratch.vim'                      " Plugin to create and use a scratch Vim buffer
" Plug 'taglist.vim'                      " Source code browser
" Plug 'tpope/vim-abolish'                " Easily search for, substitute, and abbreviate multiple variants of a word
" Plug 'lambdatoast/elm.vim'
" Plug 'scrooloose/syntastic'             " Syntax checking hacks for vim
" Plug 'tpope/vim-rails' 							    " rails.vim: Ruby on Rails power tools
" Plug 'elmcast/elm-vim'                  " Elm plugin for Vim
" Plug 'vim-scripts/wombat256.vim'        " Wombat for 256 color xterms
" Plug 'airblade/vim-gitgutter'           " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks
" Plug 'danro/rename.vim'                 " Rename the current file in the vim buffer + retain relative path.
" Plug 'duwanis/tomdoc.vim'               " A simple syntax add-on for vim that highlights your TomDoc comments.
" Plug 'mhartington/oceanic-next'         " Oceanic Next theme for neovim

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
set wrap linebreak                          " Wrap lines by default
set showbreak=" "
set noerrorbells                            " Disable any annoying beeps on errors.
set visualbell
set nomodeline                              " Don't parse modelines (google 'vim modeline vulnerability')
set iskeyword+=-                            " Use dash as word separator.
set wildchar=<Tab> wildmenu wildmode=full   " Tab triggers buffer-name auto-completion
set wildmenu                                " Autocomplete commands using nice menu in place of window status.

" Tab/indent configuration
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent                              " Autoindent when starting new line, or using o or O
set cindent
set smarttab                                " Use 'shiftwidth' when using <Tab> in front of a line. By default it's used only for shift commands (<, >).

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
" set encoding=utf-8
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
autocmd BufNewFile,BufRead *.mkd, *md set ai formatoptions=tcroqn2 comments=n:> columns=120
autocmd BufNewFile,BufRead *.babel set filetype=javascript
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.wat set filetype=wast
autocmd Filetype gitcommit setlocal textwidth=72
autocmd FileType c setlocal tabstop=8 shiftwidth=4 softtabstop=4
autocmd FileType elm set ai ts=4 sw=4 sts=4 et
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype go setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype wast setlocal ts=2 sw=0 sts=0 expandtab

" Filetype colorschemes

" nvim
if has('nvim')
  " nmap <BS> <C-W>h
  " Fix c-h issue by https://github.com/neovim/neovim/issues/2048#issuecomment-162072750
  "
  " Udpate: Fix by https://github.com/neovim/neovim/issues/2048 without
  " setting c-h as escape [104;5u in iterm

  set mouse-=a                           " Disable mouse
  let g:python_host_prog = '/Users/wendi/.pyenv/versions/2.7.11/bin/python'
  let g:python3_host_prog = '/Users/wendi/.pyenv/versions/neovim3/bin/python'

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
command! InsertDate :normal a<c-r>=strftime('%F')<cr>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-fish{{{
if &shell =~# 'fish$'
    set shell=sh
endif
""}}}

" scratch.vim"{{{
map <leader>ss :Sscratch<ESC>i
"}}}

" vim-airline"{{{
set laststatus=2
set noshowmode

let g:airline_theme='one'

let g:airline_extensions = []

let g:airline#extensions#default#layout = [
      \ [ 'a', 'error', 'warning', 'c' ],
      \ [ 'y', 'z' ]
      \ ]

" Display airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Display ale linting result
let g:airline#extensions#ale#enabled = 1

" When use powerline font, the percentage/line/column chaos displayed
" let g:airline_powerline_fonts = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''
"}}}

" vim-rails "{{{
" map <leader>c :Rcontroller<cr>
" map <leader>v :Rview<cr>
" map <leader>m :Rmodel<cr>
" map <leader>h :Rhelper<cr>
" map <leader>t :A<cr>
" function! OpenTestAlternate()
"   let new_file = AlternateForCurrentFile()
"   exec ':e ' . new_file
" endfunction
" function! AlternateForCurrentFile()
"   let current_file = expand("%")
"   let new_file = current_file
"   let in_spec = match(current_file, '^spec/') != -1
"   let going_to_spec = !in_spec
"   let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') || match(current_file, '\<helpers\>') != -1
"   if going_to_spec
"     if in_app
"       let new_file = substitute(new_file, '^app/', '', '')
"     end
"     let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
"     let new_file = 'spec/' . new_file
"   else
"     let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
"     let new_file = substitute(new_file, '^spec/', '', '')
"     if in_app
"       let new_file = 'app/' . new_file
"     end
"   endif
"   return new_file
" endfunction
" nnoremap <leader>. :call OpenTestAlternate()<cr>
" nnoremap <leader>s :call OpenTestAlternate()<cr>
"map <leader>u :Runittest<cr>
"map <leader>s :Rfunctionaltest<cr>"}}}

" vim-speeddating"{{{
" map <c-i> <c-a>
"}}}

" vim-fugtive"{{{
nmap <leader>gb :Gblame<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gh :Git hist<cr>
nmap <leader>gl :Git l<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gt :!tig status<cr>"}}}

" nerdtree "{{{
let NERDTreeWinSize = 26
let NERDTreeAutoCenter=1
map <F1> :NERDTreeToggle<CR>"}}}

" ag.vim "{{{
let g:ag_working_path_mode="r" "always start searching from your project root instead of the cwd
if executable('Ag')
  let g:ag_prg="Ag --vimgrep"

  nnoremap <leader>a :Ag 

  " Word under cursor
  nnoremap <leader>A :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif

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
nmap <F2> :TagbarToggle<CR>
map <F5> :!/usr/local/bin/ctags --recurse=yes --languages=-javascript --exclude=.git --exclude=log --fields=+iaS --extra=+q .<CR>
map <F6> :tprevious<CR>
map <F7> :tnext<CR>
set tags=./tags;
"}}}

" vim-gitgutter"{{{
map <leader>gn :GitGutterNextHunk<cr>
map <leader>gp :GitGutterPrevHunk<cr>
map <leader>ga :GitGutterStageHunk<cr>
map <leader>gr :GitGutterRevertHunk<cr>
map <leader>gv :GitGutterPreviewHunk<cr>

let g:gitgutter_map_keys = 0 " No need to map keys
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
" }}}

" supertab"{{{
let g:SuperTabDefaultCompletionType = "<c-n>""}}}

" vim-text && vimux "{{{
let test#strategy = "vimux"

nmap <silent> <leader>tl :TestNearest<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>tg :TestVisit<CR>

let test#javascript#jest#options = {
\ 'suite': '--bail',
\}
"}}}

" vim-dispatch "{{{
nnoremap <leader>r :Dispatch<CR>
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
" }}}

" elm-vim"{{{
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
set rtp+=/usr/local/opt/fzf

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
let g:deoplete#enable_at_startup = 1
inoremap <expr><C-e> deoplete#close_popup()
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
