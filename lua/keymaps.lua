-- Category
local tbuiltin = require 'telescope.builtin'
local gitsigns = require 'gitsigns'
local harpoon = require 'harpoon'

function Git_commit()
  vim.ui.input({ prompt = 'Commit message: ' }, function(message)
    if message == nil or message == '' then
      print 'Empty commit message. Abort Commit.'
    else
      vim.cmd('!git commit -m ' .. string.format('%q', message))
    end
  end)
end

--
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Document' })
vim.keymap.set('n', '<leader>e', '<cmd>Neotree filesystem reveal right<CR>', { desc = '[E]xplorer' })
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = '[Z]en mode' })

require('which-key').register({
  ['g'] = { name = '[G]it', b = { name = '[B]uffer' } },
  ['c'] = { name = '[C]ode' },
  ['s'] = { name = '[S]earch', s = { name = '[S]ymbols' } },
  ['h'] = { name = '[H]arpoon' },
}, { prefix = '<leader>' })
require('which-key').register({ g = { name = '[G]it' } }, { mode = 'v', prefix = '<leader>' })

-- keymap set
local opt = { silent = true }
local prefix = ''

-- git
prefix = '<leader>g'
vim.keymap.set('n', prefix .. 's', '<cmd>LazyGit<CR>', { desc = '[S]tatus' }, opt)
vim.keymap.set('n', prefix .. 'c', Git_commit, { desc = '[C]ommit' }, opt)
vim.keymap.set('n', prefix .. 'l', '<cmd>LazyGitFilterCurrentFile<CR>', { desc = '[L]ogs (current buffer)' }, opt)
vim.keymap.set('n', prefix .. 'L', '<cmd>LazyGitFilter<CR>', { desc = '[L]ogs' }, opt)
vim.keymap.set('n', prefix .. 'a', gitsigns.stage_hunk, { desc = '[A]dd' }, opt)
vim.keymap.set('n', prefix .. 'u', gitsigns.undo_stage_hunk, { desc = '[U]nstage' }, opt)
vim.keymap.set('n', prefix .. 'r', gitsigns.reset_hunk, { desc = '[R]eset' }, opt)
vim.keymap.set('n', prefix .. 'h', gitsigns.preview_hunk, { desc = '[H]unk Preview' }, opt)
vim.keymap.set('n', prefix .. 'd', '<cmd>DiffviewOpen<CR>', { desc = '[D]iff View' }, opt)
vim.keymap.set('v', 'a', function()
  gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = '[G]it [S]tage Selection' })
vim.keymap.set('v', 'r', function()
  gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = '[G]it [R]eset Selection' })

-- git buffer
prefix = '<leader>gb'
vim.keymap.set('n', prefix .. 'a', gitsigns.stage_buffer, { desc = '[A]dd' }, opt)
vim.keymap.set('n', prefix .. 'r', gitsigns.stage_buffer, { desc = '[R]eset' }, opt)

-- code
prefix = '<leader>c'
vim.keymap.set('n', prefix .. 'a', require('actions-preview').code_actions, { desc = '[C]ode [A]ction Preview' }, opt)
vim.keymap.set('n', prefix .. 'f', vim.lsp.buf.format, { desc = '[C]ode [F]ormat' }, opt)
vim.keymap.set('n', prefix .. 'r', vim.lsp.buf.rename, { desc = '[R]ename' }, opt)
vim.keymap.set('n', prefix .. 'd', tbuiltin.diagnostics, { desc = '[D]iagnostic' }, opt)
vim.keymap.set('n', prefix .. 'g', tbuiltin.lsp_implementations, { desc = '[G]oto implementation' }, opt)
vim.keymap.set('n', prefix .. 'k', '<cmd>vim.diagnostics.open_float()<CR>', { desc = 'Open diagnostics in float' }, opt)

-- search
prefix = '<leader>s'
vim.keymap.set('n', '<leader>' .. ' ', tbuiltin.buffers, { desc = 'Current Buffers' }, opt)
vim.keymap.set('n', prefix .. 'f', tbuiltin.find_files, { desc = '[F]ile' }, opt)
vim.keymap.set('n', prefix .. 'g', tbuiltin.live_grep, { desc = '[G]rep' }, opt)
vim.keymap.set('n', prefix .. 'h', tbuiltin.help_tags, { desc = '[H]elp' }, opt)
vim.keymap.set('n', prefix .. 'k', tbuiltin.keymaps, { desc = '[K]eymaps' }, opt)
vim.keymap.set('n', prefix .. 'l', tbuiltin.current_buffer_fuzzy_find, { desc = '[L]ocal Grep' }, opt)
vim.keymap.set('n', prefix .. 'b', tbuiltin.git_branches, { desc = '[B]ranches' }, opt)
vim.keymap.set('n', prefix .. 'n', '<cmd>TodoTelescope<CR>', { desc = '[N]otes, Todo, etc' }, opt)
vim.keymap.set('n', prefix .. 'w', tbuiltin.lsp_workspace_symbols, { desc = '[W]orkspace' }, opt)
vim.keymap.set('n', prefix .. 'b', tbuiltin.lsp_document_symbols, { desc = '[B]uffer' }, opt)
vim.keymap.set('n', prefix .. 'd', tbuiltin.lsp_dynamic_workspace_symbols, { desc = '[D]ynamic Workspace' }, opt)

-- harpoon
prefix = '<leader>h'
vim.keymap.set('n', prefix .. 'a', function()
  harpoon:list():add()
end, { desc = '[H]arpoon [A]dd' }, opt)
vim.keymap.set('n', prefix .. 'l', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = '[H]arpoon [L]ist' }, opt)
vim.keymap.set('n', prefix .. 'q', function()
  harpoon:list():select(1)
end, { desc = 'Select First' }, opt)
vim.keymap.set('n', prefix .. 'w', function()
  harpoon:list():select(2)
end, { desc = 'Select Second' }, opt)
vim.keymap.set('n', prefix .. 'e', function()
  harpoon:list():select(3)
end, { desc = 'Select Third' }, opt)
vim.keymap.set('n', prefix .. 'r', function()
  harpoon:list():select(4)
end, { desc = 'Select Fourth' }, opt)
vim.keymap.set('n', prefix .. 'p', function()
  harpoon:list():prev()
end, { desc = '[H]arpoon [P]revious' }, opt)
vim.keymap.set('n', prefix .. 'n', function()
  harpoon:list():next()
end, { desc = '[H]arpoon [N]ext' }, opt)
