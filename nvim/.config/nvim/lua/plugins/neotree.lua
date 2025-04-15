return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	---@module "neo-tree"
	---@type neotree.Config?
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			window = {
				width = 30,
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				follow_current_file = {
					enabled = true,
				},
			},
		})
		vim.keymap.set("n", "<leader>e", "<Cmd>Neotree reveal<CR>", { desc = "Open Neotree" })
	end,
}
