return {
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")
		local null_ls_utils = require("null-ls.utils")
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				formatting.prettier, -- js/ts formatter
				formatting.stylua, -- lua formatter
				formatting.black, -- python formatter
				diagnostics.mypy, -- python linter
				diagnostics.ruff, -- python linter
				diagnostics.eslint_d.with({ -- js/ts linter
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
					end,
				}),
			},
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
