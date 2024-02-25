require("lint").linters_by_ft = {
	python = { "mypy" },
	sh = { "shellcheck" },
	zsh = { "shellcheck" },
	bash = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
