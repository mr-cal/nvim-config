--- This module will load a random colorscheme on nvim startup process.

-- foreground option can be material, mix, or original
vim.g.gruvbox_material_foreground = "material"
--background option can be hard, medium, soft
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_better_performance = 1

vim.cmd([[colorscheme gruvbox-material]])
