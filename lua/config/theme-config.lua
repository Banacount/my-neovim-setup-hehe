
local catpu = require("catppuccin")
local lualine = require("lualine")


-- Functions
-- Time for displaying my missery
local function getTime()
    local time = os.date("*t")
    local hour = (time.hour > 12) and (time.hour - 12) or time.hour
    local minute = (time.min < 10) and ("0"..time.min) or time.min
    local mm = (time.hour >= 12) and "PM" or "AM"

    if (hour == 0) then hour = 12 end
    return hour .. ":" .. minute .. " " ..mm
end


-- Catppuccin setup
catpu.setup({
    flavour = "frappe",
    show_end_of_buffer = true,
    -- Transparent type shi
    transparent_background = true,
    float = { transparent = true }
})

-- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"


--  
-- Lualine setup
lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'powerline_dark',
        --component_separators = { left = '', right = ''},
        --section_separators = { left = '', right = ''},
        component_separators = '',
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        }
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
        refresh_time = 16, -- ~60fps
    },
    events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
    },
    -- 'encoding', 'progress'
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {{'filename', path = 1}},
        lualine_x = { getTime },
        lualine_y = {'fileformat', 'filetype'},
        lualine_z = {'location'}
    },
    tabline = {
        lualine_a = {{
            'tabs', max_length = vim.o.columns, mode = 2, path = 0,
            use_mode_colors = false,
            tabs_color = {
                active = {fg = '#1f2411', bg = '#9bcf00', gui = 'bold'},
                inactive = {fg = '#3d3d3d', bg = '#969696'}
            }
        }}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{'filename', color = {fg = '#999999'}}},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_winbar = {},
    extensions = {}
})
