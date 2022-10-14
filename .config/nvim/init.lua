require('nqmq.base')
require('nqmq.plugins')
require('nqmq.maps')

vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])

-- vim.g.airline_theme = 'deus'
vim.g.airline_theme = 'deus'
-- Color Scheme
vim.cmd[[colorscheme tokyonight]]
-- vim.cmd 'colorscheme iceberg'
vim.cmd 'let g:airline#extensions#tabline#enabled = 1'
vim.cmd "let g:airline#extensions#tabline#buffer_idx_mode = 1"
vim.cmd "let g:airline#extensions#tabline#buffer_idx_format = { '0': '0 ', '1': '1 ', '2': '2 ', '3': '3 ', '4': '4 ', '5': '5 ', '6': '6 ', '7': '7 ', '8': '8 ', '9': '9 '}"
