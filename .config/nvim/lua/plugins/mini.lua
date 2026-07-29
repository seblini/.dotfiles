return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
		-- local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment" })
		local function_hl = vim.api.nvim_get_hl(0, { name = "@function", link = true })
		-- local keyword_hl = vim.api.nvim_get_hl(0, { name = "@keyword", link = true })
		-- local variable_hl = vim.api.nvim_get_hl(0, { name = "@variable", link = true })
		local property_hl = vim.api.nvim_get_hl(0, { name = "@property", link = true })
		local warn_hl = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn", link = true })
		-- local info_hl = vim.api.nvim_get_hl(0, { name = "DiagnosticInfo", link = true })
		local hint_hl = vim.api.nvim_get_hl(0, { name = "DiagnosticHint", link = true })
		local error_hl = vim.api.nvim_get_hl(0, { name = "DiagnosticError", link = true })

		local status_bg = "NONE"
		-- local status_bg = "#222222"

		vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", {
			fg = function_hl.fg,
			bg = status_bg,
			bold = true,
		})
		vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", {
			fg = property_hl.fg,
			bg = status_bg,
			bold = true,
		})
		vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", {
			fg = hint_hl.fg,
			bg = status_bg,
			bold = true,
		})
		vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", {
			fg = error_hl.fg,
			bg = status_bg,
			bold = true,
		})
		vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", {
			fg = warn_hl.fg,
			bg = status_bg,
			bold = true,
		})

		vim.api.nvim_set_hl(0, "MiniStatuslineFilename", {
			fg = "#ffffff",
			bg = status_bg,
		})
		vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", {
			fg = "#ffffff",
			bg = status_bg,
		})
		vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", {
			fg = "#ffffff",
			bg = status_bg,
		})
		vim.api.nvim_set_hl(0, "MiniStatuslineInactive", {
			fg = "#ffffff",
			bg = status_bg,
		})
	end,
}
