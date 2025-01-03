--------------------------
-- NeoVim/VSCode Shared --
--------------------------

local set = vim.opt
local keymap = vim.keymap.set
local wo = vim.wo
local g = vim.g

-- Basic -- 
g.mapleader = " "
set.clipboard = "unnamedplus"
set.smartcase = true
set.ignorecase = true
set.expandtab = true
wo.relativenumber = true
wo.number = true

g.surround_no_insert_mappings = 1 -- vim-surround

-- Keymaps --
keymap("n", "<Esc>", "<CMD>nohl<CR><Esc>", {silent = true})
keymap('n', '<leader>w', "<CMD>:update<CR>", {silent = true})

keymap({"n", "v"}, "H", "^", {silent = true})
keymap({"n", "v"}, "L", "$", {silent = true})

keymap('v', '<', '< gv', {silent = true})
keymap('v', '>', '> gv', {silent = true})

keymap("n", "U", "<CMD>earlier<CR>", {silent = true})
keymap("n", "R", "<CMD>later<CR>", {silent = true})

-- Remap delete --
keymap({"n", "v"}, "d", '"_d')
keymap({"n", "v"}, "s", "d")
keymap({"n", "v"}, "c", '"_c')
keymap("v", "p", '"_dP')

keymap("n", "D", '"_D')
keymap("n", "S", "D")
keymap("n", "C", '"_C')

keymap("n", "x", '"_x')
keymap("n", "ss", "dd")

-- Naviate on line
keymap('i', '<C-f>', '<Right>')
keymap('i', '<C-d>', '<Left>')
keymap('i', '<C-g>', '<End>', { noremap = true })
keymap('i', '<C-s>', '<C-o>^')

-- Forward Delete
keymap('i', '<C-h>', '<Delete>')

-- Highlights --
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=100})
  augroup END
]]

-- Blocks --
vim.api.nvim_create_user_command('Blocks', function(opts)
  local count = tonumber(opts.args) or 80
  local blocks = string.rep('█', count)
  vim.api.nvim_put({blocks}, 'c', true, true)
end, {nargs = '?'})

vim.api.nvim_create_user_command('BlocksT', function(opts)
    local args = vim.split(opts.args, ' ', { trimempty = true })
    local text = ''
    local line_length = 80

    -- Combine args into text until we hit a number (line_length) or run out of args
    while #args > 0 do
    local arg = table.remove(args, 1)
    if tonumber(arg) then
        line_length = tonumber(arg)
        break
    else
        if text ~= '' then text = text .. ' ' end
        text = text .. arg
    end
    end

    text = text:gsub('^"(.*)"$', '%1'):gsub("^'(.*)'$", '%1')

    local text_length = vim.fn.strdisplaywidth(text)
    local total_padding = 4  -- Two spaces on each side
    local blocks_needed = line_length - text_length - total_padding

    if blocks_needed < 2 then
    print("Error: Line length too small for the given text")
    return
    end

    local left_blocks = string.rep('█', math.floor(blocks_needed / 2))
    local right_blocks = string.rep('█', math.ceil(blocks_needed / 2))

    local result = left_blocks .. '  ' .. text .. '  ' .. right_blocks
        vim.api.nvim_put({result}, 'l', true, true)
    end, {nargs = '+'})
