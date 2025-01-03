# Nvim
The configuration consists of the following modules:
```
.config/nvim/
├── init.lua                  # Main entry point
├── lua/                     
|   ├── config/               # Config that is not plugins
│       ├── settings.lua      # Basic vim settings
│       ├── keymaps.lua       # Key mappings
│       ├── lazy.lua          # lazy.nvim initialization
|   ── plugins/               # config for plugins
│       └── ...                   
```
Note that `lazy.nvim` automatically concatenates output of all `lua` files in `~./config/nvim/lua/plugins/*.lua` and merges them into the main spec table. The main spec table is the first argument in the setup call:
 ```lua
 require("lazy").setup(plugins, opts)
 ```
