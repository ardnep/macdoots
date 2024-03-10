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
		["<leader>ccw"] = { "<cmd>CopilotChatToggle<CR>", "Toggle Copilot Chat Window" },
	},

	v = {
		[">"] = { ">gv", "indent" },
		["<leader>cc"] = { ":CopilotChat ", "Chat with Copilot" },
	},
}

-- more keybinds!

return M
