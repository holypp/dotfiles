"整理中




"PATH
let $PATH = $PATH . ':/opt/local/bin' 

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/vundle.git/ 
call vundle#rc()
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
filetype plugin indent on     " required!


"vimproc
let g:ref_use_vimproc = 0


"ref-alc
let g:ref_alc_cmd = 'w3m -dump %s'
let g:ref_alc_use_cache = 1
let g:ref_alc_use_cache = 1
let g:ref_alc_start_linenumber = 39 " 余計な行を読み飛ばす
let g:ref_alc_encoding = 'UTF-8'
let g:ref_cache_dir = 'g:\cache\'   " ローカルにキャッシュ

if exists('*ref#register_detection')
call ref#register_detection('_', 'alc') " filetypeが分からんならalc
endif

"#pathogen
"call pathogen#runtime_append_all_bundles()

" vimshell
let g:VimShell_EnableInteractive = 1

"neoconplcache
let g:NeoComplCache_EnableAtStartup = 1

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

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
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

" キーバインド

map <Up> gk
map <Down> gj
imap <c-j> <esc>


 " tab 操作
map <c-h> gT
map <c-l> gt
map [TABCMD]  <nop>
map t [TABCMD]
map <silent> [TABCMD]f :tabfirst<cr>
map <silent> [TABCMD]l :tablast<cr>
map <silent> [TABCMD]n :tabnext<cr>
map <silent> [TABCMD]N :tabNext<cr>
map <silent> [TABCMD]p :tabprevious<cr>
map <silent> [TABCMD]e :tabedit<cr>
map <silent> [TABCMD]c :tabclose<cr>
map <silent> [TABCMD]o :tabonly<cr>
map <silent> [TABCMD]s :tabs<cr>
:set nobackup
:set number
:set list
"highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
"au BufRead,BufNew * match JpSpace /　/

"ファイルエンコード
set fenc=utf-8

"let g:neocomplcache_enable_at_startup = 1
inoremap ( ()<Left>
inoremap <expr> ) ClosePair(')')
inoremap { {}<Left>
inoremap <expr> } ClosePair('}')
inoremap [ []<Left>
inoremap <expr> ] ClosePair(']')
inoremap <bar> <bar><bar><Left>
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

