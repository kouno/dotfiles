"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

scriptencoding utf-8

if filereadable($HOME . "/.vimrc.bundles")
  source ~/.vimrc.bundles
endif

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
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

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
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js' --exclude='*.sql'"

" Trailing space removal
autocmd FileType c,cpp,java,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

" Tabulation (feature) mapping
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

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

" Save by pressing " s"
nnoremap <leader>s :w<CR>

" Quit by pressing " q<CR>"
nnoremap <leader>q :q

" Open tag in a new tab window.
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Reload Ctags using F12
if executable('ripper-tags')
  map <F12> :!ripper-tags -R --exclude='*.js' --exclude='*.sql' . 2> /dev/null && echo 'Ripper-Tags: Ctags reloaded'<CR>
else
  map <F12> :!ctags -R --exclude='*.js' --exclude='*.sql' . 2> /dev/null && echo 'Ctags reloaded'<CR>
endif

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
au BufNewFile,BufRead *.prawn set filetype=ruby
au BufRead,BufNewFile *.md set filetype=markdown

" color scheme of the moment:
syntax on
colorscheme Tomorrow-Night-Eighties
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable($HOME . "/.vimrc.options")
  source ~/.vimrc.options
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Environment personalisation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
