scriptencoding utf-8

if has('vim_starting')
  let &t_SI .= "\e[6 q"
endif
function! PluginList()
  set nocompatible
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  try 
    call vundle#begin()
  catch
    echo('no vundle. setup environment')
    call getchar()
    call system('git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim')
    call PluginList()
    PluginInstall
    echo('done. make sure restart vim')
  endtry
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'tpope/vim-markdown'
  Plugin 'posva/vim-vue'
  Plugin 'tpope/vim-endwise'
  " 補完中にshift+sすると固まるのでクビ
  " Plugin 'tpope/vim-surround'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tomtom/tcomment_vim'
  "linter
  Plugin 'w0rp/ale'
  Plugin 'prabirshrestha/vim-lsp'
  Plugin 'prabirshrestha/async.vim'
  Plugin 'mattn/emmet-vim'
  Plugin 'alvan/vim-closetag'
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'leafgarland/typescript-vim'
  if !has('nvim')
    Plugin 'roxma/nvim-yarp'
    Plugin 'roxma/vim-hug-neovim-rpc'
  endif
  Plugin 'Shougo/neosnippet.vim'
  Plugin 'Shougo/neosnippet-snippets'
  "Plugin 'prabirshrestha/asynccomplete.vim'
  "Plugin 'prabirshrestha/asynccomplete-lsp.vim'
  " 各インデントに色をつける。ターミナルによって発色が変わってびみょい
  " Plugin 'nathanaelkane/vim-indent-guides'
  "   let g:indent_guides_enable_on_vim_startup=1
  "   let g:indent_guides_start_level=2
  "   let g:indent_guides_auto_colors=0
  "   augroup IndentHL
  "     autocmd!
  "     autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=0
  "     autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=200
  "   augroup END
  call vundle#end()
endfunction
call PluginList()
filetype plugin indent on
command! -nargs=1 Tbs call s:setTabSpan(<f-args>)
function! s:setTabSpan(num)
  let &l:softtabstop=a:num
  let &l:shiftwidth=a:num
endfunction
"if empty(glob('~/.vim/autoload/plug.vim'))
"    silent curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
"call plug#begin()
"  Plug 'junegunn/fzf'
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ } 
"call plug#end()
"highlights
  hi MatchParen ctermfg=Black ctermbg=Yellow
