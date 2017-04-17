"
" Author:         Di Wen <ifyouseewendy@gmail.com>
" Last Modified:  2015-06-03
"

"""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Disable strange Vi defaults
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Github repos
Plugin 'Shougo/neocomplcache'               " Ultimate auto-completion system for Vim.
Plugin 'Townk/vim-autoclose'                " This plugin for Vim enable an auto-close chars feature for you
Plugin 'Yggdroot/indentLine'                " A vim plugin to display the indention levels with thin vertical lines
Plugin 'airblade/vim-gitgutter'             " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks
Plugin 'benmills/vimux'                     " Vim plugin to interact with tmux
Plugin 'danro/rename.vim'                   " Rename the current file in the vim buffer + retain relative path.
Plugin 'docunext/closetag.vim'              " Functions and mappings to close open HTML/XML tags
Plugin 'duwanis/tomdoc.vim'                 " A simple syntax add-on for vim that highlights your TomDoc comments.
Plugin 'ervandew/supertab'                  " Perform all your vim insert mode completions with Tab
Plugin 'godlygeek/tabular'                  " Vim script for text filtering and alignment
Plugin 'majutsushi/tagbar'                  " Vim plugin that displays tags in a window, ordered by scope
Plugin 'rking/ag.vim'                       " Vim plugin for the_silver_searcher, 'ag'
Plugin 'scrooloose/nerdtree'                " A tree explorer plugin for vim
Plugin 'terryma/vim-expand-region'          " Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination.
Plugin 'tomtom/tcomment_vim'                " An extensible & universal comment plugin that also handles embedded filetypes
Plugin 'tpope/vim-endwise'                  " wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Plugin 'tpope/vim-fugitive'                 " a Git wrapper so awesome
Plugin 'tpope/vim-ragtag'                   " Ghetto HTML/XML mappings (formerly allml.vim)
Plugin 'tpope/vim-rails' 							      " rails.vim: Ruby on Rails power tools
Plugin 'tpope/vim-repeat'							      " repeat.vim: enable repeating supported plugin maps with '.'
Plugin 'tpope/vim-surround' 					      " surround.vim: quoting/parenthesizing made simple
Plugin 'vim-ruby/vim-ruby' 						      " Vim/Ruby Configuration Files
Plugin 'vim-scripts/wombat256.vim'          " Wombat for 256 color xterms
Plugin 'ap/vim-css-color'                   " Preview colours in source code while editing
Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tmux-plugins/vim-tmux-focus-events' " Makes the autoread option work properly for terminal vim
Plugin 'kshenoy/vim-signature'              " Plugin to toggle, display and navigate marks
Plugin 'elmcast/elm-vim'                    " Elm plugin for Vim
Plugin 'ctrlpvim/ctrlp.vim'                 " Fuzzy file, buffer, mru, tag, etc finder
Plugin 'ivalkeen/vim-ctrlp-tjump'           " CtrlP extension for fuzzy-search in tag matches (:tjump replacement).
Plugin 'FelikZ/ctrlp-py-matcher'            " Fast vim CtrlP matcher based on python
Plugin 'pangloss/vim-javascript'            " Vastly improved Javascript indentation and syntax support in Vim.
Plugin 'mxw/vim-jsx'                        " React JSX syntax highlighting and indenting for vim.
Plugin 'w0rp/ale'                           " Asynchronous Lint Engine
Plugin 'Chiel92/vim-autoformat'             " Provide easy code formatting in Vim by integrating existing code formatters.

" == Deprecated
"
" Plugin 'Shougo/neosnippet'                " neo-snippet plugin contains neocomplcache snippets source
" Plugin 'christoomey/vim-tmux-navigator'   " Seamless navigation between tmux panes and vim splits
" Plugin 'danchoi/ri.vim'                   " browse ri documentation from Vim
" Plugin 'dracula/vim'                      " A dark theme for Vim
" Plugin 'flazz/vim-colorschemes'           " one colorscheme pack to rule them all!
" Plugin 'hail2u/vim-css3-syntax'           " Add CSS3 syntax support to vim's built-in `syntax/css.vim
" Plugin 'ifyouseewendy/vim-snippets'       " Vim-snipmate default snippets
" Plugin 'scratch.vim'                      " Plugin to create and use a scratch Vim buffer
" Plugin 'taglist.vim'                      " Source code browser
" Plugin 'tpope/vim-abolish'                " Easily search for, substitute, and abbreviate multiple variants of a word
" Plugin 'tpope/vim-dispatch'               " Asynchronous build and test dispatcher
" Plugin 'lambdatoast/elm.vim'
" Plugin 'scrooloose/syntastic'               " Syntax checking hacks for vim

call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme
"set t_Co=256
colorscheme wombat256mod
if has("termguicolors")
  set termguicolors
end

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
autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.god set filetype=ruby
autocmd BufNewFile,BufRead *.mkd, *md set ai formatoptions=tcroqn2 comments=n:>
autocmd BufNewFile,BufRead *.babel set filetype=javascript
autocmd Filetype gitcommit setlocal textwidth=72
autocmd FileType c setlocal tabstop=8 shiftwidth=4 softtabstop=4
autocmd FileType elm set ai ts=4 sw=4 sts=4 et
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

" nvim
if has('nvim')
  " nmap <BS> <C-W>h
  " Fix c-h issue by https://github.com/neovim/neovim/issues/2048#issuecomment-162072750
  "
  " Udpate: Fix by https://github.com/neovim/neovim/issues/2048 without
  " setting c-h as escape [104;5u in iterm

  set mouse-=a                           " Disable mouse
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 "" " Switch cursor shape when using NeoVim
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
nmap <leader>se :sp ~/.vimrc<cr>
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" scratch.vim"{{{
map <leader>ss :Sscratch<ESC>i
"}}}

" vim-airline"{{{
set laststatus=2
set noshowmode

let g:airline_theme='wombat'

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
let g:airline_section_error = '%{ALEGetStatusLine()}'

" When use powerline font, the percentage/line/column chaos displayed
" let g:airline_powerline_fonts = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''
"}}}

" vim-rails "{{{
map <leader>c :Rcontroller<cr>
map <leader>v :Rview<cr>
map <leader>m :Rmodel<cr>
map <leader>h :Rhelper<cr>
map <leader>t :A<cr>
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

" autocomplete"{{{
" set complete=.,w,b,u,t,i
" set completeopt=longest,menu
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" highlight Pmenu ctermbg=238 gui=bold"}}}

" neocomplcache {{{
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_force_overwrite_completefunc = 1
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" Enable omni completion.
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,mkd setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

inoremap <expr><C-g>  neocomplcache#undo_completion()
" inoremap <expr><C-l>  neocomplcache#complete_common_string()
inoremap <expr><C-e>  neocomplcache#close_popup()
inoremap <expr><C-y>  neocomplcache#cancel_popup()
inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>""}}}

" nerdtree "{{{
let NERDTreeWinSize = 26
let NERDTreeAutoCenter=1
map <F1> :NERDTreeToggle<CR>"}}}

" syntastic "{{{
" set statusline+=\ %#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_ruby_checkers       = [ 'mri' ]
" let g:syntastic_ruby_exec           = "/opt/rubies/2.3.3/bin/ruby"
" let g:syntastic_ruby_mri_exec       = "/opt/rubies/2.3.3/bin/ruby"
"
" let g:syntastic_javascript_checkers = [ 'eslint' ]
" " let g:syntastic_html_checkers       = [ 'jshint' ]
" " let g:syntastic_css_checkers        = [ 'csslint' ]
" " let g:syntastic_json_checkers       = [ 'jsonlint' ]
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_cursor_column = 0
" let g:syntastic_enable_highlighting = 1
" let g:syntastic_enable_signs = 1
" let g:syntastic_auto_jump = 0
" let g:syntastic_mode_map = { 'mode': 'active',
"                            \ 'passive_filetypes': ['tex'] }"}}}

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
vmap <leader>= :Tab /=<cr>
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
map <leader>gv :GitGutterPreviewHunk<cr>"}}}

" supertab"{{{
let g:SuperTabDefaultCompletionType = "<c-n>""}}}

" vimux "{{{
" Run the current file with rspec
map <Leader>vr :call VimuxRunCommand("clear; dotenv rspec " . bufname("%"))<CR>
map <Leader>vs :call VimuxRunCommand("clear; dotenv rspec " . bufname("%") . ":" . line('.'))<CR>
" Run the current file with minitest
map <Leader>vl :call VimuxRunCommand("clear; rake test TEST=" . bufname("%") . ":" . line('.'))<CR>
map <Leader>vt :call VimuxRunCommand("clear; rake test TEST=" . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
" map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>"}}}

" vim-expand-region"{{{
vmap v <Plug>(expand_region_expand)
vmap <c-v> <Plug>(expand_region_shrink)"}}}

" vim-fugitive"{{{
" :Gblame
" :Gbrowse
" }}}

" vim-gitgutter"{{{
let g:gitgutter_map_keys = 0 " No need to map keys
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
" }}}

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

" ctrlp.vim"{{{
silent! nnoremap <unique> <silent> <leader>bb :CtrlPBuffer<CR>
silent! nnoremap <unique> <silent> <leader>cl :CtrlPClearCache<CR>
silent! nnoremap <unique> <silent> <leader>dt :CtrlPTag<CR>
silent! nnoremap <unique> <silent> <leader>f :CtrlP<CR>
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:20'
" let g:ctrlp_map = '<\-t>'
let g:ctrlp_max_files = 0
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = [ 'ctrlp-filetpe' ]
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_mruf_max = 0
let g:ctrlp_mruf_relative = 1
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v(_build|build|bower_components|deps|dist|node_modules|public|tmp|vendor\/bundle|elm-stuff)$',
  \ }
"}}}

" ale.vim"{{{
" Run linters only a file is saved
let g:ale_lint_on_text_changed = 'never'

" Use quickfix instead of loclist
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

" Open list to show warnings or errors
let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1

" Enable particular linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'scss': []
\}

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"}}}

"{{{vim-autoformat
noremap == :Autoformat<CR>

let g:formatters_javascript = ['xo_javascript']
"}}}
