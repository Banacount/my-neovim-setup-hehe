
-- Functions
local function copyToClipboard()
    vim.cmd('normal! "+y')
    print("Yanked to the system clipboard.")
end

-- Yank shitters
vim.keymap.set("v", "<leader>y", function() copyToClipboard() end, { desc = "Copy selection to system clipboard" })

-- General stuffs
vim.keymap.set("n", "<leader>f", ':Oil<CR>', { desc = "Open oil.nvim using leader" })
