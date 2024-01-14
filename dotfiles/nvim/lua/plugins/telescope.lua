return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "nvim-telescope/telescope-fzf-native.nvim",  -- faster sorting
      "BurntSushi/ripgrep",  -- faster grep
      "sharkdp/fd",  -- faster find
    },
    config = function()
      local opts = {noremap = true, silent = true}

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
      vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
    end,
}

