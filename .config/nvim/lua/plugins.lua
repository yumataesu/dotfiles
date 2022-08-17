local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/vim-vsnip"
end)

-- 1. LSP Sever management
-- keyboard shortcut
-- vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
--
--
--
local mason = require('mason')
mason.setup({
   ui = {
     icons = {
       package_installed = "✓",
       package_pending = "➜",
       package_uninstalled = "✗"
     }
   }
 })

local nvim_lsp = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup_handlers({ function(server_name)
   local opts = {}
   opts.on_attach = function(_, bufnr)
     local bufopts = { silent = true, buffer = bufnr }
     vim.keymap.set('n', 'K',  vim.lsp.buf.hover, bufopts)
     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
     vim.keymap.set('n', 'gtD', vim.lsp.buf.type_definition, bufopts)
     vim.keymap.set('n', 'grf', vim.lsp.buf.references, bufopts)
     vim.keymap.set('n', '<space>p', vim.lsp.buf.format, bufopts)
  end
   nvim_lsp[server_name].setup(opts)
end })

