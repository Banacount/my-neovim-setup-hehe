-- Force the damn mapleader
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[ ]]
require("config.my-basic-setup")

require("config.lazy")
require("config.html-stuff")
require("lazy").setup("plugins")

-- Tab setting
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Colorscheme
vim.cmd("colorscheme lunaperche")

-- General settings
vim.opt.number = true
vim.opt.relativenumber = true

-- Plugin setups
