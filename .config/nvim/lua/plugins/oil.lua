return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	config = function()
		require("oil").setup({
			columns = {
				"permissions",
			},
			view_options = {
				show_hidden = true,
			},
		})
	end,
	lazy = false,
}
