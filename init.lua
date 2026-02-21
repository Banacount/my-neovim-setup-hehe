-- Force the damn mapleader
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[ ]]

require("config.lazy")
require("lazy").setup("plugins")

require("config.html-stuff")
require("config.my-basic-setup")
require("config.lsp-config")
require("config.theme-config")

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
local hbac = require("hbac")
hbac.setup({
    autoclose     = true, -- set autoclose to false if you want to close manually
    threshold     = 10, -- hbac will start closing unedited buffers once that number is reached
    close_command = function(bufnr)
    vim.api.nvim_buf_delete(bufnr, {})
    end,
    close_buffers_with_windows = false, -- hbac will close buffers with associated windows if this option is `true`
})

-- Neovide setup
if vim.g.neovide then
    vim.g.neovide_fullscreen = true
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_cursor_smooth_blink = true
    vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20," .. "n-v-c-sm:blinkwait1000-blinkon500-blinkoff500"
    vim.cmd([[highlight Cursor guibg=#faf200 guifg=black]])
    vim.cmd([[highlight lCursor guibg=#faf200 guifg=black]])
    vim.cmd("set guicursor=n-v-c:block-Cursor,i-ci-ve:ver25-Cursor")
    vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    vim.keymap.set({ "n" , "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
    -- Neovim backgrounds
    vim.cmd([[highlight Normal guibg=#121212]])
    vim.cmd([[highlight StatusLine guibg=#0a0a12]])
    vim.cmd([[highlight TabLineFill guibg=#131324]])
end
