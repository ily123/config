-- Helpful links:
-- https://github.com/nvim-treesitter/nvim-treesitter
-- Check :h nvim-treesitter-commands for a list of all available commands
-- Configuration example: https://mhpark.me/posts/update-treesitter-main/


--- Configure tree-sitter
--- To compile parsers, it needs tree-sitter-cli installed
local function config()
  if vim.fn.executable("tree-sitter") == 0 then
    vim.notify(
      "Failed to configure tree-sitter " ..
      "because tree-sitter-cli is not installed",
      vim.log.levels.WARN
    )
    return
  end

  ts = require("nvim-treesitter")
  ts.install({ "typescript", "python", "vim", "lua", "hcl", "tsx" })
end


return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = config,
}
