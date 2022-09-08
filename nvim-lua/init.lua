require('core.base')
require('core.mappings')
if vim.g.vscode then
    require('vscode')
else
    require('packer_init')
end
