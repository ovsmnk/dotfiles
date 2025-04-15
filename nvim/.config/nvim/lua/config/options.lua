local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = "\\"

opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})
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
opt.wrap = false
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.breakindent = true
	end,
})

-- clipboard
opt.clipboard = "unnamedplus"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- show whitespaces
opt.list = true
opt.listchars = { tab = "» ", space = "·", nbsp = "␣" }

-- folding
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldenable = true

-- other
opt.mouse = "a"
opt.showmode = false
opt.termguicolors = true
