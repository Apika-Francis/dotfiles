function ColorMyPencils(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)
end

return {
	-- Theme: Brightburn
	{
		"erikbackman/brightburn.vim",
	},
	-- Theme: Tokyo Night
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "night",
				terminal_colors = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "dark",
					floats = "dark",
				},
			})
		end,
	},
	-- Theme: Gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				undercurl = true,
				underline = false,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				inverse = true,
				contrast = "",
				dim_inactive = false,
			})
		end,
	},
	-- Theme: Rose Pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					italic = false,
				},
			})
			ColorMyPencils()
		end,
	},
}
