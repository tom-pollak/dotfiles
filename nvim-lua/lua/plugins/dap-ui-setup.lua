require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    expand_lines = vim.fn.has("nvim-0.7"),
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "stacks",
                "watches",
            },
            size = 40, -- 40 columns
            position = "left",
        },
        --[[ { ]]
        --[[     elements = { ]]
        --[[         { id = "repl", size = 0.25 }, ]]
        --[[         "repl", ]]
        --[[     }, ]]
        --[[     size = 40, ]]
        --[[     position = "right", ]]
        --[[ }, ]]
        {
            elements = {
                { id = "console", size = 0.25 },
                "console",
            },
            size = 15,
            position = "bottom",
        },
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
    }
})