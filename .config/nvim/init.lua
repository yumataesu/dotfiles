require('nqmq.base')
require('nqmq.plugins')
require('nqmq.maps')

vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])

vim.g.airline_theme = 'deus'
-- Color Scheme
vim.cmd[[colorscheme tokyonight]]
-- vim.cmd 'colorscheme iceberg'
vim.cmd 'let g:airline#extensions#tabline#enabled = 1'
