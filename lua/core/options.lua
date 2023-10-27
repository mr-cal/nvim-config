local opts = {
	shiftwidth = 4,
	tabstop = 4,
	expandtab = true,
	wrap = true,
	termguicolors = true,
	number = true,
	relativenumber = true,
}

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

-- colorscheme / theme
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_better_performance = 1
vim.cmd.colorscheme("gruvbox-material")
