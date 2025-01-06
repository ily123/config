-- Load native settings
require("config.settings")
require("config.keymap")

-- Install the Lazy package manager
require("config.lazy")

-- LSP requires extensive configuration that can't be inlined
-- so we call it in a separate script
require("config.lsp")
