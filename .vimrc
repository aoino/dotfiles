"/====================
"//  Neobundle
"//====================
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\ 'windows' : 'make -f make_mingw32.mak',
\ 'cygwin' : 'make -f make_cygwin.mak',
\ 'mac' : 'make -f make_mac.mak',
\ 'unix' : 'make -f make_unix.mak',
\ },
\ }
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'moznion/hateblo.vim'
NeoBundle 'tyru/caw.vim'
NeoBundle 'kana/vim-submode'
NeoBundle 'rking/ag.vim'
NeoBundle 'glidenote/memolist.vim'

filetype plugin indent on

NeoBundleCheck

" vimfiler
" let g:vimfiler_edit_action = 'tabopen'
nnoremap <silent>vf :VimFiler<CR>
let g:vimfiler_as_default_explorer = 1


" neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
"map <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
"let g:neocomplcache_enable_auto_select = 1

" lightline
if filereadable(expand('~/.vimrcd/lightline*'))
  source ~/.vimrcd/lightline
endif

" memolist
let g:memolist_ag = 1
let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y/%m/%d %H:%M"
" let g:memolist_memo_date = "epoch"
" let g:memolist_memo_date = "%D %T"
let g:memolist_prompt_tags = 1
" let g:memolist_prompt_categories = 1
" let g:memolist_qfixgrep = 1
let g:memolist_vimfiler = 1
" let g:memolist_template_dir_path = "path/to/dir"


"//====================
"//  settings
"//====================

"/** encoding */
set encoding=utf-8
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
set fileencoding=UTF-8
set termencoding=UTF-8

"/** basics */
syntax on
set nocompatible "vi互換なし
set nobackup
set noswapfile
set hidden
set textwidth=0 "自動折り返し(0は折り返しなし)
set whichwrap=b,s,h,l,<,>,[,]
set showcmd "コマンドをステータス行に表示
set showmode
set clipboard+=unnamed
set clipboard+=autoselect "ヤンクした文字をシステムのクリップボードへ
set virtualedit+=block
set backspace=indent,eol,start " insertモード時にbackspaceを使う
set tags=./.tags,.tags,./tags,tags

"コロンとセミコロンを入れ替え
" noremap ; :
" noremap : ;

"検索結果のハイライトをESC連打で消す
set hlsearch
noremap <Esc><Esc> :nohlsearch<CR><Esc>
" why input :95;c at start vim.
" nmap <Esc>[ :nohlsearch<CR><Esc>

colorscheme molokai
"set background=dark
let g:rehash256=1
let g:molokai_original=1

"/** display */
"set showmatch "対応括弧のハイライト
set number
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<
set cursorline "カーソル行のハイライト
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

"/** indent */
set autoindent
set smartindent "改行時、インデントを現在行と同じにする
set tabstop=4
set softtabstop=0 "Tabキー押下時の空白の量(0はtapstopと同じ量)
set shiftwidth=2

"/** buffer keymap */
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bb :b#<CR>
nnoremap <silent>bd :bdelete<CR>

"/** split window keymap */
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>\|
nnoremap si <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" /** caw.vim keymap */
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

" /** memolist.vim keymap */
map mn  :MemoNew<CR>
map ml  :MemoList<CR>
map mg  :MemoGrep<CR>
