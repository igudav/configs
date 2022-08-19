set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'sirver/ultisnips'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'xolox/vim-misc'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'

Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'python-mode/python-mode'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'junegunn/fzf.vim'

Plugin 'lervag/vimtex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let mapleader = ','

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
set runtimepath+=~/.vim/bundle/ultisnips "required for UltiSnips

let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_rename_bind = '<C-c>rr'
let g:pymode_lint_cwindow = 0

" Tabulation
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set shiftround

" Text rendering
set display+=lastline
set encoding=utf-8
set linebreak
set scrolloff=2
set sidescrolloff=5
set wrap

" User interface
set laststatus=2
set ruler
set cursorline
set wildmenu
set tabpagemax=50
set number
set relativenumber
set mouse=

let g:seoul256_background = 233
colorscheme seoul256

" орфография
" setlocal spell
" set spelllang=ru,en
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" автосохранение
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" комманды в русской раскладке
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
inoremap <C-space> <C-^>

" cmap <silent> <A-\> <C-^>
" imap <silent> <A-\> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
" nmap <silent> <A-\> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
" vmap <silent> <A-\> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv

let g:ycm_key_list_stop_completion = ['<A-j>']
let g:ycm_auto_trigger = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

" Переключение раскладок и индикация выбранной в данный момент раскладки -->
set laststatus=2
function MyKeyMapHighlight()
	if &iminsert == 0
        hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
    else
        hi StatusLine ctermfg=White guifg=White
    endif
endfunction
" Вызываем функцию, чтобы она установила цвета при запуске Vim'a
call MyKeyMapHighlight()
" При изменении активного окна будет выполняться обновление индикации текущей раскладки
au WinEnter * :call MyKeyMapHighlight()
" <--

" auto-pairs
let g:AutoPairsMultilineClose = 0

set splitbelow
set splitright

if &filetype != "tex"
    autocmd VimEnter * TagbarToggle
    autocmd VimEnter * NERDTree | wincmd p
    autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
endif

set pastetoggle=<F2>
nmap <F3> :set hls! <cr>

