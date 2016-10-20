"autocmd VimEnter * NERDTree

set nocompatible
filetype off
syntax on

let mapleader=","

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
    Plugin 'gmarik/Vundle.vim'

    Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'scrooloose/nerdcommenter'

    Plugin 'tmhedberg/SimpylFold'
    Plugin 'vim-scripts/indentpython.vim'
    Plugin 'scrooloose/syntastic'
    Plugin 'nvie/vim-flake8'

    Plugin 'jnurmine/Zenburn'
    Plugin 'altercation/vim-colors-solarized'

    " git plugins
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'

    Plugin 'kien/ctrlp.vim'
    "Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

    Plugin 'powerline/powerline'
    Plugin 'powerline/fonts'

    Plugin 'bronson/vim-trailing-whitespace'
    Plugin 'bitc/vim-bad-whitespace'

    Plugin 'Shougo/unite.vim'
    Plugin 'Shougo/vimproc.vim'
    Plugin 'Shougo/vimshell.vim'
    Plugin 'rking/ag.vim'

    Plugin 'junegunn/vim-easy-align'
    Plugin 'godlygeek/tabular'

    Plugin 'mru.vim'

    Plugin 'Valloric/YouCompleteMe'
    " Track the engine.
    Plugin 'SirVer/ultisnips'
    " Snippets are separated from the engine. Add this if you want them:
    Plugin 'honza/vim-snippets'

    Plugin 'xolox/vim-misc'
    Plugin 'xolox/vim-easytags'
    Plugin 'majutsushi/tagbar'

    Plugin 'Raimondi/delimitMate'
    Plugin 'tpope/vim-surround'
    Plugin 'sjl/gundo.vim'

    Plugin 'xolox/vim-session'

    Plugin 'easymotion/vim-easymotion'
    Plugin 'taglist.vim'
    Plugin 'pangloss/vim-javascript'
    Plugin 'rhysd/clever-f.vim'

    Plugin 'ervandew/supertab'
    Plugin 'shawncplus/phpcomplete.vim'
    "Plugin 'm2mdas/phpcomplete-extended'

    Plugin 'joonty/vdebug' " interracting with php xdebug

    Plugin 'terryma/vim-multiple-cursors' " multiple cursor replacement

    " ========== old plugins
    "Plugin 'jeetsukumaran/vim-buffergator'
    "Plugin 'xolox/vim-misc'
    "Plugin 'Command-T'
    "Plugin 'LustyExplorer'
    ""Plugin 'vim-scripts/groovy.vim'
    "Plugin 'grails-vim'
    "Plugin 'EasyGrep'
    "Plugin 'matchit.zip'
    "Plugin 'Emmet.vim'
    "Plugin 'jaredly/vim-debug'

    "Plugin 'tpope/vim-pathogen' "??
call vundle#end()

filetype plugin indent on

set wildmode=list:longest
"set cindent
set autoindent
set hlsearch
set ignorecase
set expandtab
set tabstop=4
set shiftwidth=4

"syntax
au BufNewFile,BufRead *.dump set filetype=sql

" Pydiction autocomplete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" end - Pydiction autocomplete
"
set hidden
set number
set relativenumber

nmap <F2> :NERDTree<CR>
"nmap <F3> :CommandT<CR>
"nmap <F4> :LustyBufferGrep<CR>
"nmap <F5> :MRU<CR>
"nmap <F6> <Esc>:TlistToggle<CR>
"nmap <F8> :TagbarToggle<CR>

function ResetChanges()
    set undoreload=0 | edit
    set undoreload=10000 | edit
endfunction
command! E call ResetChanges()

"function HelloWorld()
    "echom "Hello World"
"endfunction
"command! HelloWorld call HelloWorld()

"execute pathogen#infect()
"runtime bundle/vim-pathogen/autoload/pathogen.vim

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""Enable folding
"set foldmethod=indent
set foldmethod=syntax
set foldlevel=99
set foldlevelstart=99
""Enable folding with the spacebar
nnoremap <space><space> za
"au BufRead * normal zR

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Python indention settings
au BufNewFile,BufRead *.py
    \ set softtabstop=4 |
    \ set tabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Full Stack indention settings
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" Flagging Unnecessary Whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"UTF8 Support
set encoding=utf-8

" YouCompleteMe settings
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
highlight YcmErrorLine guibg=#3f0000

" Auto-complete YouCompleteMe
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_cache_omnifunc = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_goto_buffer_command = 'new-tab'
"let g:ycm_complete_in_comments = 1
let g:ycm_auto_trigger = 1

let g:ycm_python_binary_path = '/usr/bin/python'

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Syntax Checking/Highlighting
let python_highlight_all=1

" Color Schemes
""colorscheme murphy
"colorscheme delek
set background=dark
if has('gui_running')
    colorscheme solarized
else
    colorscheme delek
    "colorscheme zenburn
endif

" file browsing
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" NerdTree tabs
"map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1

" System clipboard
set clipboard=unnamed

" max code length line
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" git settings
"g:gitgutter_sign_column_always = 1
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 1
let g:gitgutter_async = 1

" unite settings
let g:unite_source_history_yank_enable = 1
"nnoremap <C-p> :Unite file_rec/async<cr>
"nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>/ :Ag 
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

" Easy align interactive
"vnoremap <silent> <Space> :EasyAlign<cr>

" MRU - Most Recently Used (MRU) files
nnoremap <space>m :MRU<CR>

" quit all
command! Q :qa

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" easytags settings
set tags=~/.vimtags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 1
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
nmap <silent> <leader>b :TagbarToggle<CR>

" delimitMate settings
let delimitMate_autoclose = 1
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" gundo settings
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1
"let gundo_preview_bottom = 1
nnoremap <space>g :GundoToggle<CR>

" sessions
let g:session_autosave = 'yes'

" ease motion settings
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0

" javascript settings
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" clever-f settings - easy char searcher
let g:clever_f_mark_cursor = 1

"omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set omnifunc=syntaxcomplete#Enable
set omnifunc=phpcomplete#CompletePHP
"end - omnicomplete

autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
set completeopt=longest,menuone
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

"let g:phpcomplete_index_composer_command = 'composer'
"let g:phpcomplete_index = 'php-complete-index'

" powerline
set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set showtabline=1
set t_Co=256
"set noshowmode

" xdebug settings
let g:vdebug_options = {'ide_key': 'vimxdebug'}
let g:vdebug_options = {'break_on_open': 0}
let g:vdebug_options = {'server': '127.0.0.1'}
let g:vdebug_options = {'port': '9000'}