"highlightsend
source ~/.ideavimrc_maps
"sets
  colors ron
  set timeoutlen=400
  set scrolloff=5
  set nocompatible
  set whichwrap=b,s,h,l,<,>,[,],~
  set foldmethod=indent
  set foldlevelstart=99
  set number
  set hlsearch
  set incsearch
  set nowritebackup
  set nobackup
  set noundofile
  set virtualedit=all
  set backspace=indent,eol,start
  set wrapscan
  set noerrorbells
  set showmatch matchtime=1
  set laststatus=2
  set expandtab
  set softtabstop=4
  set shiftwidth=4
  set autoindent
  set shellslash
  set guioptions+=a
  set showmatch
  set noswapfile
  set title
  set splitbelow
  set splitright
  set clipboard=unnamed,autoselect
  set hidden
  set wildmenu
  set wildmode=longest:full,full
  set formatoptions-=ro
  set ignorecase
  set smartcase
  cnoremap rc<CR> source<Space>~/.vimrc<CR>
  inoremap { {}<LEFT>
  inoremap {<Space> {
  inoremap {} {}
  inoremap ( ()<LEFT>
  inoremap (<Space> (
  inoremap () ()
  inoremap ({ ({})<LEFT><LEFT>
  inoremap [ []<LEFT>
  inoremap [<Space> [
  inoremap [] []
  inoremap {<CR> {<CR>}<UP><ESC>A<CR>
  inoremap (<CR> (<CR>)<UP><ESC>A<CR>
  inoremap ({<CR> ({<CR>})<UP><ESC>A<CR>
  inoremap [<CR> [<CR>]<UP><ESC>A<CR>
  inoremap ' ''<LEFT>
  inoremap '<Space> '
  inoremap " ""<LEFT>
  inoremap "<Space> "
  syntax on
  set nrformats=
  set mouse-=a
  augroup FormatOptions
    autocmd!
    autocmd Filetype  setlocal formatoptions-=ro
  augroup END
  set completeopt=menuone
  for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_", '\zs')
    exec "imap <expr> ".k." pumvisible() ? '".k."':'".k."\<C-X>\<C-P>\<C-N>'"
  endfor
"setsend



augroup General
augroup END
augroup AutoFolding
  autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
  autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
  set viewoptions-=options
augroup END
augroup MarkDown
  autocmd!
  autocmd BufRead,BufNewFile *.md inoremap ＊ *
  autocmd BufRead,BufNewFile *.md inoremap ＊＊＊ ＊＊
  autocmd BufRead,BufNewFile *.md inoremap ーー -
  autocmd BufRead,BufNewFile *.md inoremap ＃ #
  autocmd BufRead,BufNewFile *.md inoremap 〜 ~
  autocmd BufRead,BufNewFile *.md inoremap ` ``<LEFT>
  autocmd BufRead,BufNewFile *.md inoremap ｀ ``<LEFT>
  autocmd BufRead,BufNewFile *.md inoremap `` ```<CR>```<UP><ESC>A
  autocmd BufRead,BufNewFile *.md inoremap ｀｀ ```<CR>```<UP><ESC>A
  autocmd BufRead,BufNewFile *.md inoremap 　 <Space>
augroup END
augroup Php
  autocmd!
augroup END
augroup RubyErb
  autocmd!
  autocmd BufRead,BufNewFile *.rb,*.erb inoremap {<Bar><Space> {<Bar>val,<Space><Bar>}<LEFT><LEFT>
  autocmd BufRead,BufNewFile *.rb,*.erb inoremap {<Bar><Bar> {<Bar>val<Bar>}<LEFT><Space>
  autocmd BufRead,BufNewFile *.rb,*.erb inoremap do<CR> do<CR>end<UP><ESC>A<CR>
  autocmd BufRead,BufNewFile *.rb,*.erb set softtabstop=2
  autocmd BufRead,BufNewFile *.rb,*.erb set shiftwidth=2
augroup END
augroup Erb
  autocmd!
  au BufRead,BufNewFile *.erb set filetype=html
  autocmd BufRead,BufNewFile *.erb inoremap <= <%=<Space><Space>%><LEFT><LEFT><LEFT>
  autocmd BufRead,BufNewFile *.erb inoremap <<Space> <%<Space><Space>%><LEFT><LEFT><LEFT>
augroup END
augroup Ruby
  autocmd BufRead,BufNewFile *.rb inoremap def<Space> def<CR>end<ESC>kA<Space>
augroup END
augroup Vue
  autocmd!
  autocmd BufRead,BufNewFile *.vue setlocal filetype=vue
  autocmd Filetype vue syntax sync fromstart
  autocmd Filetype vue inoremap {<CR> {<CR>}<UP><ESC>A<CR>
  autocmd Filetype vue inoremap (<CR> (<CR>)<UP><ESC>A<CR>
  autocmd Filetype vue inoremap ({<CR> ({<CR>})<UP><ESC>A<CR>
  autocmd Filetype vue inoremap [<CR> [<CR>]<UP><ESC>A<CR>
  autocmd BufRead,BufNewFile *.vue set softtabstop=2
  autocmd BufRead,BufNewFile *.vue set shiftwidth=2
augroup END
augroup HtmlXml
  autocmd!
augroup END
augroup JavaScript
  autocmd BufRead,BufNewFile *.ts setlocal filetype=typescript
  autocmd BufRead,BufNewFile *.ts,*.js inoremap {<CR> {<CR>}<UP><ESC>A<CR>
  autocmd BufRead,BufNewFile *.ts,*.js inoremap (<CR> (<CR>)<UP><ESC>A<CR>
  autocmd BufRead,BufNewFile *.ts,*.js inoremap ({<CR> ({<CR>})<UP><ESC>A<CR>
  autocmd BufRead,BufNewFile *.ts,*.js inoremap [<CR> [<CR>]<UP><ESC>A<CR>
  autocmd BufRead,BufNewFile *.ts,*.js set softtabstop=2
  autocmd BufRead,BufNewFile *.ts,*.js set shiftwidth=2
augroup END
"vimrcが編集されたらすぐに反映する
augroup Source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

if filereadable(expand('~/vimrc/localsetting'))
  set runtimepath+=$HOME/vimrc
  runtime localsetting
endif

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"Use neocomplete.
let g:neocomplete#enable_at_startup = 1
"Use smartcase.
let g:neocomplete#enable_smart_case = 1
"Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

"Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default': '',
    \ 'vimshell': $HOME.'/.vimshell_hist',
    \ 'scheme': $HOME.'/.gosh_completions'
    \ }

"============================================================================================================================
" neocomplete settings
"============================================================================================================================
"Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
"Recommended key-mappings.
"<CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>": "") . "\<CR>"
  "For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>": "\<CR>"
endfunction"<TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>": "\<TAB>"
"<C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>": "\<Space>"

"AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

"Shell like behavior(not recommended).
"set completeopt+=longest"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>": "\<C-x>\<C-u>"

"Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^.
"\t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]
"*\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]
"*\t]\%(\.\|->\)\|\h\w*::'

"For perlomni.vim setting.
"https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"============================================================================================================================
" closetag settings
"============================================================================================================================
let g:closetag_filenames = '*.html,*.xml,*.erb,*.vue,*.md'
