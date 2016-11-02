call pathogen#infect()
call pathogen#helptags()

set nocompatible               " be iMproved
 filetype off                   " required!

set relativenumber "display line numbers"
" set number "display line numbers"
set incsearch
set relativenumber
set colorcolumn=80
set ruler
set nowrap
"set cursorline
set autoindent
syntax enable

" Whitespace Stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set expandtab
set list listchars=tab:\ \ ,trail:·

" search
set hlsearch

" Tab Completion
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

" Handlebars Abbreviations
let g:mustache_abbreviations = 1

" Force Syntastic to Use RVM Managed Ruby Executable
"let g:syntastic_ruby_mri_exec = '~/.rvm/rubies/ruby-2.1.6/bin/ruby'

" Ctrl P ignore
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

autocmd! bufwritepost .vimrc source ~./vimrc

:imap jj <Esc>
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

let &winwidth = &columns * 6 / 10
let &winheight = &lines * 6 / 10


" Alignment stuffs

autocmd! VimEnter * AlignCtrl p0
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

