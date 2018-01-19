" Optilyz machine
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'gmarik/vundle'
filetype plugin indent on
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'wakatime/vim-wakatime'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'wesQ3/vim-windowswap'
Plugin 'vim-scripts/ZoomWin'
" THeme
Plugin 'NLKNguyen/papercolor-theme'
" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Javascript
Plugin 'isRuslan/vim-es6'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'mxw/vim-jsx'
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'claco/jasmine.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'lfilho/cosco.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'leshill/vim-json'
Plugin 'eduardosanzb/tagman.vim'
Plugin 'prettier/vim-prettier'
Plugin 'ternjs/tern_for_vim'
Plugin 'Galooshi/vim-import-js'
" React
Plugin 'epilande/vim-es2015-snippets'
Plugin 'epilande/vim-react-snippets'


" ELM
Plugin 'elmcast/elm-vim'

" new eslinter async
Plugin 'w0rp/ale'

"bar
Plugin 'vim-airline/vim-airline'


Plugin 'chemzqm/vim-jsx-improve'

Plugin 'airblade/vim-gitgutter'

" tab to autocompletehssuggestion
Plugin 'ervandew/supertab'

" Plugin 'vim-syntastic/syntastic'

" ctrl-d of vscode
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'yegappan/mru'
" Plugin 'itchyny/lightline.vim' "funny line


call vundle#end()            " required
filetype plugin indent on    " required


" show existing tab with 4 spaces width
set tabstop=2
" " when indenting with '>', use 4 spaces width
set shiftwidth=2
" " On pressing tab, insert 4 spaces
set expandtab
set autoindent
set smartindent
"" ctrl c to add indent automatic with delimit
imap <C-c> <CR><Esc>O

"" YCM config
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0

" SnippetsConfig
let g:UltiSnipsExpandTrigger="<c-l>"
set completeopt-=preview

set cursorline
syntax enable
set background=dark
let g:solarizaed_termicolors = 256 " New line!!
set t_Co=256
syntax on
colorscheme PaperColor


" eslint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" prettier
let g:prettier#config#bracket_spacing = 'true'

let g:ale_sign_column_always = 1

let g:syntastic_error_symbol = '❌'
let g:ale_sign_error = '❌'
let g:syntastic_style_error_symbol = '⁉️  '
let g:syntastic_warning_symbol = '⚠️  '
let g:ale_sign_warning = '⚠️ '
let g:syntastic_style_warning_symbol = '💩 '
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" vim-javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
set foldmethod=indent




" react
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" highlight search
set hls
nnoremap <CR> :nohlsearch<CR><CR>

" finding files
set path+=**
set wildmenu
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" jsBeautify
map <c-f> :call JsBeautify()<cr>

" Mapping ESC in insert mode and command mode to double i
imap ii <C-[>
cmap ii <C-[>

set mouse=a


" for the bar set the eslint pedos
set laststatus=2
function! LinterStatus() abort
   let l:counts = ale#statusline#Count()

   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors

   return l:counts.total == 0 ? 'OK' : printf(
   \   '%dW %dE',
   \   all_non_errors,
   \   all_errors
   \)
endfunction

set statusline=%{LinterStatus()}


nmap <silent> <C-w> <Plug>(ale_previous_wrap)
nmap <silent> <C-s> <Plug>(ale_next_wrap)

" Remap of zoomWin
nnoremap <silent> <leader>w :ZoomWin<CR>

" Open NERDTree in the directory of the current file (or /home if no files open)
nmap <silent> <C-i> :call NERDTreeToggleInCurDir()<cr>
function! NERDTreeToggleInCurDir()
   " If NERDTree is open in the current buffer
   if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
   else
    exe ":NERDTreeFind"
   endif
endfunction

set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunc

nnoremap <leader>n :call NumberToggle()<cr>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
set backspace=indent,eol,start
