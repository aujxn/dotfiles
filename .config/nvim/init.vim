" Fish doesn't cooperate
set shell=/bin/bash
let mapleader = "\<Space>"

" Point to my python virtual environments
let g:python_host_prog = '/home/austen/python2/bin/python2'
let g:python3_host_prog = '/home/austen/python3/bin/python'

" Automatically downloads plugin manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==========================================================================
" # PLUGINS
" ==========================================================================

" To add a plugin:
" 1. list plugin inside calls (git repo or plugin name)
" 2. reload vimrc with :source ~/.config/nvim/init.vim
" 3. :PlugInstall to install
" 4. :PlugUpdate to update plugins then D to review changes
" 	(or :PlugDiff later)
" 5. :PlugClean to purge removed plugins
call plug#begin('~/.local/share/nvim/plugged')

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'vim-scripts/localvimrc'
Plug 'justinmk/vim-sneak'
Plug 'Konfekt/FastFold'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'jalvesaq/Nvim-R'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'rhysd/vim-grammarous'

call plug#end()

"lightline settings
let g:lightline = {
   \'colorscheme' : 'selenized_dark'
   \ }

" grammer settings
let g:grammarous#show_first_error = 1
let g:grammarous#use_vim_spellland = 1
"set spell
set spelllang=en_us

"don't know what this does actualy
if has('nvim')
	set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
	set inccommand=nosplit
	noremap <C-q> :confirm qall<CR>
end

"fzf hotkeys
map <C-p> <esc>:Files<CR>
nmap <leader>; :Buffers<CR>

"secure mode lines settings
let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]

let g:sneak#s_next = 1

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" ==========================================================================
" # EDITOR SETTINGS
" ==========================================================================

set timeoutlen=300
set ttimeoutlen=80

set foldmethod=indent
set foldnestmax=1
let g:fastfold_savehook = 0

"minimum number of lines from cursur to end of screen
set scrolloff=5

"sets relative numbering on active pane when in normal mode but absolute otherwise
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" persistent undo when file is closed
set undodir=~/.vimdid
set undofile

" Completion
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Diagnostic navigation
nmap <silent> E <Plug>(coc-diagnostic-prev)
nmap <silent> W <Plug>(coc-diagnostic-next)

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Proper search
set incsearch
set ignorecase
set smartcase

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

"sane splits
set splitright
set splitbelow

" no arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"fast enter normal mode
inoremap fd <esc>

"jump to start and end of line with homerow
nnoremap H ^
nnoremap L $

"yank and put from system clipboard - doesn't work through ssh
noremap <leader>y "+y
noremap <leader>p "+p

" Keymap for replacing up to next _ or -
noremap <leader>m ct_
noremap <leader>n ct-

" quick edit/source vimrc
noremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" tab settings
set shiftwidth=3
set softtabstop=3
set tabstop=3
set expandtab

" ==========================================================================
" # GUI SETTINGS
" ==========================================================================

set guioptions-=T	"Remove toolbar
set ruler
set cursorline

augroup highlightline
   autocmd!
   autocmd InsertEnter * set nocursorline
   autocmd InsertLeave * set cursorline
augroup END

set t_Co=256
"set termguicolors


"if !has('gui_running')
"  set t_Co=256
"endif
"if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
"   set termguicolors
"endif

"set background=dark
"hi Normal ctermbg=NONE

"no longer using base16
"let base16colorspace=256
"let g:base16_shell_path="~/.config/base16-shell/scripts"
"instead using themes directly
colorscheme selenized_dark

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Help filetype detection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.lds set filetype=ld
autocmd BufRead *.tex set filetype=tex
autocmd BufRead *.trm set filetype=c
autocmd BufRead *.xlsx.axlsx set filetype=ruby
autocmd BufRead *.tpp set filetype=cpp

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
			\   <bang>0 ? fzf#vim#with_preview('up:60%')
			\           : fzf#vim#with_preview('right:50%:hidden', '?'),
			\   <bang>0)

function! s:list_cmd()
	let base = fnamemodify(expand('%'), ':h:.:S')
	return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
			\ 'options': '--tiebreak=index'}, <bang>0)

"dont know what this does either
if has('nvim')
	runtime! plugin/python_setup.vim
endif
