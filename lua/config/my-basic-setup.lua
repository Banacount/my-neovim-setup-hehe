
-- Functions
local function copyToClipboard()
    vim.cmd('normal! "+y')
    print("Yanked to the system clipboard.")
end

-- Yank shitters
vim.keymap.set("v", "<leader>y", function() copyToClipboard() end, { desc = "Copy selection to system clipboard" })

-- General stuffs
vim.keymap.set("n", "<leader>f", ':Ex<CR>', { desc = "Open netrw using leader" })
vim.keymap.set("n", "<leader>j", vim.lsp.buf.hover, { desc = "Trigger lsp for hovering definition" })
vim.keymap.set("n", "<leader>b", ':Telescope buffers<CR>', { desc = "Go to buffer list ong" })
vim.keymap.set("n", "<M-j>", ':cnext<CR>', { desc = "Go next in quickfix list" })
vim.keymap.set("n", "<M-k>", ':cprev<CR>', { desc = "Go prev in quickfix list" })

-- Debugging stuffs
-- Diagnose command for syntax errors
vim.api.nvim_create_user_command('Diagnose', function(opts)
    if opts.fargs[1] == "list" then
        vim.diagnostic.setqflist()
        print("Opening diagnostic list!")
    else
        vim.diagnostic.open_float()
        print("Diagnostic float opened!")
    end
end, {
    nargs = '*',
    complete = function()
        return { "list" }
    end
})
