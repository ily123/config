-- Load native settings
require("settings")
require("keymap")

-- Install the Lazy package manager
require("lazy_init")

-- Using Lazy package manager, load third party plugins
-- Any lua file in ~/.config/nvim/lua/plugins/*.lua will be
-- automatically merged in the main plugin spec
require("lazy").setup("plugins")

-- LSP requires extensive configuration that can't be inlined
-- so we call it in a separate script
require("lsp_config")
