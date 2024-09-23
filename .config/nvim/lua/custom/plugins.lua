local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = overrides.gitsigns,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
		opts = overrides.cmp,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"stevearc/conform.nvim",
		--  for users those who want auto-save conform + lazyloading!
		event = "BufWritePre",
		config = function()
			require("custom.configs.conform")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			require("custom.configs.lint")
		end,
	},

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = overrides.copilot,
	},

	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		cmd = { "LazyGit", "LazyGitCurrentFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		cmd = {
			"CopilotChatToggle",
			"CoplitChatReset",
			"CopilotChatFix",
			"CopilotChatCommitStaged",
			"CopilotChatFixDiagnostic",
		},
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = true,
		},
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		event = "VeryLazy",
		opts = {
			lsp = {
				auto_attach = true,
			},
			highlight = true,
			click = true,
		},
	},
	{
		"kylechui/nvim-surround",
		version = "v3", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}

return plugins
