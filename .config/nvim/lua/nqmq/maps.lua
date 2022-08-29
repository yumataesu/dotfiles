local keymap = vim.keymap


keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')


-- keymap.set('n', '', '')


