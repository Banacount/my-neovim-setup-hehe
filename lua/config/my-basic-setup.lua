
-- Functions
local function listAllMarkedFiles()
    local marked_files = vim.api.nvim_eval('netrw#Expose("netrwmarkfilelist")')
    local allMarksString = ""

    print(marked_files);
    if type(marked_files) == "table" and not vim.tbl_isempty(marked_files) then
        for i, file in ipairs(marked_files) do
            allMarksString = allMarksString .. file .. "\n"
        end

        print(allMarksString)
    else
        print("No files are marked!")
    end
end

local function copyToClipboard()
    vim.cmd('normal! "+y')
    print("Yanked to the system clipboard.")
end

-- Yank shitters
vim.keymap.set("v", "<leader>y", function() copyToClipboard() end, { desc = "Copy selection to system clipboard" })

-- General stuffs
vim.keymap.set("n", "<leader>f", ':Ex<CR>', { desc = "Open netrw using leader" })
vim.keymap.set("n", "<leader>ml", listAllMarkedFiles, { desc = "List all marked files" })
vim.keymap.set("n", "<leader>b", ':Telescope buffers<CR>', { desc = "Go to buffer list ong" })
vim.keymap.set("n", "<leader>lg", ':Telescope live_grep<CR>', { desc = "Open telescope with live grep" })
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

-- My extra vim commands
vim.api.nvim_create_user_command('MarkedFiles', function()
        listAllMarkedFiles()
    end
, {})

-- Harpoon
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<M-a>", function() harpoon:list():add() print("Added to harpoon list") end)
vim.keymap.set("n", "<M-q>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Quick Navigation
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<M-Left>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<M-Right>", function() harpoon:list():next() end)

-- Tabs setup
for i = 1, 9 do
  vim.keymap.set("n", string.format("<M-%d>", i), function()
    vim.cmd.normal(i.."gt")
  end, { desc = string.format("Tab slot %d", i) })
end
