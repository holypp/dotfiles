


"整理中
"最近の変更

" 無名レジスタに入るデータを、*レジスタにも入れる。
:set clipboard+=unnamed
" vim:set foldmethod=marker:
:set foldmethod=marker
" コメントの形式をスラッシュ2つの形式に変更
":set commentstring=//%s
" vim:set foldmethod=marker commentstring=//%s :

"map
noremap - $
"
nnoremap ; :
nnoremap : ;
"プラグイン
"vundle
set nocompatible               " be iMproved
filetype off                   " required!

if has("win32") || has("win64")
  set rtp+=~/vimfiles/vundle.git/ 
  call vundle#rc('~/vimfiles/bundle/')
else
  set rtp+=~/.vim/vundle.git/ 
  call vundle#rc()
endif

Bundle 'tpope/vim-rails'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
filetype plugin indent on     " required!

"vimproc
let g:ref_use_vimproc = 0
"ref-alc
let $PATH = $PATH . ':/opt/local/bin'  " w3mのPATH
let g:ref_alc_cmd = 'w3m -dump %s'
let g:ref_alc_use_cache = 1
let g:ref_alc_start_linenumber = 38 " 余計な行を読み飛ばす
let g:ref_alc_encoding = 'UTF-8'
let g:ref_cache_dir = '~\cache\'   " ローカルにキャッシュ

if exists('*ref#register_detection')
   call ref#register_detection('_', 'alc') " filetype不明な場合はalcを使う
endif

"nore nnore tigai
"kind action source:ua
" 入力モードで開始
let g:unite_enable_start_insert=1
noremap :um :<C-u>Unite file_mru -buffer-name=file_mru<CR>
noremap :ur :<C-u>Unite register -buffer-name=register<CR>
noremap :ub :<C-u>Unite buffer -buffer-name=buffer<CR>
"file_Current
noremap :ufc :<C-u>Unite file -buffer-name=file<CR>
noremap :ufcr :<C-u>Unite file_rec -buffer-name=file_rec<CR>
noremap :uallc :<C-u>Unite buffer file_mru bookmark file source -buffer-name=all<CR>
"file_current
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
noremap :uffr :<C-u>UniteWithBufferDir file_rec -buffer-name=file_rec<CR>
noremap :uallf :<C-u>UniteWithBufferDir buffer file_mru bookmark file source -buffer-name=all<CR>

" ウィンドウを上下に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-I> unite#do_action('split')
" ウィンドウを左右に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
" c-jはescとする
au FileType unite nnoremap <silent> <buffer> <c-j> <esc><CR>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" 初期設定関数を起動する
au FileType unite call s:unite_my_settings()
function! s:unite_my_settings() " Overwrite settings.
endfunction
" 様々なショートカット
"call unite#set_substitute_pattern('file', '\$\w\+', '\=eval(submatch(0))', 200)
"call unite#set_substitute_pattern('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/"', 2)
"call unite#set_substitute_pattern('file', '^@', '\=getcwd()."/*"', 1)
"call unite#set_substitute_pattern('file', '^;r', '\=$VIMRUNTIME."/"')
"call unite#set_substitute_pattern('file', '^\~', escape($HOME, '\'), -2)
"call unite#set_substitute_pattern('file', '\\\@<! ', '\\ ', -20)
"call unite#set_substitute_pattern('file', '\\ \@!', '/', -30)
"if has('win32') || has('win64')
"  call unite#set_substitute_pattern('file', '^;p', 'C:/Program Files/')
"call unite#set_substitute_pattern('file', '^;v', '~/vimfiles/')
"else
"  call unite#set_substitute_pattern('file', '^;v', '~/.vim/')
"endif


" vimshell
let g:VimShell_EnableInteractive = 1
"neocomplecache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'


"set
set fenc=utf-8
set nobackup
set noswapfile
set number
set list

"map
noremap <Up> gk
noremap <Down> gj
imap <c-j> <esc>
inoremap ; <Return>
inoremap :: ;

"rc
nnoremap :ev   :<C-u>edit   $MYVIMRC<CR>
nnoremap :eg   :<C-u>edit   $MYGVIMRC<CR>
nnoremap :sv   :<C-u>source $MYVIMRC<CR>
nnoremap :sg   :<C-u>source $MYGVIMRC<CR>

" tab
noremap <c-h> gT
noremap <c-l> gt
"noremap [TABCMD]  <nop>
map t [TABCMD]
noremap <silent> [TABCMD]f :tabfirst<cr>
noremap <silent> [TABCMD]l :tablast<cr>
noremap <silent> [TABCMD]n :tabnext<cr>
noremap <silent> [TABCMD]N :tabNext<cr>
noremap <silent> [TABCMD]p :tabprevious<cr>
noremap <silent> [TABCMD]e :tabedit<cr>
noremap <silent> [TABCMD]c :tabclose<cr>
noremap <silent> [TABCMD]o :tabonly<cr>
noremap <silent> [TABCMD]s :tabs<cr>

"pair
inoremap ( ()<Left>
inoremap <expr> ) ClosePair(')')
inoremap { {}<Left>
inoremap <expr> } ClosePair('}')
inoremap [ []<Left>
inoremap <expr> ] ClosePair(']')
inoremap <bar> <bar><bar><Left>
inoremap ><bar> ><bar><bar><<Left><Left>

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf


