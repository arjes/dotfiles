if !executable('python3')
  let g:python3_host_prog='/usr/local/bin/python3'
endif

if !executable('python2')
  let g:python2_host_prog='/usr/local/Cellar/python@2/2.7.14_3/bin/python2'
endif

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

" Navigation ------- {{{
Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeFind', 'NERDTreeToggle' ] }
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'simnalamburt/vim-mundo'

"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-abolish'

Plug 'altercation/vim-colors-solarized'

Plug 'fatih/vim-go'
"Plug 'jodosha/vim-godebug' <<-- In editor debug
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': './nvim/symlink.sh' }


" Ruby ------------ {{{
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
"Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }
" }}}

"Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'janko-m/vim-test'

" Git ------- {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" }}}

" CodeCoverae ------- {{{
"Plug 'ruanyl/coverage.vim'
" }}}


" Typescript -------- {{{
if executable('tsc')
"Plug 'Quramy/vim-js-pretty-template', { 'for': 'typescript' }
"Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
"Plug 'mhartington/nvim-typescript' ", { 'commit': '3b71bb975dfef16a40f92aed6656f7d00ec3be68', 'for': 'typescript' }
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
endif
" }}}

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'jiangmiao/auto-pairs'

" AutoComplete ----- {{{
" Previous nvim-completion-manager
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tmux'
Plug 'filipekiss/ncm2-look.vim'
Plug 'ncm2/ncm2-go'
" }}}


call plug#end()
"" }}}


""Tests

" NCM2 --- {{{
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" }}}

" Ack.vim ---- {{{
let g:ackprg = 'ag --nogroup --nocolor --column'
" }}}

" Snippet Hotkey config ---- {{{
let g:AutoPairsMapCR = 0

let &runtimepath .=',~/.UltiSnips'
let g:UltiSnipsSnippetsDir='~/.UltiSnips/UltiSnips'

"inoremap <leader><tab> <esc>:call UltiSnips#ExpandSnippet()<cr>
let g:UltiSnipsExpandTrigger="<C-U>"
"imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")
"imap <expr> <silent> <cr>  (pumvisible() ? "\<c-y>\<Plug>(cm_inject_snippet)\<Plug>(expand_or_nl)\<Plug>DiscretionaryEnd\<c-r>=AutoPairsReturn()\<cr>" : "\<cr>\<Plug>DiscretionaryEnd\<c-r>=AutoPairsReturn()\<cr>")
"imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")
"imap <expr> <silent> <cr>  (pumvisible() ? "\<c-y>\<Plug>(expand_or_nl)\<Plug>DiscretionaryEnd\<c-r>=AutoPairsReturn()\<cr>" : "\<cr>\<Plug>DiscretionaryEnd\<c-r>=AutoPairsReturn()\<cr>")

" }}}

"filetype off
set relativenumber
set colorcolumn=80
set ruler
set nowrap
set autoindent
syntax enable
nnoremap <SPACE> <Nop>
let mapleader=" "
set timeoutlen=500
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set expandtab
set list listchars=tab:\ \ ,trail:·

set hlsearch
set incsearch

set spell spelllang=en_us

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
"if strftime("%H") > 20 || strftime("%H") < 7
"  set background=light
"else
  set background=dark
"endif
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

let ruby_spellcheck_strings = 1
"let g:ruby_indent_assignment_style = 'variable'
"let g:ruby_indent_block_style = 'do'


augroup END
" }}}

nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>fnt :NERDTreeFind<cr>

" FZF Config ----- {{{
let g:fzf_layout = { 'window': '-tabnew' }
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fg :GFiles<cr>
nnoremap <leader>fd :GFiles?<cr>
" }}}


" Alignment stuffs
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Remove trailing whitespce
augroup clearTrailingWhitespace
autocmd!
autocmd FileType go,html,markdown,typescript,eruby,ruby,c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e
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

" Ale Config ------- {{{
"
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

augroup aleCommands
autocmd!
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'typescript': ['tslint'],
\}


nmap <silent> <leader>af :ALEFix<cr>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
augroup END
" }}}

" Golang ------------------- {{{
augroup golangCommands
  autocmd FileType go set noexpandtab
  autocmd FileType go set shiftwidth=4
  autocmd FileType go set softtabstop=4
  autocmd FileType go set tabstop=4
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_types = 1
  "let g:go_auto_sameids = 1
  let g:go_fmt_command = "goimports"
  nnoremap <leader>ee :GoIfErr<cr>
augroup END
" }}}

