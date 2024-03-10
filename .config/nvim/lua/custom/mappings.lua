---@type MappingsTable
local M = {}

M.general = {
	n = {
		--  format with conform
		["<leader>fm"] = {
			function()
				require("conform").format()
			end,
			"formatting",
		},

		["<leader>ld"] = { "<cmd>Telescope diagnostics<CR>", "Show all diagnostics" },
		["<leader>gg"] = { "<cmd>LazyGitCurrentFile<CR>", "Open LazyGit" },
		["<leader>fs"] = {
			function()
				require("telescope.builtin").lsp_document_symbols({
					symbols = { "class", "method", "function", "interface", "module" },
				})
			end,
			"Find symbols in document",
		},
	},

	v = {
		[">"] = { ">gv", "indent" },
	},
}

-- more keybinds!

return M
