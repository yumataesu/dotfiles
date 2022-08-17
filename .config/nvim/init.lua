require('base')
require('plugins')
--
--

vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]



vim.g.airline_theme = 'deus'


-- Color Scheme
vim.cmd 'colorscheme iceberg'
vim.cmd 'let g:airline#extensions#tabline#enabled = 1'
