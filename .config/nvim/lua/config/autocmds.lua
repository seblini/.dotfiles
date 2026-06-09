vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "html" },
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.expandtab = true
	end,
})

local function apply_clang_format()
	local path = vim.fn.findfile(".clang-format", ".;") --[[@as string]]
	if path == "" then
		return
	end

	local f = io.open(path, "r")
	if not f then
		return
	end
	local content = f:read("*a")
	f:close()

	local indent = content:match("\n%s*IndentWidth:%s*(%d+)")
	local tab = content:match("\n%s*TabWidth:%s*(%d+)")
	local usetab = content:match("\n%s*UseTab:%s*(%w+)")

	if indent then
		vim.bo.shiftwidth = tonumber(indent)
	end
	if tab then
		vim.bo.tabstop = tonumber(tab)
	end
	if usetab then
		vim.bo.expandtab = (usetab == "Never")
	end

	vim.bo.cindent = true
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = apply_clang_format,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "tex", "c", "cpp", "lua", "python", "rust", "go", "bash", "markdown" },
	callback = function()
		vim.treesitter.start()
	end,
})

local view_group = vim.api.nvim_create_augroup("auto_view", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
	desc = "Save view with mkview for real files",
	group = view_group,
	callback = function(args)
		if vim.b[args.buf].view_activated then
			vim.cmd.mkview({ mods = { emsg_silent = true } })
		end
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Try to load file view if available and enable view saving for real files",
	group = view_group,
	callback = function(args)
		if not vim.b[args.buf].view_activated then
			local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
			local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
			local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
			if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
				vim.b[args.buf].view_activated = true
				vim.cmd.loadview({ mods = { emsg_silent = true } })
			end
		end
	end,
})
