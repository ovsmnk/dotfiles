return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/personal/vault/*.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/personal/vault/*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "vault",
					path = "~/personal/vault",
				},
			},
			notes_subdir = "./",
			mappings = {
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				["<leader>ch"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				},
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
				},
			},
			new_notes_location = "notes_subdir",

			---@param title string|?
			---@return string
			note_id_func = function(title)
				return title
			end,

			---@param spec { id: string, dir: obsidian.Path, title: string|? }
			---@return string|obsidian.Path The full path to the new note.
			note_path_func = function(spec)
				local path = spec.dir / tostring(spec.id)
				return path:with_suffix(".md")
			end,

			wiki_link_func = "use_alias_only",
			preferred_link_style = "wiki",
			disable_frontmatter = true,

			templates = {
				folder = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
			},

			picker = {
				name = "telescope.nvim",
				note_mappings = {
					new = "<C-x>",
				},
			},

			ui = {
				enable = true,
			},

			attachments = {
				img_folder = "assets/screenshots",

				---@param client obsidian.Client
				---@param path obsidian.Path
				---@return string
				img_text_func = function(client, path)
					path = client:vault_relative_path(path) or path
					return string.format("![[%s]]", path.name)
				end,
			},
		})

		vim.keymap.set("n", "<leader>fo", "<CMD>ObsidianSearch<CR>", { desc = "Obsidian search or create file" })
		vim.keymap.set("n", "<leader>ft", "<CMD>ObsidianTemplate<CR>", { desc = "Obsidian insert template" })

		vim.keymap.set("n", "<leader>i", function()
			local name = "screenshot-" .. os.date("%Y%m%d%H%M%S")
			vim.cmd("ObsidianPasteImg " .. name)
		end, { desc = "Obsidian paste image" })
	end,
}
