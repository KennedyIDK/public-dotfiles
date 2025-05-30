return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<C-l>'] = false,
          ['<C-k>'] = false,
          ['<C-j>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = { show_hidden = true },
      }

      -- Open parent directory in current window
      local oil = require 'oil'
      vim.keymap.set('n', '-', oil.toggle_float, { desc = 'Open parent directory' })
    end,
  },
}
