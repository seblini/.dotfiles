return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	config = function()
		require("oil").setup({
			columns = {
				-- "permissions",
				-- "size",
			},
			view_options = {
				show_hidden = true,
			},
		})
	end,
	lazy = false,
}
