local active = "supermaven"

local llm = {
	supermaven = {
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<C-o>",
				},
			})
		end,
	},

	copilot = {
		"github/copilot.vim",
		config = function()
			vim.keymap.set("i", "<C-O>", 'copilot#Accept("\\<CR>")', {
				expr = true,
				replace_keycodes = false,
			})
			vim.g.copilot_no_tab_map = true
		end,
	},
}

return llm[active]
