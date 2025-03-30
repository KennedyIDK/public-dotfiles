return {
  'epwalsh/obsidian.nvim',
  enable = false,
  version = '*',
  lazy = true,
  event = {
    'BufReadPre /home/iain/notes/*.md',
    'BufNewFile /home/iain/notes/*.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'notes',
        path = '/home/iain/notes',
      },
    },
  },
}
