return {
	{
		"tpope/vim-fugitive",
		event = "BufWinEnter",
		config = function()
			vim.keymap.set("n", "<leader>gs", function()
				vim.cmd.Git("status")
			end, { desc = "[G]it [S]tatus" })
			vim.keymap.set("n", "<leader>ga", ":G add ", { desc = "[G]it [A]dd" })
		end,
	},
	-- NOTE: Plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	--
	-- Use `opts = {}` to force a plugin to be loaded.
	--

	-- Here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
	--    require('gitsigns').setup({ ... })
	--
	-- See `:help gitsigns` to understand what the configuration keys do
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}
