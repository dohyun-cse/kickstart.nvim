-- <leader> keymap
vim.g.mapleader = ' '

-- line number
vim.opt.number = true
vim.opt.relativenumber = true
-- sync clipboard with OS
vim.opt.clipboard = 'unnamedplus'

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indentation
vim.cmd 'set expandtab'
vim.cmd 'set tabstop=2'
vim.cmd 'set softtabstop=2'
vim.cmd 'set shiftwidth=2'
vim.opt.breakindent = true

-- undo history
vim.opt.undofile = true

-- highlight text when yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--vim.opt.incco
vim.opt.inccommand = 'split'
vim.opt.hlsearch = true
vim.keymap.set('n', '<esc>', '<cmd>nohl<CR>', { desc = 'Disable Search Highlight' })
