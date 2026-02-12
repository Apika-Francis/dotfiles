return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "master",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- =============================================================================
				--  LANGUAGES TO INSTALL
				-- =============================================================================
				ensure_installed = {
					-- Core Neovim
					"vimdoc",
					"lua",
					"vim",

					-- Computer Science / Data Science
					"c",
					"cpp",
					"python",
					"java",
					"rust",

					-- System / Tools
					"bash",
					"markdown",
					"markdown_inline",
				},

				-- Install parsers synchronously (false = faster startup)
				sync_install = false,

				-- Automatically install missing parsers when entering a file
				auto_install = true,

				-- =============================================================================
				--  MODULES
				-- =============================================================================
				indent = {
					enable = true, -- Better indentation based on syntax tree
				},

				highlight = {
					enable = true, -- Enable syntax highlighting

					-- Disable on huge files to prevent lag
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,

					additional_vim_regex_highlighting = { "markdown" },
				},
			})
		end,
	},

	-- =============================================================================
	--  TREESITTER CONTEXT
	-- =============================================================================
	{
		"nvim-treesitter/nvim-treesitter-context",
		after = "nvim-treesitter",
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = 3, -- Limit the context to 3 lines max
				trim_scope = "outer",
			})
		end,
	},
}
