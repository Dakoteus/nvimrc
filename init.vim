if empty(glob(stdpath('data').'/site/autoload/plug.vim'))
silent execute '!curl -fLo '.shellescape(stdpath('data')).'/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if v:shell_error
autocmd VimEnter * echohl WarningMsg | echom 'Automatic plugin installation failed.' | echohl None
else
autocmd VimEnter * PlugClean! | PlugUpdate --sync | q | qa
endif
endif
if !empty(glob(stdpath('data').'/site/autoload/plug.vim'))
command Update PlugUpgrade | PlugClean! | PlugUpdate --sync | q | qa
call plug#begin(stdpath('data').'/plugged')
Plug 'https://github.com/chrisbra/unicode.vim.git'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
let g:Unicode_URL = 'https://www.unicode.org/Public/UNIDATA/UnicodeData.txt'
Plug 'https://github.com/gruvbox-community/gruvbox.git'
Plug 'https://github.com/justmao945/vim-clang.git', { 'for': ['c', 'cpp'] }
let g:clang_auto=1
let g:clang_complete_auto=1
let g:clang_library_path='/usr/lib/llvm-7/lib'
let g:clang_c_completeopt = 'longest,menuone,preview'
let g:clang_c_options = '-std=gnu17'
let g:clang_cpp_options = '-std=gnu++17'
Plug 'https://github.com/majutsushi/tagbar.git', { 'on': ['Tagbar', 'TagbarClose', 'TagbarCurrentTag', 'TagbarDebug', 'TarbarDebugEnd', 'TagbarGetTypeConfig', 'TagbarOpen', 'TagbarOpenAutoClose', 'TagbarSetFoldlevel', 'TagbarShowTag', 'TagbarToggle', 'TagbarTogglePause'] }
let g:tagbar_compact = 1
let g:tagbar_zoomwidth = 0
Plug 'https://github.com/tpope/vim-unimpaired.git'
Plug 'https://github.com/w0rp/ale.git'
Plug 'https://github.com/xolox/vim-easytags.git'
Plug 'https://github.com/xolox/vim-misc.git'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
let g:ale_c_clang_options = '-Og -Weverything -g -pipe -std=gnu17'
let g:ale_c_gcc_options = '-Og -Wall -Wextra -Wpedantic -fvar-tracking-assignments -g -pipe'
let g:ale_cpp_clang_options = '-Og -Weverything -g -pipe -std=gnu++17'
let g:ale_cpp_gcc_options = '-Og -Wall -Wextra -Wpedantic -fvar-tracking-assignments -g -pipe -std=gnu++17'
let g:ale_use_global_executables = 1
let b:easytags_auto_highlight=1
call plug#end()
silent! colorscheme gruvbox
endif

autocmd BufWrite * filetype detect
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd BufEnter *.cpp :HighlightTags
let g:netrw_banner=0
let g:netrw_dirhistmax=0
let g:latex_viewer = 'zathura'
set background=dark
set clipboard=unnamedplus
set formatoptions+=j
set hidden
set list
set listchars=nbsp:⍽,tab:⇥·,trail:␣
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set number
set numberwidth=1
set omnifunc=syntaxcomplete#Complete
set path+=**
set secure
set shada=
set shiftwidth=4
set spell
set tabstop=4
set termguicolors
set wildmode=longest:full,full
inoremap <C-S> <C-O>:update<CR>
noremap <C-S> :update<CR>
