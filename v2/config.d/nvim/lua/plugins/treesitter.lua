-- Helpful links:
-- https://github.com/nvim-treesitter/nvim-treesitter
-- Check :h nvim-treesitter-commands for a list of all available commands
-- Configuration example: https://mhpark.me/posts/update-treesitter-main/


--- Configure tree-sitter
local function config()
  --- To compile parsers, it needs tree-sitter-cli installed
  --- Hint: to install cli tool, there is install.d/tree-sitter-cli
  if vim.fn.executable("tree-sitter") == 0 then
    vim.notify(
      "Failed to configure tree-sitter " ..
      "because tree-sitter-cli is not installed",
      vim.log.levels.WARN
    )
    return
  end

  -- install parsers
  local parsers = {
    "typescript",
    "python",
    "vim",
    "lua",
    "hcl",
    "tsx" 
  }
  require("nvim-treesitter").install(parsers)

  -- make a list of file types we got a parser for
  local fileTypes = {}
  for _, parser in ipairs(parsers) do
    fts = vim.treesitter.language.get_filetypes(parser)
    for _, ft in ipairs(fts) do
      table.insert(fileTypes, ft)
    end
  end 

  -- start highlighting when we open one of the file types
  vim.api.nvim_create_autocmd('FileType', {
    pattern = fileTypes,
    callback = function()
      vim.treesitter.start()
    end
  })

end


return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = config,
}
