local telescope_dap = require 'telescope'.extensions.dap
local dap = require 'dap'
local dapui = require 'dapui'

vim.keymap.set('n', '<leader>dh', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dH', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<leader>de', function() dap.set_exception_breakpoints({ "all" }) end)


vim.keymap.set('n', '<M-j>', dap.step_over)
vim.keymap.set('n', '<M-k>', dap.step_out)
vim.keymap.set('n', '<M-l>', dap.step_into)
vim.keymap.set('n', '<M-h>', dap.step_back)

vim.keymap.set('n', '<leader>dg', dap.continue)
vim.keymap.set('n', '<leader>dp', dap.pause)

vim.keymap.set('n', '<leader>dn', dap.run_to_cursor)
vim.keymap.set('n', '<leader>dt', function()
    print "Session closed"
    dap.terminate()
    dapui.close()
end)



vim.keymap.set('n', '<leader>di', require 'dap.ui.widgets'.hover)
vim.keymap.set('n', '<leader>d?',
    function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end)

vim.keymap.set('n', '<leader>dk', function()
    require "dap".up()
end)

vim.keymap.set('n', '<leader>dj', function()
    require "dap".down()
end)

vim.keymap.set('n', '<leader>dc', telescope_dap.commands)
vim.keymap.set('n', '<leader>dd', telescope_dap.configurations)
vim.keymap.set('n', '<leader>ds', telescope_dap.frames)
vim.keymap.set('n', '<leader>db', telescope_dap.list_breakpoints)

vim.keymap.set('n', '<leader>du', function()
    dapui.close(3)
    dapui.toggle(1)
    dapui.toggle(2)
end)
vim.keymap.set({ 'n', 'v' }, '<leader>de', dapui.eval)

vim.keymap.set('n', '<leader>df', function() require("neotest").run.run({ strategy = "dap" }) end)

vim.keymap.set('n', '<leader>dr', function()
    dapui.close(1)
    dapui.close(2)
    dapui.toggle(3)
end)

--[[ local is_dap_window = function () ]]
--[[     local api = vim.api ]]
--[[     local win_id = api.nvim_get_current_win() ]]
--[[     local buf_id = api.nvim_win_get_buf(win_id) ]]
--[[     local buf_name = api.nvim_buf_get_name(buf_id) ]]
--[[     return buf_name:lower():find("dap") ]]
--[[ end ]]