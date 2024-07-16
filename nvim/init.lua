require('core')

if vim.g.vscode == nil then
    require('neovim_config')
else
    require('vscode_config')
end
