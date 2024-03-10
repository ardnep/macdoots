local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "eslint" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- disable semantic tokens
lspconfig.tsserver.setup({
	on_init = function(client, _)
		if
			not require("custom.chadrc").ui.lsp_semantic_tokens
			and client.supports_method("textDocument/semanticTokens")
		then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})
