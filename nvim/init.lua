require('core.base')
require('core.mappings')
if vim.g.vscode ~= nil then
    vim.cmd("set noloadplugins")
    vim.cmd("packadd vim-surround")
    vim.g.loaded_matchit = true
    vim.g.no_plugin_maps = true
    require('vscode_init')
else
    require('packer_init')
end
