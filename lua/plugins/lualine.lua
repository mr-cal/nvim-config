-- Fancier statusline
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine_theme = "gruvbox-material"
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = lualine_theme,
				component_separators = "|",
				section_separators = "",
			},
		})
	end,
}
