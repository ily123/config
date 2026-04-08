-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Language servers need to be installed separately
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- Force UTF-8 position encoding across all servers
vim.lsp.config('*', {
  offset_encoding = 'utf-8',
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

-- Make command to list binaries of servers attached to buffer
vim.api.nvim_create_user_command('LspBinaries',
  function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then
      print("No LSP clients in buffer")
      return
    end

    for _, client in ipairs(clients) do
      local cmd = client.config.cmd[1]
      local resolved = vim.fn.exepath(cmd)
      local version = client.server_info and client.server_info.version or '?'
      print(client.name .. ': ' .. (resolved ~= '' and resolved or 'not found in PATH') .. ' [v' .. version .. ']')
    end
  end,
  { desc = 'Show LSP binary paths for current buffer' }
)

-- Make command to list features of servers attached to buffer
vim.api.nvim_create_user_command('LspCapabilities',
  function()
    local lines = {}
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
      table.insert(lines, '=== ' .. client.name .. ' ===')
      for line in vim.inspect(client.server_capabilities):gmatch('[^\n]+') do
        table.insert(lines, line)
      end
      table.insert(lines, '')
    end
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.api.nvim_set_option_value('filetype', 'lua', { buf = buf })
    vim.cmd('split')
    vim.api.nvim_win_set_buf(0, buf)
  end,
  { desc = 'Print LSP server capabilities for current buffer' }
)


-- set up LSP keybinds and other functionality 
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_cmds', { clear = true }),
  desc = 'LSP actions',
  callback = function(ev)

    -- utility fn to make a keybind
    local map = function(mode, keys, action, opts)
      opts = vim.tbl_extend('force', { buffer = ev.buf }, opts or {})
      if type(keys) == 'table' then
        for _, key in ipairs(keys) do
          vim.keymap.set(mode, key, action, opts)
        end
      else
        vim.keymap.set(mode, keys, action, opts)
      end
    end

    -- keybinds
    map('n', 'K',  vim.lsp.buf.hover)
    map('n', 'gd', vim.lsp.buf.definition)
    map('n', 'gD', vim.lsp.buf.declaration)
    map('n', 'gi', vim.lsp.buf.implementation)
    map('n', 'go', vim.lsp.buf.type_definition)
    map('n', 'gr', vim.lsp.buf.references, { nowait = true })
    map('n', 'gs', vim.lsp.buf.signature_help)
    map('n', 'gl', vim.diagnostic.open_float)
    map('n', '[g', vim.diagnostic.goto_prev)
    map('n', ']g', vim.diagnostic.goto_next)
    map('n', { '<F2>', '<leader>rn' }, vim.lsp.buf.rename)
    map({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format() end)
    map({ 'n', 'x' }, '<F4>', vim.lsp.buf.code_action)

    -- Call format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = ev.buf,
      callback = function() vim.lsp.buf.format({ bufnr = ev.buf }) end,
    })
  end
})


-- Configure Python stuff
-- Pyright
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/pyright.lua
--vim.lsp.config.pyright = {
--  cmd = { 'pyright-langserver', '--stdio' },
--  root_markers = { 'pyproject.toml' },
--  filetypes = { 'python' },
--  -- https://microsoft.github.io/pyright/#/settings
--  settings = {
--    python = {},
--  },
--}

-- Ruff
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/ruff.lua
--vim.lsp.config.ruff = {
--  cmd = { 'ruff', 'server' },
--  filetypes = { 'python' },
--  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
--  -- https://docs.astral.sh/ruff/editors/
--  settings = {},
--}

-- ESLint
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/eslint.lua
--vim.lsp.config.eslint = {
--  cmd = { 'vscode-eslint-language-server', '--stdio' },
--  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
--  root_markers = { 'eslint.config.js', 'eslint.config.mjs', '.eslintrc.cjs', '.eslintrc.json', '.eslintrc.js', 'package.json' },
--  settings = {
--    validate = 'on',
--    codeAction = {
--      disableRuleComment = { enable = true },
--      showDocumentation = { enable = true },
--    },
--  },
--}

vim.lsp.enable({
  'pyright',
  'ruff',
  'eslint',
  'ts_ls' -- typescript-language-server in Mason
})

--vim.lsp.set_log_level("DEBUG")


