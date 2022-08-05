" ######## Appearance
set encoding=utf-8
set confirm
set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set nolist
set showmatch

" ######## Search/Replace
set ignorecase
set wrapscan
set hlsearch



" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


" save by cntrl + s
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

set nocp
filetype plugin on


colorscheme iceberg

" Required:
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/dein/repos/github.com/Shougo/dein.vim')

" Let dein manage dein
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif



command! -nargs=0 Format :call CocAction('format')

lua << EOF
require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD',         vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd',         vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K',          vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi',         vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>',      vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa',  vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr',  vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl',  function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D',   vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn',  vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca',  vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr',         vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f',   vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require('lspconfig')['pylsp'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
  }

EOF


let g:netrw_liststyle=1
" ヘッダを非表示にする
let g:netrw_banner=0
" サイズを(K,M,G)で表示する
let g:netrw_sizestyle="H"
" 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1

let g:netrw_bufsettings="noma nomod nu nobl nowrap ro nornu"

augroup ProjectDrawer
  " autocmd!
  " autocmd VimEnter * :sp :term://top
augroup END

lua << EOF
EOF

