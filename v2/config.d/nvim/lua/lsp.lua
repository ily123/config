-- Language servers need to be installed separately
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md


-- set up LSP binds
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_cmds', { clear = true }),
  desc = 'LSP actions',
  callback = function(ev)
    local map = function(mode, keys, action)
      if type(keys) == 'table' then
        for _, key in ipairs(keys) do
          vim.keymap.set(mode, key, action, { buffer = ev.buf })
        end
      else
        vim.keymap.set(mode, keys, action, { buffer = ev.buf })
      end
    end

    map('n', 'K',  vim.lsp.buf.hover)
    map('n', 'gd', vim.lsp.buf.definition)
    map('n', 'gD', vim.lsp.buf.declaration)
    map('n', 'gi', vim.lsp.buf.implementation)
    map('n', 'go', vim.lsp.buf.type_definition)
    map('n', 'gr', vim.lsp.buf.references)
    map('n', 'gs', vim.lsp.buf.signature_help)
    map('n', 'gl', vim.diagnostic.open_float)
    map('n', '[g', vim.diagnostic.goto_prev)
    map('n', ']g', vim.diagnostic.goto_next)

    map('n', { '<F2>', '<leader>rn' }, vim.lsp.buf.rename)
    map({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end)
    map({ 'n', 'x' }, '<F4>', vim.lsp.buf.code_action)
  end
})


-- Configure Python stuff
-- Pyright
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

-- Ruff
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/ruff.lua
vim.lsp.config.ruff = {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
  -- https://docs.astral.sh/ruff/editors/
  settings = {},
}

vim.lsp.enable({ 'pyright', 'ruff' })

--vim.lsp.set_log_level("DEBUG")
