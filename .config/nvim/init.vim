let g:python_host_prog='/usr/local/bin/python'

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if !executable('ag') &&  executable('brew')
  silent !brew install the_silver_searcher
endif

" Plugin Installation ---------------------- {{{
call plug#begin('~/.vim/plugged')

" Snippets ---- {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}

" AutoComplete ----- {{
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-completion-manager'
" }}

" Navigation ------- {{{
Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeFind', 'NERDTreeToggle' ] }
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'sjl/gundo.vim'

"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'neomake/neomake'
Plug 'craigemery/vim-autotag'
Plug 'vimwiki/vimwiki'

Plug 'altercation/vim-colors-solarized'

" Ruby ------------ {{{
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
" }}}

Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'janko-m/vim-test'

" Git ------- {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" }}}


" Typescript -------- {{{
Plug 'Quramy/vim-js-pretty-template', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'mhartington/nvim-typescript' ", { 'commiddt': '3b71bb975dfef16a40f92aed6656f7d00ec3be68', 'for': 'typescript' }
" }}}

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()
"" }}}
"
"
""Tests
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}
"if executable('~/.langServers/typescript.sh')
  "let g:LanguageClient_serverCommands.typescript = ['javascript-typescript-stdio'] ", '--enable-jaeger']
  "let g:LanguageClient_serverCommands.typescript = ['~/.langServers/typescript.sh'] ", '--enable-jaeger']
  let g:LanguageClient_serverCommands.go = ['~/.langServers/go.sh'] 
  " Use LanguageServer for omnifunc completion
  autocmd FileType go setlocal omnifunc=LanguageClient#complete
  autocmd FileType go :LanguageClientStart<cr>
"else
"  echom "javascript-typescript-langserver not installed!\n"
"endif

autocmd FileType go nnoremap <buffer>
  \ <leader>ld :call LanguageClient_textDocument_definition()<cr>
" <leader>lh for type info under cursor
autocmd FileType go nnoremap <buffer>
  \ <leader>lh :call LanguageClient_textDocument_hover()<cr>
" <leader>lr to rename variable under cursor
autocmd FileType go nnoremap <buffer>
  \ <leader>lr :call LanguageClient_textDocument_rename()<cr>

" FZF Config ----- {{{
let g:fzf_layout = { 'window': '-tabnew' }
" }}}

" Ack.vim ---- {{{
let g:ackprg = 'ag --nogroup --nocolor --column'
" }}}
" Snippet Hotkey config ---- {{{
let g:UltiSnipsSnippetsDir='~/.UltiSnips'
inoremap <leader><tab> <esc>:call UltiSnips#ExpandSnippet()<cr>
"let g:UltiSnipsExpandTrigger="<C-U>"
"imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
"imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")
" }}}

"filetype off
set relativenumber
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
set incsearch

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"

    return "\<C-P>"
  endif
endfunction
"inoremap <Tab> <C-R>=CleverTab()<CR>

