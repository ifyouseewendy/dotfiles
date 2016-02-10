"
" Author:         Di Wen <ifyouseewendy@gmail.com>
" Last Modified:  2015-06-03
"

"""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Vim-scripts repos
Plugin 'genutils'
Plugin 'matchit.zip'
Plugin 'scratch.vim'
Plugin 'scrollfix'
Plugin 'taglist.vim'
Plugin 'tComment'
Plugin 'wombat256.vim'

" Non GitHub repos
Plugin 'git://git.wincent.com/command-t.git'

" Github repos
Plugin 'ifyouseewendy/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'docunext/closetag.vim'
Plugin 'godlygeek/tabular'
Plugin 'Townk/vim-autoclose'
Plugin 'majutsushi/tagbar'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'benmills/vimux'
Plugin 'terryma/vim-expand-region'
Plugin 'duwanis/tomdoc.vim'
" Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme
set t_Co=256
colorscheme wombat256mod

" Basic configuration
syntax on
set nocompatible
set nu
set ruler
set nobackup
set noswapfile
set fdm=marker
set bs=2
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set diffopt+=iwhite " ignore whitespaces with vimdiff

" Tab/indent configuration
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set cindent
autocmd FileType c setlocal tabstop=8 shiftwidth=4 softtabstop=4

" Search configuration
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

" Encoding configuration
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese
set formatoptions+=mM
set ambiwidth=double

" Highlight trailing whitespaceb
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
autocmd Filetype gitcommit setlocal textwidth=72

" Treat all numerals as decimal. Use <c-a> on 007 and return 008, not octal 010
set nrformats=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Playback of recorded keys. http://goo.gl/ZlXa8X
" start by qq, end by q, replay by Q
noremap Q @q

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS with LEADERSHIP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","
nmap <leader>bp orequire'pry';binding.pry<ESC>
" Nab lines from ~/.pry_history (respects 'count')
nmap <Leader>bph :<c-u>let pc = (v:count1 ? v:count1 : 1)<cr>:read !tail -<c-r>=pc<cr> ~/.pry_history<cr>:.-<c-r>=pc-1<cr>:norm <c-r>=pc<cr>==<cr>
nmap <leader>co i# Copyright (c) 2015 Di Wen <ifyouseewendy@gmail.com><ESC>
nmap <leader>no :set nonu<cr>
nmap <leader>nu :set nu<cr>
nmap <leader>nh :nohls<cr>
nmap <leader>so :source ~/.vimrc<cr>
nmap <leader>new :call RenameFile()<cr>
nmap <leader>w :wq<cr>
nmap <leader>s :w<cr>
nmap <leader>e :e!<cr>
nmap <leader>q :q!<cr>
cmap w!! %!sudo tee > /dev/null %
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S')<cr>
command! InsertDate :normal a<c-r>=strftime('%F')<cr>

" System clipboard copy/paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

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

" Quick window split
map <leader>sp :split<cr>
map <leader>vs :vsplit<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" command-t {{{
" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
let g:CommandTCancelMap=['<Esc>', '<C-c>']
let g:CommandTAcceptSelectionSplitMap=['<C-f>']
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
nnoremap <leader><leader> <c-^>
set wildignore+=*.o,*.log,*.obj,.git,*.jpg,*.png,*.gif,vendor/bundle,vendor/cache,tmp,public/download " exclude files from listings

map <leader>ta :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>tv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>tc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>tm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>th :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>tf :CommandTFlush<cr>\|:CommandT config<cr>
map <leader>tl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>tp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>ts :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>tt :CommandTFlush<cr>\|:CommandT test<cr>
map <leader>tg :topleft :vsplit Gemfile<cr>
map <leader>tr :topleft :vsplit config/routes.rb<cr>
" }}}

" scratch.vim"{{{
map <leader>ss :Sscratch<ESC>i
"}}}

" scrollfix.vim"{{{
map <leader>on   :let g:scrollfix=60<cr>
map <leader>off  :let g:scrollfix=-1<cr>"}}}

" vim-airline"{{{
set laststatus=2
let g:airline_powerline_fonts = 1"}}}

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
set complete=.,w,b,u,t,i
set completeopt=longest,menu
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
highlight Pmenu ctermbg=238 gui=bold"}}}

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
inoremap <expr><C-l>  neocomplcache#complete_common_string()
inoremap <expr><C-e>  neocomplcache#close_popup()
inoremap <expr><C-y>  neocomplcache#cancel_popup()
inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>""}}}

" neosnippet"{{{
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
imap <silent><C-l> <Plug>(neosnippet_expand)
smap <silent><C-l> <Plug>(neosnippet_expand)
imap <silent><C-j> <Plug>(neosnippet_jump)
smap <silent><C-j> <Plug>(neosnippet_jump)"}}}

" nerdtree "{{{
let NERDTreeWinSize = 26
let NERDTreeAutoCenter=1
map <F1> :NERDTreeToggle<CR>"}}}

" syntastic "{{{
set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['tex'] }"}}}

" ag.vim
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
map <F7> :tprevious<CR>
map <F8> :tnext<CR>
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
map <Leader>vr :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
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

" vim-expand-region"{{{
vmap v <Plug>(expand_region_expand)
vmap <c-v> <Plug>(expand_region_shrink)"}}}


