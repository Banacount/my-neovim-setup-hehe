-- General variables
local nvimConfigPath = "/home/excalibur/.config/nvim/lua/config/"

-- Returns the the insides of the html-template txt file
local function getHtmlTemplate()
    local file = io.open(nvimConfigPath .. "html-template.txt", 'r')
    local result = ""

    if file then
        result = file:read('*a')
        file:close()
    else
        print("Can't seem to open or locate the file!")
    end

    return result
end

-- My vim commands
vim.api.nvim_create_user_command('HtmlStuff', function(opts)
    if opts.fargs[1] == "html-template" then
        vim.fn.setreg('', getHtmlTemplate(), '^V')
        print("The html template code has been yanked to the main registry.")
    end
end, {
    nargs = 1,
    complete = function()
        return { "html-template" }
    end
})
