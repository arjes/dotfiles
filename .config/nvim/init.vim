if !executable('python3')
  let g:python3_host_prog='/usr/local/Cellar/python/3.7.7/bin/python3'
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

" Navigation ------- {{{
Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeFind', 'NERDTreeToggle' ] }
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'simnalamburt/vim-mundo'

"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'majutsushi/tagbar'
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
"Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': './nvim/symlink.sh' }


" Ruby ------------ {{{
"Plug 'tpope/vim-endwise'
"Plug 'tpope/vim-rails'
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
"Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
endif
" }}}

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'jiangmiao/auto-pairs'

" AutoComplete ----- {{{
" Previous nvim-completion-manager
"" "Plug 'ncm2/ncm2'
"" "Plug 'roxma/nvim-yarp'
"" "Plug 'ncm2/ncm2-bufword'
"" "Plug 'ncm2/ncm2-path'
"" "Plug 'ncm2/ncm2-tmux'
"" "Plug 'filipekiss/ncm2-look.vim'
"" "Plug 'ncm2/ncm2-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" }}}

Plug 'hashivim/vim-terraform'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()
"" }}}

" Clear the VimWiki <tab> mapping
inoremap <tab> <nop>

""Tests

" Coc --- {{{
set updatetime=300
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" Use SHFIT-TAB to go back
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)

augroup coc
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  " Formatters
  autocmd FileType typescript,typescriptreact nmap <buffer> <leader>af :CocCommand eslint.executeAutofix<cr>
augroup end

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
set colorcolumn=120
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
highlight NormalNC ctermfg=59
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
nmap <leader>np :TagbarToggle<cr>
nmap <leader>fnt :NERDTreeFind<cr>

" FZF Config ----- {{{
" floating fzf window with borders
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

"let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let g:fzf_files_options = '--preview "bat --style=numbers --color=always {} | head -500"'

nnoremap <leader>ff :Files<cr>
nnoremap <leader>fb :Buffers<cr>

" Tag navigation
nnoremap <leader>gt <C-]>
nnoremap <leader>ft :Tags<cr>
nnoremap <leader>fbt :BTags<cr>
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
let g:ale_linters = {
\   'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}

autocmd FileType ruby nmap <buffer> <leader>af :ALEFix<cr>
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
  autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
augroup END
" }}}

" Typescript ---------------------- {{{
augroup typescriptCommands
	autocmd!
	let g:typescript_compiler_binary = 'tsc'
	let g:typescript_compiler_options = '--noEmit'
	"autocmd FileType typescript JsPreTmpl html
	"autocmd FileType typescript syn clear foldBraces

  let g:coverage_json_report_path = 'coverage/coverage-final.json'

  autocmd FileType typescript syn region typescriptStringD start=+"+ skip=+\\\\\|\\"+ end=+"\|$+  contains=@Spell,typescriptSpecial,@htmlPreproc extend
  autocmd FileType typescript syn region typescriptStringS start=+'+ skip=+\\\\\|\\'+ end=+'\|$+  contains=@Spell,typescriptSpecial,@htmlPreproc extend
  autocmd FileType typescript syn region typescriptStringB start=+`+ skip=+\\\\\|\\`+ end=+`+  contains=@Spell,typescriptInterpolation,typescriptSpecial,@htmlPreproc extend

augroup END
" }}}

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
    let g:terraform_fmt_on_save=1
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

" Directory Structure ---------------------- {{{
set undofile " Persistent Undo
set directory=~/.vim/swap,/tmp
set backupdir=~/.vim/backup,/tmp
set undodir=~/.vim/undo,/tmp
" }}}


" TOC Updater ------------ {{{
augroup tocUpdater
  nnoremap  <leader>toc  :!doctoc %:p<cr>
augroup END
" }}}
" Create file under cursor
map <leader>gf :e %:h<cfile><cr>

" Copy of  current buffer to new tab
map <leader>fs :tab split<cr>

if has('nvim-0.3.2') || has("patch-8.1.0360")
    set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif

let g:vimwiki_list = [{'path': '~/.vimwiki/' }]

let g:vimwiki_key_mappings =
  \ {
  \ 'table_mappings': 0,
  \ }

" Allow local .nvimrc && Turn on security
set exrc
set secure " Should be the last line
