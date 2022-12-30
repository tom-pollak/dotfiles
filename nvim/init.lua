require('core.base')
require('core.mappings')
if vim.g.vscode then
    vim.cmd("set noloadplugins")
    vim.cmd("packadd clever-f.vim")
    vim.cmd("packadd leap.nvim")
    vim.cmd("packadd vim-surround")
    require('vscode')
else
    require('packer_init')
end
