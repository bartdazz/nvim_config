vim.cmd("set relativenumber")
vim.cmd("set nu rnu")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.keymap.set('n', '<C-j>', '<C-w>j', {})
vim.keymap.set('n', '<C-k>', '<C-w>k', {})
vim.keymap.set('n', '<C-h>', '<C-w>h', {})
vim.keymap.set('n', '<C-l>', '<C-w>l', {})

--vim.opt.swapfile = false
--vim.opt.backup = false
vim.opt.undofile = true
