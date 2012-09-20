" Default settings
set laststatus=2  " Always display the status line
set nobackup
set nocp          " Use Vim settings, rather then Vi settings
set noswapfile
set nowritebackup
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle "pangloss/vim-javascript"
Bundle 'astashov/vim-ruby-debugger'
Bundle 'kaichen/vim-snipmate-ruby-snippets'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'msanders/snipmate.vim'
Bundle 'ndreynolds/vim-cakephp'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'vim-scripts/ZoomWin'

" Vim Plugins
filetype plugin indent on

autocmd vimenter * if !argc() | NERDTree | endif

" Trailing space removal
autocmd FileType c,cpp,java,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Improve syntax highlighting
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile *.md set filetype=markdown

" color scheme of the moment:
syntax on
colorscheme tomorrow-night-eighties
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0"

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Search by increment (/)
set incsearch
set hlsearch

" Tabs (key) management
set cindent
set tabstop=2
set shiftwidth=2
set expandtab

" Add numbers to line
set number
set numberwidth=5

" Font
set guifont:Inconsolata:h14

" Set a 80 column guideline
set colorcolumn=80

" Fold Configuration
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Tabulation (feature) mapping
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" TagBar
nmap <F8> :TagbarToggle<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Remove highlighting
nnoremap <CR> :noh<CR><CR>

" Search multiple tags
nnoremap \] :ts <c-r><c-w><CR>

" Reload Ctags using F12
map <C-F12> :!ctags -R . 2> /dev/null && echo 'Ctags reloaded'

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Debugger
let g:ruby_debugger_progname = 'mvim'

" Tab completion options
set wildmode=longest,list,full
set wildmenu
set complete=.,w,t

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

" Remap map leader to ','
let mapleader=','
