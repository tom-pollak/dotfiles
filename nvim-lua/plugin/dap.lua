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
    dap.repl.close()
    dapui.close({"scopes"})
end)



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
    dap.repl.toggle({ width = 80 }, "bo vsplit")
    vim.cmd [[ wincmd l ]]
    vim.cmd [[ startinsert ]]
end)
vim.keymap.set('n', '<leader>du', function() dapui.toggle {  "scopes" } end)
vim.keymap.set({ 'n', 'v' }, '<leader>dv', dapui.eval)

vim.keymap.set('n', '<leader>df', function() require("neotest").run.run({strategy = "dap"}) end)

