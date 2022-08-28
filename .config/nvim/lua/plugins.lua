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
-- LSP Server
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig' -- LSP
-- Autocompletes
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/vim-vsnip"

  use "nvim-treesitter/nvim-treesitter"

  use "lewis6991/gitsigns.nvim"
  use "akinsho/toggleterm.nvim"
-- fazzy finder
  use "junegunn/fzf.vim"

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    disable = {
      'lua', 'ruby'
    }
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
end)

-- 1. LSP Sever management
vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])

local on_attach = function(client, bufnr)

  -- LSPサーバーのフォーマット機能を無効にするには下の行をコメントアウト
  -- 例えばtypescript-language-serverにはコードのフォーマット機能が付いているが代わりにprettierでフォーマットしたいときなどに使う
  -- client.resolved_capabilities.document_formatting = false

  local set = vim.keymap.set
  set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  set("n", "<C-k>j", "<cmd>lua vim.lsp.buf.implementation()<CR>")
--  set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
--  set("n", "<C-w>a", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
--  set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
--  set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  set("n", "<C-k>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  set("n", "<C-k>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
  set("n", "<C-k>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  set("n", "<C-k>s", "<cmd>lua vim.lsp.buf.references()<CR>")
--  set("n", "<C-e>", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
--  set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
--  set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
--  set("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
  set("n", "<C-k>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end


require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach,
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
  end,
}

vim.opt.completeopt = "menu,menuone,noselect"

local cmp = require"cmp"
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }, {
    { name = "buffer" },
  })
})



require('gitsigns').setup{}



-- Lazygit config
require("toggleterm").setup()
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true
})

function lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>lua lazygit_toggle()<CR>", { noremap = true, silent = true })



-- require('fzf').setup()
require('nvim-treesitter.configs').setup{
  highlight = {
    enable = true,
  }
}


-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


