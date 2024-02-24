" Spaces & Tabs {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent

set relativenumber
set nu rnu

call plug#begin()

"Plug 'hrsh7th/nvim-cmp'
Plug 'tpope/vim-surround'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'chrisbra/unicode.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'aklt/plantuml-syntax' 
Plug 'brgmnn/vim-opencl'

call plug#end()

lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        git = true,
	file = false,
	folder = false,
	folder_arrow = true,
      },
      glyphs = {
        folder = {
          arrow_closed = "+",
          arrow_open = "-",          
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "⌥",
          renamed = "➜",
          untracked = "★",
          deleted = "⊖",
          ignored = "◌",
        },
      },
    },
  },
})
EOF

"" Airline configuration

" Enable usage
"let g:airline#extension#tabline#enabled = 1

" Theme
let g:airline_theme = 'wombat'

" Fonts
let g:airline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" 
let g:airline_left_alt_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_alt_sep = '«'
let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Unicode configuration
let g:unicode#enabled = 1

" Tmux+Vim integration configuration
let g:tmux_navigator_no_mappings = 1

noremap <silent> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>
noremap <silent> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
noremap <silent> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
noremap <silent> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
noremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>

set laststatus=2


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <C-A> :pyf /usr/share/vim/addons/syntax/clang-format.py<cr>
imap <C-A> <c-o> :pyf /usr/share/vim/addons/syntax/clang-format.py<cr>
