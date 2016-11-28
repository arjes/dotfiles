let g:python_host_prog='/usr/local/bin/python'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
"Plug 'vim-syntastic/syntastic'
Plug 'neomake/neomake'
Plug 'kchmck/vim-coffee-script'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-endwise'
Plug 'isRuslan/vim-es6'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'airblade/vim-gitgutter'
Plug 'janko-m/vim-test'
"Plug 'Valloric/YouCompleteMe'
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
"Plug 'wfleming/vim-codeclimate'
Plug 'roman/golden-ratio'

call plug#end()

filetype off
set relativenumber
set incsearch
set colorcolumn=80
set ruler
set nowrap
set autoindent
syntax enable

set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set expandtab
set list listchars=tab:\ \ ,trail:·

set hlsearch

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-P>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

set wildignore+=*/vendor/*,*/tmp/*,*/dist/*,*/node_modules/*,*.so,*.swp,*.zip     " MacOSX/Linux

"disable arrow keys in insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
"disable arrow keys in normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Ctrl-j/k deletes line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/.*/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/.*/d<CR>``:noh<CR>
nnoremap <silent><Tab>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><Tab>k :set paste<CR>m`O<Esc>``:set nopaste<CR>

" save and check ruby syntax
command! Rubyw :w | :! ruby -cw %

filetype plugin indent on     " required!
filetype plugin on

imap jj <Esc>
" Solarized stuff
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

function! s:RubyHashSyntaxToggle() range
  if join(getline(a:firstline, a:lastline)) =~# '=>'
    silent! execute a:firstline . ',' . a:lastline . 's/[^{,]*[{,]\?\zs:\([^: ]\+\)\s*=>/\1:/g'
  else
    silent! execute a:firstline . ',' . a:lastline . 's/[^{,]*[{,]\?\zs\([^: ]\+\):/:\1 =>/g'
  endif
endfunction
command! -bar -range RubyHashSyntaxToggle <line1>,<line2>call s:RubyHashSyntaxToggle()
noremap <Leader>rh :RubyHashSyntaxToggle<CR>
nmap <leader>nt :NERDTreeToggle<cr>

"let &winwidth = &columns * 6 / 10
"let &winheight = &lines * 6 / 10


" Alignment stuffs
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Remove trailing whitespce
autocmd FileType ruby,c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e

" Vim Test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "neovim"
