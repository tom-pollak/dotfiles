-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

local github_dark_colors = {
    bg        = '#0d1117',
    bg2       = '#090c10',
    fg_dark   = '#4d5566',
    fg_gutter = '#c5c5c5',
    fg_light  = '#b3b1ad',

    orange = '#FF8800',
    violet = '#a9a1e1',

    black = '#484f58',
    bright_black = '#6e7681',
    white = '#b1bac4',
    bright_white = '#f0f6fc',
    red = '#ff7b72',
    bright_red = '#ffa198',
    green = '#3fb950',
    bright_green = '#56d364',
    yellow = '#d29922',
    bright_yellow = '#e3b341',
    blue = '#58a6ff',
    bright_blue = '#79c0ff',
    magenta = '#bc8cff',
    bright_magenta = '#d2a8ff',
    cyan = '#39c5cf',
    bright_cyan = '#56d4dd',

    git        = {
        add = '#56d364',
        change = '#ac8934',
        delete = '#f85149',
        conflict = '#e3b341',
        ignore = '#484f58',
        -- renamed = '#73c991',
    },
    git_signs  = { add = '#196c2e', change = '#9e6a03', delete = '#b62324' },
    lsp        = { ref_txt = '#164449' },
    diagnostic = {
        error   = '#f85149',
        warning = '#f0883e',
        info    = '#75beff',
        hint    = '#eeeeb3',
    }
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 100
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = { c = { fg = github_dark_colors.fg, bg = github_dark_colors.bg } },
            inactive = { c = { fg = github_dark_colors.fg, bg = github_dark_colors.bg } },
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

local mode_color = function()
    -- auto change color according to neovims mode
    local mode_color = {
        n = github_dark_colors.blue,
        i = github_dark_colors.green,
        v = github_dark_colors.red,
        [''] = github_dark_colors.blue,
        V = github_dark_colors.red,
        c = github_dark_colors.magenta,
        no = github_dark_colors.red,
        s = github_dark_colors.orange,
        S = github_dark_colors.orange,
        [''] = github_dark_colors.orange,
        ic = github_dark_colors.yellow,
        R = github_dark_colors.violet,
        Rv = github_dark_colors.violet,
        cv = github_dark_colors.red,
        ce = github_dark_colors.red,
        r = github_dark_colors.cyan,
        rm = github_dark_colors.cyan,
        ['r?'] = github_dark_colors.cyan,
        ['!'] = github_dark_colors.red,
        t = github_dark_colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
end

ins_left {
    function()
        return '▊'
    end,
    color = mode_color,
    padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = github_dark_colors.magenta, gui = 'bold' },
}

ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
        color_error = { fg = github_dark_colors.diagnostic.error },
        color_warn = { fg = github_dark_colors.diagnostic.warning },
        color_info = { fg = github_dark_colors.diagnostic.info },
    },
}

ins_left {
    -- Lsp server name .
    function()
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return ''
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return ''
            end
        end
        return ''
    end,
    -- icon = ' ',
    color = { fg = '#ffffff', gui = 'bold' },
}

ins_right {
    function()
        local navic = require "nvim-navic"
        if navic.is_available() then
            return navic.get_location()
        end
        return ""
    end,
    cond = conditions.hide_in_width,
}



ins_right {
    'branch',
    icon = '',
    color = { fg = github_dark_colors.violet, gui = 'bold' },
    conditions = conditions.check_git_workspace
}

ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '柳', removed = ' ' },
    diff_color = {
        added = { fg = github_dark_colors.git.add },
        modified = { fg = github_dark_colors.git.mod },
        removed = { fg = github_dark_colors.git.delete },
    },
    conditions = conditions.check_git_workspace
    -- cond = conditions.hide_in_width,
}
ins_right {
    function()
        return '▊'
    end,
    color = mode_color,
    padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
