require('core')

if vim.g.vscode == nil then
    require('config')
else
    require('vscode')
end
