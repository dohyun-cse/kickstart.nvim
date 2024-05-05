return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls', 'clangd', 'texlab' },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require 'lspconfig'
      lspconfig.lua_ls.setup {}
      lspconfig.clangd.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        cmd = { 'clangd', '--offset-encoding=utf-16' },
      }
      lspconfig.texlab.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
          texlab = {
            diagnostics = {
              ignoredPatterns = {
                'LaTeX Font Warning: Font shape',
                'Underfull',
                'Overfull',
                'Package breakurl Warning',
              },
            },
          },
        },
      }
    end,
  },
}
