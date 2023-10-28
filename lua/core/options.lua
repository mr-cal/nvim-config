-- style
vim.opt.colorcolumn = "88"
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.wrap = true

-- autosave
vim.g.auto_save = 1

-- clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Set python interpreter
vim.g.logging_level = "trace"
vim.g.python3_host_prog = vim.fn.exepath("/home/developer/.venv/nvim/bin/python3")

-- colorscheme / theme
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_better_performance = 1
vim.cmd.colorscheme("gruvbox-material")
