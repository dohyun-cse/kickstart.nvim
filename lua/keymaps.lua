-- Category
local tbuiltin = require 'telescope.builtin'
local gitsigns = require 'gitsigns'
local harpoon = require 'harpoon'
local lazygit = require 'lazygit'
function Git_commit()
  vim.ui.input({prompt = 'Commit message: '}, function(message)
    if (message == nil or message == '')
    then
      print("Empty commit message. Abort Commit.")
    else
      vim.cmd("!git commit -m " .. string.format("%q", message))
    end
  end)
end

--
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Document' })
vim.keymap.set('n', '<leader>e', '<cmd>Neotree filesystem reveal right<CR>', { desc = '[E]xplorer' })
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = '[Z]en mode' })

require('which-key').register({
  ['g'] = {
    name = '[G]it',
    s = { '<cmd>LazyGit<CR>', '[S]tatus' },
    c = { Git_commit, '[C]ommit' },
    l = { '<cmd>LazyGitFilterCurrentFile<CR>', '[L]ogs (current buffer)' },
    L = { '<cmd>LazyGitFilter<CR>', '[L]ogs' },
    a = { gitsigns.stage_hunk, '[A]dd' },
    u = { gitsigns.undo_stage_hunk, '[U]nstage' },
    r = { gitsigns.reset_hunk, '[R]eset' },
    h = { gitsigns.preview_hunk, '[H]unk Preview' },
    b = {
      name = '[B]uffer',
      a = { gitsigns.stage_buffer, '[A]dd' },
      r = { gitsigns.stage_buffer, '[R]eset' },
    },
  },

  ['c'] = {
    name = '[C]ode',
    a = { require('actions-preview').code_actions, '[C]ode [A]ction Preview' },
    f = { vim.lsp.buf.format, '[C]ode [F]ormat' },
    r = { vim.lsp.buf.rename, '[R]ename' },
    d = { tbuiltin.diagnostics, '[D]iagnostic' },
    g = { tbuiltin.lsp_implementations, '[G]oto implementation' },
  },

  ['s'] = {
    name = '[S]earch',
    f = { tbuiltin.find_files, '[F]ile' },
    g = { tbuiltin.live_grep, '[G]rep' },
    h = { tbuiltin.help_tags, '[H]elp' },
    k = { tbuiltin.keymaps, '[K]eymaps' },
    l = { tbuiltin.current_buffer_fuzzy_find, '[L]ocal Grep' },
    b = { tbuiltin.git_branches, '[B]ranches' },
    n = { '<cmd>TodoTelescope<CR>', '[N]otes, Todo, etc' },
  },

  ['h'] = {
    name = '[H]arpoon',
    a = {
      function()
        harpoon:list():add()
      end,
      '[H]arpoon [A]dd',
    },
    l = {
      function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      '[H]arpoon [L]ist',
    },
    q = {
      function()
        harpoon:list():select(1)
      end,
      'Select First',
    },
    w = {
      function()
        harpoon:list():select(2)
      end,
      'Select Second',
    },
    e = {
      function()
        harpoon:list():select(3)
      end,
      'Select Third',
    },
    r = {
      function()
        harpoon:list():select(4)
      end,
      'Select Fourth',
    },
    p = {
      function()
        harpoon:list():prev()
      end,
      '[H]arpoon [P]revious',
    },
    n = {
      function()
        harpoon:list():next()
      end,
      '[H]arpoon [N]ext',
    },
  },

  [' '] = { tbuiltin.buffers, 'Current Buffers' },
}, { prefix = '<leader>' })

-- lsp-related
require('which-key').register({
  g = {
    name = '[G]it',
    a = {
      function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end,
      '[G]it [S]tage Selection',
    },
    r = {
      function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end,
      '[G]it [R]eset Selection',
    },
  },
}, { mode = 'v', prefix = '<leader>' })
