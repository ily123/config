-- Always call this file something other than "lazy.lua",
-- because "lazy" is also the name of the package manager
-- so when you do require("lazy") you want to require the package manager,
-- not this file

-- install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- put lazy into the runtimepath for nvim
vim.opt.runtimepath:prepend(lazypath)

-- Using Lazy package manager, load third party plugins
-- Any lua file in ~/.config/nvim/lua/plugins/*.lua will be
-- automatically merged in the main plugin spec
require("lazy").setup({
  spec = {
    import = "plugins"
  },
  checker = { enabled = true },
})
