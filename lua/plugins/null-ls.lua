return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
      },
    }
    local builtin = require 'telescope.builtin'
    require('which-key').register {
      K = { vim.lsp.buf.hover, 'Show help' },
      ['<leader>c'] = {
        name = '[C]ode',
        a = { vim.lsp.buf.code_action, '+[A]ction' },
        f = { vim.lsp.buf.format, '+[F]ormat' },
        r = { vim.lsp.buf.rename, '+[R]ename' },
        d = { builtin.diagnostics, '+[D]iagnostic' },
      },
    }
  end,
}
