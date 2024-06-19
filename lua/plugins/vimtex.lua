vim.g.maplocalleader = ' '
return {
  'lervag/vimtex',
  init = function()
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_skim_activate = 0
    vim.g.vimtex_quickfix_ignore_filters = {
      'Underfull',
      'Overfull',
      'Tight',
      'LaTeX Font Warning',
      'Package breakurl Warning',
      'Package caption Warning: Unknown document class (or package), standard defaults will be used.',
    }
  end,
}
