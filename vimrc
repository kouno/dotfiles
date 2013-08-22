"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove filetype before Vundle.
filetype off

" Load Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'Lokaltog/vim-powerline'
Bundle 'Raimondi/delimitMate'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'airblade/vim-gitgutter'
Bundle 'benmills/vimux'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'ndreynolds/vim-cakephp'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'pangloss/vim-javascript'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'skalnik/vim-vroom'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/closetag.vim'

" Vim Plugins
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2  " Always display the status line
set nobackup
set nocp          " Use Vim settings, rather then Vi settings
set noswapfile
set nowritebackup
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set nohidden      " delete buffer instead of keeping it open
set backspace=2   " make backspace work like most other apps

" Search by increment (/)
set incsearch
set hlsearch

" Tabs (key) management
set tabstop=2
set shiftwidth=2
set expandtab

" Add numbers to line
set number
set numberwidth=5

" Font
set guifont:Inconsolata-dz-Powerline:14

" Set a 80 column guideline
set colorcolumn=120

" Fold Configuration
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Tab completion options
set wildmode=longest,list,full
set wildmenu
set complete=.,w,t

" Set mac clipboard
set clipboard=unnamed

" Remap map leader to space
let mapleader=' '

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Trailing space removal
autocmd FileType c,cpp,java,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

" Tabulation (feature) mapping
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Remove highlighting
nnoremap <CR> :noh<CR><CR>

" Search multiple tags
nnoremap \] :ts <c-r><c-w><CR>

" Copy to system clipboard
nnoremap <leader>y "+y

" Copy the whole file to system clipboard
nnoremap <leader>a :%y+<CR>

" Quit by pressing zq
nnoremap <leader>s :w<CR>

" Quit by pressing zq
nnoremap <leader>q :q

" Open tag in a new tab window.
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Reload Ctags using F12
map <F12> :!ctags -R . 2> /dev/null && echo 'Ctags reloaded'<CR>

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Improve syntax highlighting
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile *.md set filetype=markdown

" color scheme of the moment:
syntax on
colorscheme Tomorrow-Night-Eighties
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
  autocmd vimenter * if !argc() | NERDTree | endif

" Powerline
  let g:Powerline_symbols = 'fancy'

" TagBar
  nmap <F8> :TagbarToggle<CR>

" Gundo
  nmap <F5> :GundoToggle<CR>

" CtrlP
  set runtimepath^=~/.vim/bundle/ctrlp.vim

  " Infinite search
  let g:ctrlp_max_files=0

  " Default filters
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)|tmp$',
    \ 'file': '\v\.(exe|so|dll)$'
    \ }

" Vroom Config
  let g:vroom_use_vimux = 1
  let g:vroom_use_bundle_exec = 0
  " let g:vroom_spec_command = "zeus rspec "

" Indent-Guides
  let g:indent_guides_auto_colors = 0
  hi IndentGuidesOdd  ctermbg=236
  hi IndentGuidesEven ctermbg=237

" Neo completion
  let g:neocomplcache_enable_at_startup = 1

  " AutoComplPop like behavior.
  let g:neocomplcache_enable_auto_select = 0

  " Recommended key-mappings.
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()

  " Fix conflict with snipmate
  "au BufEnter * inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "<TAB>"
  "au BufEnter * inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "<TAB>"

" Neo snippet
  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)

  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/dotfiles/vim/snippets/'

" Closetag
  au Filetype html,xml,xsl source ~/.vim/bundle/closetag.vim/plugin/closetag.vim 

" vim-gitgutter

  " Remove highlighting
  highlight clear SignColumn
