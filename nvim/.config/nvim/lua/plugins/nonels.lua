return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua.with({
					filetypes = { "lua" },
				}),
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "javascript", "css" },
				}),
				null_ls.builtins.formatting.black.with({
					filetypes = { "python" },
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format document" })
	end,
}