" Typescript ---------------------- {{{
augroup typescriptCommands
	autocmd!
	let g:typescript_compiler_binary = 'tsc'
	let g:typescript_compiler_options = '--noEmit'
	"autocmd FileType typescript JsPreTmpl html
	autocmd FileType typescript syn clear foldBraces
  autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript
  let g:tsuquyomi_disable_quickfix = 1
  let g:tsuquyomi_shortest_import_path = 1
  let g:tsuquyomi_single_quote_import = 1
  let g:tsuquyomi_completion_detail = 1
  let g:nvim_typescript#type_info_on_hold = 1

  let g:coverage_json_report_path = 'coverage/coverage-final.json'

  autocmd FileType typescript nmap <buffer> lr :TSRename<CR>
  autocmd FileType typescript nmap <buffer> lf :TSRefs<CR>
  autocmd FileType typescript nmap <buffer> ld :TSTypeDef<CR>
  autocmd FileType typescript nmap <buffer> lds :TSDefPreview<CR>
  autocmd FileType typescript nmap <buffer> ti :TSImport<CR>

  autocmd FileType typescript syn region typescriptStringD start=+"+ skip=+\\\\\|\\"+ end=+"\|$+  contains=@Spell,typescriptSpecial,@htmlPreproc extend
  autocmd FileType typescript syn region typescriptStringS start=+'+ skip=+\\\\\|\\'+ end=+'\|$+  contains=@Spell,typescriptSpecial,@htmlPreproc extend
  autocmd FileType typescript syn region typescriptStringB start=+`+ skip=+\\\\\|\\`+ end=+`+  contains=@Spell,typescriptInterpolation,typescriptSpecial,@htmlPreproc extend


  "autocmd FileType typescript nmap <buffer> <leader>lr <Plug>(TsuquyomiRenameSymbol)
  "autocmd FileType typescript nmap <buffer> <leader>lR <Plug>(TsuquyomiRenameSymbolC)
  "autocmd FileType typescript nmap <buffer> <leader>tu <Plug>(TsuquyomiReferences)
  "autocmd FileType typescript nmap <buffer> <leader>ld :<C-u>echo tsuquyomi#hint()<CR>
  "autocmd FileType typescript nmap <buffer> <leader>ti :TsuImport<CR>
  "autocmd FileType typescript autocmd CursorHold <buffer> echo tsuquyomi#hint()
  "autocmd FileType typescript setlocal updatetime=1000

  "autocmd BufReadPost *.spec.ts set ft=typescript.spec

augroup END
" }}}

" NGRX Helpers ---- {{{
  autocmd BufReadPost *source.spec.ts :UltiSnipsAddFiletypes source-spec.typescript-spec.typescript.javascript
  autocmd BufReadPost *effects.spec.ts :UltiSnipsAddFiletypes ngrx-effects-spec.typescript-spec.typescript.javascript
  autocmd BufReadPost *effects.ts :UltiSnipsAddFiletypes ngrx-effects.typescript-spec.typescript.javascript
  autocmd BufReadPost *reducer.ts :UltiSnipsAddFiletypes ngrx-reducer.typescript-spec.typescript.javascript
  autocmd BufReadPost *actions.ts :UltiSnipsAddFiletypes ngrx-actions.typescript-spec.typescript.javascript
  autocmd BufReadPost */containers/*component.ts :UltiSnipsAddFiletypes ngrx-containers.typescript-spec.typescript.javascript
  autocmd BufReadPost */component/*component.ts :UltiSnipsAddFiletypes ngrx-containers.typescript-spec.typescript.javascript
" }}}


" Deoplete
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_complete_delay = 50
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Neomake
" augroup neomakecmds
"   autocmd!
"   autocmd BufWritePost * Neomake
" augroup END


"Indent Guides
"nnoremap <leader>ig :IndentLinesToggle<CR>
" GUndo
nnoremap <leader>u :MundoToggle<CR>

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
  " Ruby
  autocmd FileType ruby noremap <leader>d Obinding.pry<esc>==
  "autocmd FileType ruby inoremap <leader>d <esc>Obinding.pry<esc>==i
  "autocmd FileType ruby iabbrev <buffer> binding TRYAGAIN

  autocmd FileType ruby nnoremap <leader>pd yiwOputs <esc>p
  "autocmd FileType ruby inoremap <leader>pd <esc>yiwOputs <esc>p

  "typescript
  autocmd FileType typescript noremap <leader>d Odebugger;<esc>==
"  autocmd FileType typescript inoremap <leader>d <esc>Odebugger;<esc>==i
  autocmd FileType typescript iabbrev <buffer> debugger TRYAGAIN

  autocmd FileType typescript nnoremap <leader>pd yiwOconsole.log(<esc>pA)
"  autocmd FileType typescript inoremap <leader>pd <esc>yiwOconsole.log(<esc>pA)
augroup END
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

" Create file under cursor
map <leader>gf :e %:h<cfile><cr>

" Allow local .nvimrc && Turn on security
set exrc
set secure " Should be the last line
