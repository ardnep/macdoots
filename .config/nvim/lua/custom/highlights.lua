-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
	Comment = {
		italic = true,
	},
}

local navic_default_color = {
	fg = "grey",
}

---@type HLTable
M.add = {
	NvimTreeOpenedFolderName = { fg = "green", bold = true },
	TreesitterContext = { bg = "lightbg" },
	TreesitterContextSeparator = { fg = "grey" },
	-- In nvim 0.10, the default colorschemes were changed
	-- which resulted in the winbar having a black background.
	-- If my sanity is still intact, this is the commit
	-- responsible:
	-- https://github.com/neovim/neovim/commit/0c850add3ecedec5b7dea62f0dd152f3421b66fc
	-- The following is a temp fix which makes the winbar transparent
	WinBar = {},
	WinBarNC = {},

	-- navic stuff
	NavicIconsFile = navic_default_color,
	NavicIconsModule = navic_default_color,
	NavicIconsNamespace = navic_default_color,
	NavicIconsPackage = navic_default_color,
	NavicIconsClass = { fg = "purple" },
	NavicIconsMethod = { fg = "blue" },
	NavicIconsProperty = navic_default_color,
	NavicIconsField = navic_default_color,
	NavicIconsConstructor = navic_default_color,
	NavicIconsEnum = navic_default_color,
	NavicIconsInterface = { fg = "purple" },
	NavicIconsFunction = { fg = "blue" },
	NavicIconsVariable = { fg = "yellow" },
	NavicIconsConstant = { fg = "red" },
	NavicIconsString = navic_default_color,
	NavicIconsNumber = navic_default_color,
	NavicIconsBoolean = navic_default_color,
	NavicIconsArray = navic_default_color,
	NavicIconsObject = { fg = "purple" },
	NavicIconsKey = navic_default_color,
	NavicIconsNull = navic_default_color,
	NavicIconsEnumMember = navic_default_color,
	NavicIconsStruct = { fg = "purple" },
	NavicIconsEvent = navic_default_color,
	NavicIconsOperator = navic_default_color,
	NavicIconsTypeParameter = navic_default_color,
	NavicText = navic_default_color,
	NavicSeparator = navic_default_color,
}

return M
