set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set spelllang=en,ru
set nocompatible              " be iMproved, required
set encoding=utf8
set fileencoding=utf-8
scriptencoding utf-8
set encoding=utf-8
filetype off                  " required
set guifont=Fura\ Code\ Medium\ Nerd\ Font\ 20
set timeoutlen=1000 ttimeoutlen=0
set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?
"set keymap=russian-jcukenwin
set t_Co=256
set ttyfast                                 " terminal acceleration set autoindent                             " indent when moving to the next line while writing code
set confirm
set enc=utf-8	                            " utf-8 by default
set expandtab                               " expand tabs into spaces
set exrc                                    " enable usage of additional .vimrc files from working directory
set foldlevel=1
set foldmethod=indent
set foldnestmax=10
set hidden
set iminsert=0
set imsearch=0
set laststatus=2
set nobackup 	                            " no backup files
set nofoldenable
set noswapfile 	                            " no swap files set nowritebackup                           " only in case you don't want a backup file while editing
set number relativenumber                                 " show line numbers
set ruler
set scrolloff=50                            " let 10 lines before/after cursor during scroll
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...
set shell=/bin/zsh
set shiftwidth=4                            " shift lines by 4 spaces
set showmatch                               " shows matching part of bracket pairs (), [], {}
set smarttab                                " set tabs for a shifttabs logic
set spell
set tabstop=4                               " 4 whitespaces for tabs visual presentation
set undofile
set nowrap linebreak nolist
set nohlsearch
set conceallevel=1
set incsearch " incremental search

" Underline current cursor line
hi clear CursorLine
hi CursorLine gui=underline cterm=underline
set cursorline

highlight LineNr ctermfg=grey
highlight lCursor guifg=NONE guibg=Cyan

augroup CustomCursorLine
    au!
    au ColorScheme * :hi! CursorLine gui=underline cterm=underline
augroup END

call plug#begin('~/.config/nvim/plugged')

"" ------------------=== MyPlugin ===----------------------
Plug 'segeljakt/vim-silicon'
Plug 'jparise/vim-graphql'
Plug 'rhysd/vim-grammarous'

"" ------------------=== Colorscheme ===----------------------
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'kristijanhusak/vim-carbon-now-sh'

"" ------------------=== Git ===----------------------
Plug 'jceb/vim-orgmode'
Plug 'yazgoo/unicodemoji'
Plug 'yasuhiroki/github-actions-yaml.vim'

"" ------------------=== Git ===----------------------
Plug 'Xuyuanp/nerdtree-git-plugin'  
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'tpope/vim-rhubarb'
Plug 'ruanyl/vim-gh-line'

"" ------------------=== File Navigation ===----------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-visual-star-search'
Plug 'bronson/vim-visual-star-search'
Plug 'yuttie/comfortable-motion.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'easymotion/vim-easymotion'
Plug 'thaerkh/vim-indentguides' 
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/FuzzyFinder'
Plug 'chaoren/vim-wordmotion'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'rhysd/clever-f.vim'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'kshenoy/vim-signature'

"------------------=== Latex ===---------------------------------
Plug 'lervag/vimtex'
Plug 'honza/vim-snippets'

""------------------=== Other ===---------------------------------
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'kassio/neoterm'
Plug 'rhysd/vim-clang-format'
Plug 'jamessan/vim-gnupg'
Plug 'voldikss/vim-translator'
Plug 'tomlion/vim-solidity'
Plug 'szw/vim-maximizer'

" --- i3 ---
Plug 'mboughaba/i3config.vim'

"""---------------=== Languages support ===-------------
Plug 'vim-scripts/L9'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'florentc/vim-tla'

""" --- Rust ---
Plug 'uarun/vim-protobuf'
Plug 'uber/prototool', { 'rtp':'vim/prototool' }
Plug 'rust-lang/rust.vim'
Plug 'mattn/webapi-vim'
Plug 'mhinz/vim-crates'

