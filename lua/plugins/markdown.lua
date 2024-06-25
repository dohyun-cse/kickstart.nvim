return {
  "preservim/vim-markdown",
  config = function()
    vim.g.vim_markdown_toc_autofit = 1
    vim.g.vim_markdown_conceal = 2
    vim.g.tex_conceal = ""
    vim.g.vim_markdown_math = 1
    vim.g.vim_markdown_conceal_code_blocks = 1
    vim.g.vim_markdown_follow_anchor = 1
    vim.g.vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"
    vim.g.vim_markdown_new_list_item_indent = 2
    vim.g.vim_markdown_auto_insert_bullets = 1
  end
}
