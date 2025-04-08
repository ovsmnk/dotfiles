local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = "\\"

opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- line
opt.cursorline = true
opt.scrolloff = 10
opt.signcolumn = "yes"

-- clipboard
opt.clipboard = "unnamedplus"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- show whitespaces
opt.list = true
opt.listchars = { tab = "» ", space = "·", nbsp = "␣" }

-- other
opt.mouse = "a"
opt.showmode = false
opt.termguicolors = true

opt.wrap = false
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.breakindent = true
	end,
})
