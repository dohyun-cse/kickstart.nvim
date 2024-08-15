return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.astyle.with({filetypes={"cpp"}, Args={"--project=config/mfem.astylerc"}}),
      },
    }
  end,
}
