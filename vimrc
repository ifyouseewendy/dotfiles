"
" Author:         Larry Lv <larrylv1990@gmail.com>
" Last Modified:  August 05, 2013
"

filetype off " required by vundle

set rtp+=~/.gmarik-vundle
call vundle#rc()

" non GitHub repos
Bundle 'git://git.wincent.com/command-t.git'

" vim-scripts repos
Bundle 'genutils'
Bundle 'matchit.zip'
Bundle 'scratch.vim'
Bundle 'scrollfix'
Bundle 'taglist.vim'
Bundle 'tComment'
Bundle 'wombat256.vim'

" original repos on GitHub
Bundle 'bling/vim-airline'
Bundle 'larrylv/vim-snippets'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-dispatch'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'vim-ruby/vim-ruby'
Bundle 'depuracao/vim-rdoc'
Bundle 'pangloss/vim-javascript'
Bundle 'docunext/closetag.vim'
Bundle 'godlygeek/tabular'
Bundle 'Townk/vim-autoclose'
Bundle 'tudorprodan/html_annoyance.vim'
Bundle 'majutsushi/tagbar'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'airblade/vim-gitgutter'
Bundle 'ervandew/supertab'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'benmills/vimux'

" set colorscheme
set t_Co=256
colorscheme wombat256mod

" basic configuration
syntax on
set nocompatible
set nu
set ruler
set nobackup
set fdm=marker
set bs=2
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set diffopt+=iwhite " ignore whitespaces with vimdiff

" tab/indent configuration
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set cindent
autocmd FileType c setlocal tabstop=8 shiftwidth=4 softtabstop=4

filetype plugin indent on

" search configuration
set smartcase
set ignorecase
set hlsearch
set incsearch


" Tab triggers buffer-name auto-completion
set wildchar=<Tab> wildmenu wildmode=full

" Undo file settings
set undodir=~/.vim/.undo
set undofile
set undolevels=1000
set undoreload=10000

" Misc Key Maps
imap <c-c> <ESC>
imap jj <ESC>
" Move around splits with <c-hjkl>
nmap <C-k> <C-w><Up>
nmap <C-j> <C-w><Down>
nmap <C-l> <C-w><Right>
nmap <C-h> <C-w><Left>
" Buffer and tab operations with <s-hjkl>
nnoremap <s-h> :bprevious<cr>
nnoremap <s-l> :bnext<cr>
nnoremap <s-j> :tabnext<cr>
nnoremap <s-k> :tabprev<cr>
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

" use comma as <Leader> key instead of backslash
let mapleader=","

" insert binding.pry
map <leader>d obinding.pry<ESC>

" insert copyright
map <leader>au i# Copyright (c) 2015 Di Wen <ifyouseewendy@gmail.com><ESC>

" map toggling line number
nmap <leader>no :set nonu<cr>
nmap <leader>nu :set nu<cr>

" map no highlight search
nmap <leader>nh :nohls<cr>

" source vimrc
map <leader>so :source ~/.vimrc<cr>

" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>new :call RenameFile()<cr>

" edit for cronjobs
if $VIM_CRONTAB == 'true'
  set nobackup
  set nowritebackup
endif

" close quickfix window
map <leader>cc :ccl<cr>
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" increase number, <c-a> is prefix for tmux.
map <c-i> <c-a>

" close current window
map <leader>w :wq<cr>

" force write and save
cmap w!! %!sudo tee > /dev/null %

" Insert the current time
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S')<cr>

" Shortcuts for vim-gitgutter
map <leader>ggn :GitGutterNextHunk<cr>
map <leader>ggp :GitGutterPrevHunk<cr>

let g:SuperTabDefaultCompletionType = "<c-n>"

