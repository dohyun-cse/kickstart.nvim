-- Category
require('which-key').register {
  ['<leader>g'] = { name = '[G]it' },
  ['<leader>c'] = { name = '[C]ode' },
  ['<leader>e'] = { '<cmd>Neotree filesystem reveal right<CR>', '[E]xplorer' },
  ['<leader>s'] = { name = '[S]earch' },
}

-- Search
local tbuiltin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sf', tbuiltin.find_files, { desc = '[S]earch [F]ile' })
vim.keymap.set('n', '<leader>sg', tbuiltin.live_grep, { desc = '[G]rep' })
vim.keymap.set('n', '<leader> ', tbuiltin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>sh', tbuiltin.search_history, { desc = '[S]earch [H]istory' })
vim.keymap.set('n', '<leader>sk', tbuiltin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sl', tbuiltin.current_buffer_fuzzy_find, { desc = '[L]ocal fuzzy find' })
vim.keymap.set('n', '<leader>sb', tbuiltin.git_branches, { desc = '[S]earch [B]ranches' })

-- lsp-related
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Document' })

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = '[C]ode [F]ormat' })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = '[R]ename' })
vim.keymap.set('n', '<leader>cd', tbuiltin.diagnostics, { desc = '[D]iagnostic' })
vim.keymap.set('n', '<leader>cg', tbuiltin.lsp_implementations, { desc = '[G]oto implementation' })

-- git
-- Fugitive
vim.keymap.set('n', '<leader>gs', '<cmd>DiffviewOpen<CR>', { desc = '[G]it' })
vim.keymap.set('n', '<leader>gd', '<cmd>tab Gvdiffsplit<CR>', { desc = '[G]it [D]iff' })
vim.keymap.set('n', '<leader>gq', '<cmd>diffoff!<CR>', { desc = '[G]it [Q]uit diffview' })
vim.keymap.set('n', '<leader>gf', '<cmd>Git fetch<CR>', { desc = '[G]it [F]etch' })
vim.keymap.set('n', '<leader>gP', '<cmd>Git push<CR>', { desc = '[G]it [P]ush' })
vim.keymap.set('n', '<leader>gp', '<cmd>Git pull<CR>', { desc = '[G]it [P]ull' })
vim.keymap.set('n', '<leader>gl', '<cmd>DiffviewFileHistory %<CR>', { desc = '[G]it [L]ogs (current buffer)' })
vim.keymap.set('n', '<leader>gL', '<cmd>DiffviewFileHistory<CR>', { desc = '[G]it [L]ogs' })

-- signs
local gitsigns = require 'gitsigns'
vim.keymap.set('n', '<leader>gi', function()
  gitsigns.preview_hunk()
end, { desc = '[G]it [I]n-place preview' })
vim.keymap.set('n', '<leader>gca', '<cmd>Git commit --amend --no-edit<CR>',
  { desc = '[G]it [C]ommit [A]mend with no-edit' })
vim.keymap.set('v', '<leader>ga', function()
  gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = '[G]it [A]dd' })
vim.keymap.set('v', '<leader>gu', function()
  gitsigns.undo_stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = '[G]it [U]nstage' })
vim.keymap.set('v', '<leader>gx', function()
  gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = '[G]it Discard' })

vim.keymap.set({ 'n', 'v' }, '[c', function()
  if vim.wo.diff then
    vim.cmd.normal { '[c', bang = true }
  else
    gitsigns.prev_hunk()
  end
end, { desc = 'Previous Hunk' })
vim.keymap.set({ 'n', 'v' }, ']c', function()
  if vim.wo.diff then
    vim.cmd.normal { ']c', bang = true }
  else
    gitsigns.next_hunk()
  end
end, { desc = 'Next Hunk' })
