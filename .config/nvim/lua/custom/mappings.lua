---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },

		--  format with conform
		["<leader>fm"] = {
			function()
				require("conform").format()
			end,
			"formatting",
		},

		["<leader>ld"] = { "<cmd>Telescope diagnostics<CR>", "Show all diagnostics" },
		["<leader>gg"] = { "<cmd>LazyGitCurrentFile<CR>", "Open LazyGit" },
	},

	v = {
		[">"] = { ">gv", "indent" },
	},
}

-- more keybinds!

return M
