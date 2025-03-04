local set = vim.opt

set.conceallevel = 2
set.concealcursor = ""


return {
  'razak17/tailwind-fold.nvim',
  opts = {},
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  ft = { 'html', 'typescriptreact' },
  symbol = "…"
}
