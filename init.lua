-- lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require 'vim-options'
require('lazy').setup 'plugins'
require 'keymaps'
vim.cmd [[colorscheme dracula]]
vim.cmd [[highlight! DiffChange ctermbg=7 guibg=#313241]]
vim.cmd [[highlight! DiffText ctermbg=8 ctermfg=15 guibg=#4E432F guifg=#ffffff]]
