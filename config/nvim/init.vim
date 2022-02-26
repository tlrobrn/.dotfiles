set nocompatible

" Plugins
call plug#begin('~/.config/nvim/bundle')

Plug 'RRethy/vim-illuminate'
Plug 'benjie/local-npm-bin.vim'
Plug 'benmills/vimux'
Plug 'flazz/vim-colorschemes'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neomake/neomake'
Plug 'rizzatti/dash.vim'
Plug 'rlue/vim-fold-rspec'
Plug 'scrooloose/nerdtree'
Plug 'slim-template/vim-slim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" COC Extensions
let g:coc_global_extensions = [
      \'coc-css',
      \'coc-elixir',
      \'coc-eslint',
      \'coc-html',
      \'coc-json',
      \'coc-marketplace',
      \'coc-rls',
      \'coc-solargraph',
      \'coc-sql',
      \'coc-sumneko-lua',
      \'coc-tailwindcss',
      \'coc-toml',
      \'coc-tsserver',
      \'coc-yaml',
      \]

" Hybrid Line numbers
set number
set relativenumber

" Theme
silent! colorscheme preto
hi Folded cterm=none ctermbg=0 ctermfg=6 gui=none guibg=#8F8F8F guifg=#C4E858
set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
hi CursorLineNr    term=bold cterm=bold ctermfg=012 gui=bold

set nowrap
set showmatch
set splitbelow
set splitright
au WinEnter * set cursorline
au WinLeave * set nocursorline nocursorcolumn
hi Comment cterm=italic
hi htmlArg cterm=italic
hi Type cterm=italic

" Tab / Indentation
set backspace=indent,eol,start
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch

" Airline
set laststatus=2
set ruler
set showcmd
let g:airline_theme='deus'

" FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_buffers_jump = 1


" Neomake
call neomake#configure#automake('nrwi', 500)
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri', 'rubylint']

" Illuminate
let g:Illuminate_ftblacklist = ['nerdtree']

" Test
let test#strategy = 'vimux'
nnoremap <silent> <leader>rf :wa<CR>:TestNearest<CR>
nnoremap <silent> <leader>rb :wa<CR>:TestFile<CR>
nnoremap <silent> <leader>ra :wa<CR>:TestSuite<CR>
nnoremap <silent> <leader>rl :wa<CR>:TestLast<CR>

" Grep
function! GitGrepWord()
  cgetexpr system("rg -n '" . expand("<cword>") . "'")
  cwin
  echo 'Number of matches: ' . len(getqflist())
endfunction
command! -nargs=0 GitGrepWord :call GitGrepWord()
nnoremap <silent> <Leader>gw :GitGrepWord<CR>

" Key bindings
inoremap <silent>jk <ESC>
noremap <silent> <LocalLeader>nt :NERDTreeToggle<CR>
noremap <silent> <LocalLeader>nf :NERDTreeFind<CR>
noremap <silent> <LocalLeader>ff :Files<CR>
noremap <silent> <LocalLeader>gf :GFiles<CR>
noremap <silent> <LocalLeader>be :Buffers<CR>
nnoremap <C-W>z <C-W>\|<C-W>_

" copy relative file path to system clipboard
nnoremap <silent> <LocalLeader>cf :let @*=expand("%")<CR>
" source config
nnoremap <LocalLeader>re :source ~/.config/nvim/init.vim<CR>
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

set hidden

"command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" disable python2
let g:loaded_python_provider = 0
