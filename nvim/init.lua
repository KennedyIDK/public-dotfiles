-- ████ ██    ██ ████ ████████     ██       ██     ██    ███
--  ██  ███   ██  ██     ██        ██       ██     ██   ██ ██
--  ██  ████  ██  ██     ██        ██       ██     ██  ██   ██
--  ██  ██ ██ ██  ██     ██        ██       ██     ██ ██     ██
--  ██  ██  ████  ██     ██        ██       ██     ██ █████████
--  ██  ██   ███  ██     ██    ███ ██       ██     ██ ██     ██
-- ████ ██    ██ ████    ██    ███ ████████  ███████  ██     ██

-- =============================================================================
-- Core Editor Settings
-- =============================================================================

-- Nerd Font Configuration
vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed

-- Editor Options
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Number of spaces for each indentation
vim.opt.tabstop = 2 -- Number of spaces a tab counts for
vim.opt.smartindent = true -- Smart indentation
vim.opt.wrap = false -- Disable line wrapping
vim.opt.hlsearch = true -- Highlight search results
vim.opt.incsearch = true -- Incremental search
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.mouse = 'a' -- Enable mouse support
vim.opt.showmode = false -- Don't show the mode
vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = true -- Save undo history
vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time
vim.opt.inccommand = 'split' -- Preview substitutions live
vim.opt.conceallevel = 2 -- Conceal text

-- =============================================================================
-- Clipboard & Search Settings
-- =============================================================================

-- Use the system clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Case-insensitive searching UNLESS \C or capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- =============================================================================
-- Window & Split Management
-- =============================================================================

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- =============================================================================
-- Visual Settings
-- =============================================================================

-- Set how neovim will display certain whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- =============================================================================
-- Keymaps
-- =============================================================================

-- Set the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Mode Switching
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window Resizing
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Line Movement
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- Indentation
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Tab Management
vim.keymap.set('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
vim.keymap.set('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
vim.keymap.set('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })

-- Commenting
vim.keymap.set('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
vim.keymap.set('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })

-- Search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- =============================================================================
-- Autocommands
-- =============================================================================

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- =============================================================================
-- Plugin Management
-- =============================================================================

-- Initialize lazy.nvim
require 'lazy-bootstrap'
require('lazy').setup 'plugins'

-- =============================================================================
-- Theme Configuration
-- =============================================================================

-- Set colourscheme
vim.cmd [[colorscheme moonfly]]
-- vim.cmd [[colorscheme nightfox]]
-- vim.cmd [[colorscheme flexoki-light]]
-- vim.cmd [[colorscheme flexoki-dark]]

-- vim: ts=2 sts=2 sw=2 et
