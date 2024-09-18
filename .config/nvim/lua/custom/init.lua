-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.opt.relativenumber = true

local enable_providers = {
	"python3_provider",
	-- and so on
}

for _, plugin in pairs(enable_providers) do
	vim.g["loaded_" .. plugin] = nil
	vim.cmd("runtime " .. plugin)
end

vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- Following nvim 0.10, the default colorschemes were changed
-- which resulted in the winbar having a black background
-- if my sanity is still intact, this is the commit
-- that is responsible for this change:
-- https://github.com/neovim/neovim/commit/0c850add3ecedec5b7dea62f0dd152f3421b66fc
-- This reverts the winbar to the previous state
vim.api.nvim_set_hl(0, "WinBar", {})
vim.api.nvim_set_hl(0, "WinBarNC", {})
