-- Handle plugins with lazy.nvim
require("core.lazy")

-- General Neovim keymaps
require("core.keymaps")

-- Other options
require("core.options")

-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- 
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)
-- 
-- require("lazy").setup(plugins, opts)


-- foreground option can be material, mix, or original
-- vim.g.gruvbox_material_foreground = "material"
--background option can be hard, medium, soft
-- vim.g.gruvbox_material_background = "soft"
-- vim.g.gruvbox_material_enable_italic = 1
-- vim.g.gruvbox_material_enable_bold = 1
-- vim.g.gruvbox_material_better_performance = 1
-- 
-- vim.cmd([[colorscheme gruvbox-material]])