" Syntastic settings"{{{
set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['tex'] }"}}}

" Autocomplete configuration"{{{
set complete=.,w,b,u,t,i
set completeopt=longest,menu
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
highlight Pmenu ctermbg=238 gui=bold

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

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Set snips_author & snips_email for snipMate.vim
let g:snips_author="Larry Lv"
let g:snips_email="larrylv1990@gmail.com""

imap <silent><C-l> <Plug>(neosnippet_expand)
smap <silent><C-l> <Plug>(neosnippet_expand)
imap <silent><C-j> <Plug>(neosnippet_jump)
smap <silent><C-j> <Plug>(neosnippet_jump)
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><C-e>  neocomplcache#close_popup()
inoremap <expr><C-y>  neocomplcache#cancel_popup()
"inoremap <expr><C-h> neocomplcache#smart_close_popup()
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>""}}}

" Highlight trailing whitespace"{{{
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()"}}}

" CommandT plugin configuration {{{
" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
let g:CommandTCancelMap=['<Esc>', '<C-c>']
let g:CommandTAcceptSelectionSplitMap=['<C-f>']
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
nnoremap <leader><leader> <c-^>
set wildignore+=*.o,*.log,*.obj,.git,*.jpg,*.png,*.gif,vendor/bundle,vendor/cache,tmp,public/download " exclude files from listings

map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT config<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>gg :topleft :vsplit Gemfile<cr>
map <leader>gr :topleft :vsplit config/routes.rb<cr>
" }}}

" NERDTree plugin configuration"{{{
let NERDTreeWinSize = 26
let NERDTreeAutoCenter=1
map <F1> :NERDTreeToggle<CR>"}}}

" ctags/Tagbar plugin configuration"{{{
nmap <F2> :TagbarToggle<CR>
map <F5> :!/usr/local/bin/ctags --recurse=yes --languages=-javascript --exclude=.git --exclude=log --fields=+iaS --extra=+q .<CR>
map <F7> :tprevious<CR>
map <F8> :tnext<CR>
set tags=./tags;"}}}

" ack.vim configuration"{{{
if executable("ack")
    " ,a to Ack (search in files)
    nnoremap <leader>a :Ack 
    let g:ackprg="ack -H --smart-case --nocolor --nogroup --column --nojs --nocss --ignore-dir=.binstubs --ignore-dir=vendor --ignore-dir=log --ignore-dir=tmp --ignore-file=is:tags"
    let g:ackhighlight=1
endif
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>"}}}

" vim-javascript plugin configuration"{{{
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc""}}}

" filetype detection"{{{
autocmd BufNewFile,BufRead Thorfile set filetype=ruby
autocmd BufNewFile,BufRead *.thor set filetype=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Capfile set filetype=ruby
autocmd BufNewFile,BufRead pryrc set filetype=ruby
autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.god set filetype=ruby
autocmd BufNewFile,BufRead *.mkd, *md set ai formatoptions=tcroqn2 comments=n:>
autocmd Filetype gitcommit setlocal textwidth=72"}}}

" encoding configuration {{{
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese
set formatoptions+=mM
set ambiwidth=double
"}}}

" gb2312 encoding configuration {{{
"set encoding=gb2312
"set fileencoding=chinese
"set fileencodings=chinese,ucs-bom,utf-8
"set formatoptions+=mM
"set ambiwidth=double
"}}}

" vimux configuration"{{{
" Run the current file with rspec
map <Leader>vs :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
" Run the current file with minitest
map <Leader>vt :call VimuxRunCommand("clear; rake test " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>"}}}

" system clipboard copy/paste"{{{
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P"}}}


" scratch.vim"{{{
map <leader>s :Sscratch<ESC>"}}}

" scrollfix.vim"{{{
map <leader>on   :let g:scrollfix=60<cr>
map <leader>off  :let g:scrollfix=-1<cr>"}}}

" vim-airline"{{{
set laststatus=2
let g:airline_powerline_fonts = 1"}}}

" Map shortcuts for vim-rails "{{{
map <leader>c :Rcontroller<cr>
map <leader>v :Rview<cr>
map <leader>m :Rmodel<cr>
map <leader>h :Rhelper<cr>
map <leader>t :A<cr>
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>
nnoremap <leader>s :call OpenTestAlternate()<cr>
"map <leader>u :Runittest<cr>
"map <leader>s :Rfunctionaltest<cr>"}}}

