-- Language servers need to be installed separately
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

-- Config taken from
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/pyright.lua
vim.lsp.config.pyright = {
  cmd = { 'pyright-langserver', '--stdio' },
  root_markers = { 'pyproject.toml' },
  filetypes = { 'python' },
  -- https://microsoft.github.io/pyright/#/settings
  settings = {
    python = {},
  },
}

vim.lsp.enable({ 'pyright' })

--vim.lsp.set_log_level("DEBUG")
