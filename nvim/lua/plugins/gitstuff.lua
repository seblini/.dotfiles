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
	{
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
