local telescope_dap = require 'telescope'.extensions.dap
local dap = require 'dap'
local dapui = require 'dapui'

vim.keymap.set('n', '<leader>dh', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dH', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<leader>dR', dap.clear_breakpoints)
vim.keymap.set('n', '<leader>de', function() dap.set_exception_breakpoints({ "all" }) end)


vim.keymap.set('n', '<M-j>', dap.step_over)
vim.keymap.set('n', '<M-k>', dap.step_out)
vim.keymap.set('n', '<M-l>', dap.step_into)
vim.keymap.set('n', '<M-h>', dap.step_back)

vim.keymap.set('n', '<leader>c', dap.continue)
vim.keymap.set('n', '<leader>dp', dap.pause)

vim.keymap.set('n', '<leader>dn', dap.run_to_cursor)
vim.keymap.set('n', '<leader>dt', dap.terminate)



vim.keymap.set('n', '<leader>di', require 'dap.ui.widgets'.hover)
vim.keymap.set('n', '<leader>d?',
    function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end)

vim.keymap.set('n', '<leader>dk', function()
    require "dap".up()
    vim.cmd [[zz]]
end)

vim.keymap.set('n', '<leader>dj', function()
    require "dap".down()
    vim.cmd [[zz]]
end)

vim.keymap.set('n', '<leader>dc', telescope_dap.commands)
vim.keymap.set('n', '<leader>dd', telescope_dap.configurations)
vim.keymap.set('n', '<leader>ds', telescope_dap.frames)
vim.keymap.set('n', '<leader>db', telescope_dap.list_breakpoints)

vim.keymap.set('n', '<leader>dr', function()
    dap.repl.toggle({ width = 70 }, "bo vsplit")
    vim.cmd [[ wincmd l ]]
end)
vim.keymap.set('n', '<leader>du', function() dapui.toggle { "console", "scopes" } end)
vim.keymap.set({ 'n', 'v' }, '<leader>dv', dapui.eval)