""" --- Python ---
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-abolish'
Plug 'numirias/semshi'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_termcolors=16
"
filetype on
filetype plugin on
filetype plugin indent on
syntax enable                               " enable syntax highlighting
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'

" Vim-Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:Powerline_symbols='unicode' "Поддержка unicode

"Clever-f
let g:clever_f_across_no_line    = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms        = 3000
let g:clever_f_smart_case        = 1

"=====================================================
" Tabs / Buffers settings
"=====================================================

tab sball
set switchbuf=useopen
set laststatus=2

augroup quickfix
    autocmd!
    autocmd FileType qf setlocal nowrap
augroup END

" Enable background opacity
hi Normal guibg=NONE ctermbg=NONE 

"=====================================================
"" Comfortable Motion Settings
"=====================================================
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 40  " Feel free to increase/decrease this value.

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40

"=====================================================
"" NERDComment Settings 
"=====================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"=====================================================
" DevIcon Settings
"=====================================================
" loading the plugin 
let g:webdevicons_enable = 1

" adding the flags to NERDTree 
let g:webdevicons_enable_nerdtree = 1

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1

" use double-width(1) or single-width(0) glyphs 
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" whether or not to show the nerdtree brackets around flags 
let g:webdevicons_conceal_nerdtree_brackets = 0

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1 

" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'

" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
" disabled by default with no value
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''

" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1

" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1

" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 0

let g:tagbar_autofocus = 0

no <down>  <Nop>
no <left>  <Nop>
no <right> <Nop>
no <up>    <Nop>

ino <down>  <Nop>
ino <left>  <Nop>
ino <right> <Nop>
ino <up>    <Nop>

vno <down>  <Nop>
vno <left>  <Nop>
vno <right> <Nop>
vno <up>    <Nop>

nnoremap <Right> <C-w>l
nnoremap <Left>  <C-w>h
nnoremap <Up>    <C-w>k
nnoremap <Down>  <C-w>j

nnoremap <A-l> <C-i>
nnoremap <A-h> <C-o>

nnoremap H ^

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

au FileType cpp nmap <A-b> :1Ttoggle<CR>

let g:neoterm_default_mod='belowright'
let g:neoterm_size = 20

" Formatting selected code.
xmap <leader><F1>  <Plug>(coc-format-selected)
nmap <leader><F1>  <Plug>(coc-format-selected)


"==================================================
" Python mode setting
"==================================================

au FileType python nmap <F1> :call LanguageClient#textDocument_formatting()<CR>
au FileType python nmap <silent> gd <Plug>(coc-definition)
au FileType python nmap <silent> gi <Plug>(coc-implementation)
au FileType python nmap <silent> gr <Plug>(coc-references)

"==================================================
" Rust mode setting
"==================================================

let g:LanguageClient_serverCommands = { 
    \ 'rust': ['~/.cargo/bin/rust-analyzer'],
    \ 'python': ['python', '-m', 'pyls'],
    \ 'cpp': ['cquery'],
    \ 'c': ['cquery']
    \ }

let g:LanguageClient_autoStart = 1
let g:rust_clip_command = 'xclip -selection clipboard'

let g:racer_cmd = "/home/sad/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

nmap <silent> <leader><Insert> :CocCommand<CR>
let g:cargo_command = "Dispatch cargo {cmd}"
let g:nvimgdb_disable_start_keymaps=1

au FileType rust map <silent> [g <Plug>(coc-diagnostic-prev)
au FileType rust map <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
au FileType rust map <silent> gd <Plug>(coc-definition)
au FileType rust map <silent> gi <Plug>(coc-implementation)
au FileType rust map <silent> gr <Plug>(coc-references)

au FileType rust map <leader> gr <Plug>(coc-rename)
au FileType rust nmap <leader> -  <Plug>(coc-codeaction-selected)
au FileType rust nmap <leader> gf  <Plug>(coc-fix-current)

let g:enable_ycm_at_startup = 0

au FileType rust nmap <F1>  :RustFmt<CR>
au FileType rust nmap <F13> :AbortDispatch<CR>


au FileType rust nmap <F7>  :Dispatch cargo build<CR>
au FileType rust nmap <F19> :Dispatch cargo build --workspace<CR> 
au FileType rust nmap <F31> :Dispatch cargo build --workspace --tests<CR> 

au FileType rust nmap <F4>  :Dispatch cargo clippy<CR>
au FileType rust nmap <F16> :Dispatch cargo clippy --workspace --tests<CR>

au FileType rust nmap <F6>  :Dispatch cargo test<CR>
au FileType rust nmap <F18> :Dispatch cargo test --workspace<CR>

au FileType rust nmap <F9>  :Cargo run<CR>
au FileType rust nmap <F21> :GdbStart rust-gdb ./target/debug/

au FileType rust nmap <F8>  :GdbBreakpointToggle<CR>
au FileType rust nmap <F20> :GdbBreakpointClearAll<CR>

au FileType rust nmap <F10> :GdbNext<CR>
au FileType rust nmap <F22> :GdbStep<CR>

au FileType rust nmap <F11> :GdbContinue<CR>
au FileType rust nmap <F23> :GdbUntil<CR>
au FileType rust nmap <F12> :GdbFinish<CR>
au FileType rust nmap <F12> :GdbFinish<CR>

nmap <A-1> :NERDTreeFind<CR>
nmap <A-2> :TagbarToggle<CR>
au FileType rust nmap <A-3> :GdbCreateWatch info locals<CR>

""==================================================
"" Fzh mode setting
""==================================================
"
"map gd :YcmCompleter GoTo<CR>

map  <Leader>n <Plug>(easymotion-bd-jk)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>' :Marks<CR>
nmap <Leader>; :Buffers<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>c :BCommits<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>h :History<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>/ :Rg<Space>

nmap <Leader>m :CocAction<CR>
nmap <Leader>, :CocCommand<CR>

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>* :Lines <C-r><C-w><CR>
nnoremap <Leader># :Rg <C-r><C-w><CR>

nmap <Leader>gb :Gblame<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gs :Git<CR>
nmap <Leader>gp :Gpush<CR>
nmap <Leader>gf :Gfetch<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gm <Plug>(git-messenger)
nmap <A-f> :MaximizerToggle!<CR>

let g:git_messentalier_include_diff = "all"

nnoremap Q @@
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)

nnoremap <Leader>] :cnext<CR>
nnoremap <Leader>[ :cp<CR>

function QfMakeConv()
   let qflist = getqflist()
   for i in qflist
      let i.text = iconv(i.text, "cp936", "utf-8")
   endfor
   call setqflist(qflist)
endfunction

au QuickfixCmdPost make call QfMakeConv()

"" Terminal mode binding
nnoremap <leader><F3> :Ttoggle<CR>
tnoremap <F3> <C-\><C-n>
"" latex
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'zathura'
set conceallevel=0
let g:tex_conceal='abdmg'

if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif

" ============
" GITHUB
" ============
let g:gh_line_map_default = 0
let g:gh_line_blame_map_default = 1
let g:gh_line_map = '<leader>gh'
let g:gh_open_command = 'qutebrowser '

let g:carbon_now_sh_browser = 'qutebrowser'
let g:silicon = {
      \ 'theme':                        'GitHub',
      \ 'font':                           'Hack',
      \ 'background':                     '#fff',
      \ 'shadow-color':                   '#555',
      \ 'line-pad':                            2,
      \ 'pad-horiz':                          80,
      \ 'pad-vert':                          100,
      \ 'shadow-blur-radius':                 50,
      \ 'shadow-offset-x':                     0,
      \ 'shadow-offset-y':                     0,
      \ 'line-number':                    v:true,
      \ 'round-corner':                   v:true,
      \ 'window-controls':                v:true,
      \ }

let g:silicon['output'] = '~/Pictures/silicon/{time:%Y-%m-%d-%H%M%S}.png'
let g:airline_theme='gruvbox'
let g:python3_host_prog = '/usr/bin/python3.9'
let g:translator_target_lang = "en"

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <expr> <c-j> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'jira mine-ls',
  \ 'reducer': { lines -> '[' . split(lines[0], ' ')[0][:-2] . '] ' }}))

inoremap <expr> <c-e> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'jira mine-ls',
  \ 'reducer': { lines -> '[' . split(lines[0], ' ')[0][:-2] . '] ' }}))

function! s:cd_workspace(line)
    execute "cd " . a:line
    echomsg a:line
endfunction

function! s:change_crate()
  call fzf#run(fzf#wrap({
    \ 'dir': systemlist('git rev-parse --show-toplevel')[0],
    \ 'prefix': 'sprout-',
    \ 'source': '/home/q99/.cargo/bin/workspaces.sh',
    \ 'sink': { line -> s:cd_workspace(split(line)[1]) }
    \ }))
endfunction

nnoremap <silent> <a-w> :call <SID>change_crate()<CR>

let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#fnamecollapse = 0

autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
command! Slack :call slim#StartSlack()
