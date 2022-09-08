--- This module will load a random colorscheme on nvim startup process.

local utils = require('utils')

local M = {}

M.gruvbox8 = function()
  -- Italic options should be put before colorscheme setting,
  -- see https://github.com/morhetz/gruvbox/wiki/Terminal-specific#1-italics-is-disabled
  vim.g.gruvbox_italics = 1
  vim.g.gruvbox_italicize_strings = 1
  vim.g.gruvbox_filetype_hi_groups = 1
  vim.g.gruvbox_plugin_hi_groups = 1

  vim.cmd [[colorscheme gruvbox8_hard]]
end

local colorscheme = "gruvbox8"

if not vim.tbl_contains(vim.tbl_keys(M), colorscheme) then
  local msg = "Invalid colorscheme: " .. colorscheme
  vim.notify(msg, vim.log.levels.ERROR, { title = 'nvim-config' })

  return
end

-- Load the colorscheme using the directory name, because all the colorschemes are declared as opt plugins, so the colorscheme isn't loaded yet.
local status = utils.add_pack("vim-gruvbox8")

if not status then
  local msg = string.format("Colorscheme %s is not installed. Run PackerSync to install.", colorscheme)
  vim.notify(msg, vim.log.levels.ERROR, { title = 'nvim-config' })

  return
end

-- Load the colorscheme and its settings
M[colorscheme]()

if vim.g.logging_level == 'debug' then
  local msg = "Colorscheme: " .. colorscheme

  vim.notify(msg, vim.log.levels.DEBUG, { title = 'nvim-config' })
end
