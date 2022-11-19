execute pathogen#infect()
" Check ~/.vim/bundle for a list of plugins

call plug#begin('~/.vim/plugged')
  Plug 'patstockwell/vim-monokai-tasty'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'styled-components/vim-styled-components'
  Plug 'elzr/vim-json'
  Plug 'jparise/vim-graphql'
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  Plug 'mattn/emmet-vim'
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

"Key Mappings For Plugins
"Key Mapping for tagbar
nmap <F8> :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

" Set new mapping for escaping insert mode
inoremap kj <Esc>

" Window Navigation with Ctrl-[hjkl]
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
" autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"NERD Tree"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"Key Mappings For Plugins
"
"Key Mapping for Status line 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{FugitiveStatusline()}

" Key mapping for Syntasttic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" COC Neovim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Emmet"
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\   'javascript.jsx': {
\       'extends': 'jsx',
\   },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

" Indentation & Tabs
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Display & format
set number
set textwidth=80
set wrapmargin=2
set showmatch

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Browse & Scroll
set scrolloff=5
set laststatus=2

" Spell
set spell spelllang=en_us

" Miscellaneous
set nobackup
set noswapfile
set autochdir
set undofile
set visualbell
set errorbells
set backspace=indent,eol,start
set noundofile

syntax on
set t_Co=256

set cursorline
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty
let g:lightline = {
      \ 'colorscheme': 'monokai_tasty',
      \ }
let g:airline_theme='monokai_tasty'
set ttyfast
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
