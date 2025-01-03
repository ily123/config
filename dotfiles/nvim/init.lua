-- Load native settings
require("config.settings")
require("config.keymap")

-- Install the Lazy package manager
require("config.lazy")

-- Using Lazy package manager, load third party plugins
-- Any lua file in ~/.config/nvim/lua/plugins/*.lua will be
-- automatically merged in the main plugin spec
require("lazy").setup({
  spec = {
    import = "plugins"
  },
  checker = { enabled = true },
})

-- LSP requires extensive configuration that can't be inlined
-- so we call it in a separate script
require("config.lsp")
