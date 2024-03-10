---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

local symbol_context = function()
	if require("nvim-navic").is_available() then
		return require("nvim-navic").get_location()
	end
end

M.ui = {
	theme = "catppuccin",
	theme_toggle = { "catppuccin", "one_light" },

	hl_override = highlights.override,
	hl_add = highlights.add,

	transparency = true,

	nvdash = {
		load_on_startup = true,
	},
	statusline = {
		overriden_modules = function(modules)
			table.insert(modules, 6, symbol_context())
		end,
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
