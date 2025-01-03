local set = vim.opt

-- Misc
set.backspace = { "indent", "eol", "start" }  -- Enable backspace
set.cmdheight = 2
set.signcolumn = "yes"  -- Always show sign column
set.number = true
set.statusline = set.statusline:get() .. "%F"  -- Show file path
set.clipboard = "unnamedplus"  -- Yank now also yanks to system clipboard

-- Tab Options
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2  -- Number of spaces a tab counts when editing
set.expandtab = true

-- Folding options
set.foldmethod = "indent"
set.foldenable = false
