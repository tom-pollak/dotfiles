if not vim.g.vscode then
    package.path = './plugin/?.lua;' .. package.path
    require('init')
end