set wildignore+=*/coverage/*,*/vendor/*,*/tmp/*,*/dist/*,*/node_modules/*,*.so,*.swp,*.zip     " MacOSX/Linux

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


filetype plugin indent on     " required!
filetype plugin on

" Color Theme ---------------------- {{{
" Solarized stuff
let g:solarized_termtrans = 1
" Setting backgroudn to light to keep Flux Readable
if strftime("%H") > 20 || strftime("%H") < 7
  set background=light
else
  set background=dark
endif
colorscheme solarized
" }}}

" Ruby Filetype ---------------------- {{{
function! s:RubyHashSyntaxToggle() range
  if join(getline(a:firstline, a:lastline)) =~# '=>'
    silent! execute a:firstline . ',' . a:lastline . 's/[^{,]*[{,]\?\zs:\([^: ]\+\)\s*=>/\1: /g'
  else
    silent! execute a:firstline . ',' . a:lastline . 's/[^{,]*[{,]\?\zs\([^: ]\+\):/:\1 =>/g'
  endif
endfunction
command! -bar -range RubyHashSyntaxToggle <line1>,<line2>call s:RubyHashSyntaxToggle()
noremap <Leader>rh :RubyHashSyntaxToggle<CR>

" save and check ruby syntax
augroup rubyAutoCommands
command! Rubyw :w | :! ruby -cw %
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType ruby setlocal foldlevel=199999
autocmd FileType eruby setlocal  foldmethod=indent
autocmd FileType eruby setlocal foldlevel=199999

let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'

augroup END
" }}}

nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>ntf :NERDTreeFind<cr>


" Alignment stuffs
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Remove trailing whitespce
augroup clearTrailingWhitespace
autocmd!
autocmd FileType html,markdown,typescript,eruby,ruby,c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e
augroup END

" Vim Test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "neovim"

nmap <silent> <leader>r :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! \"0p"
endfunction

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy


" Typescript ---------------------- {{{
augroup typescriptCommands
	autocmd!
	let g:typescript_compiler_binary = 'tsc'
	let g:typescript_compiler_options = '--noEmit'
	autocmd FileType typescript JsPreTmpl html
	autocmd FileType typescript syn clear foldBraces
  autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript
  let g:tsuquyomi_disable_quickfix = 1
  let g:tsuquyomi_shortest_import_path = 1
  let g:tsuquyomi_single_quote_import = 1
  let g:tsuquyomi_completion_detail = 1
  let g:nvim_typescript#type_info_on_hold = 1

  autocmd FileType typescript nmap <buffer> <leader>lr <Plug>(TsuquyomiRenameSymbol)
  autocmd FileType typescript nmap <buffer> <leader>lR <Plug>(TsuquyomiRenameSymbolC)
  "autocmd FileType typescript nmap <buffer> <leader>tu <Plug>(TsuquyomiReferences)
  autocmd FileType typescript nmap <buffer> <leader>ld :<C-u>echo tsuquyomi#hint()<CR>
  autocmd FileType typescript nmap <buffer> <leader>ti :TsuImport
  autocmd FileType typescript autocmd CursorHold <buffer> echo tsuquyomi#hint()
  "autocmd FileType typescript setlocal updatetime=1000

  "autocmd BufReadPost *.spec.ts set ft=typescript.spec

augroup END
" }}}

" Deoplete
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_complete_delay = 50
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Neomake
augroup neomakecmds
  autocmd!
  autocmd BufWritePost * Neomake
augroup END


" GUndo
nnoremap <leader>u :GundoToggle<CR>

" vimrc helpers---------------------- {{{
nnoremap <leader>evc :edit $MYVIMRC<CR>
nnoremap <leader>rvc :source $MYVIMRC<CR>
inoremap jk <esc>
inoremap <esc> <nop>
" }}}

" Terraform Settings ---------------------- {{{
augroup filetype_terraform
    autocmd!
    autocmd FileType terraform setlocal foldmethod=marker
augroup END
" }}}
    
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Auto Debugger Insert ---------------------- {{{
augroup autoDebugger
  autocmd!
  autocmd FileType ruby noremap <leader>d Obinding.pry<esc>==
  autocmd FileType ruby inoremap <leader>d <esc>Obinding.pry<esc>==i
  autocmd FileType ruby iabbrev <buffer> binding TRYAGAIN

  autocmd FileType ruby nnoremap <leader>pd yiwOputs <esc>p
  autocmd FileType ruby inoremap <leader>pd <esc>yiwOputs <esc>p
augroup END
" }}}


" Auto Debugger Insert ---------------------- {{{
noremap <leader>. :CtrlPTag<cr>
" }}}


" Vim Wiki ---------------------- {{{
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufEnter,BufRead */vimwiki/* setlocal spell spelllang=en_us
" }}}

" Directory Structure ---------------------- {{{
set undofile " Persistent Undo
set directory=~/.vim/swap,/tmp
set backupdir=~/.vim/backup,/tmp
set undodir=~/.vim/undo,/tmp
" }}}


" Allow local .nvimrc && Turn on security
set exrc
set secure " Should be the last line
