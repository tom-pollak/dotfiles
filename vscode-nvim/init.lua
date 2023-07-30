vim.cmd("set noloadplugins")

-- Plugins
vim.cmd("source ~/.dotfiles/vscode-nvim/surround.vim")

-- Base config
local set = vim.opt
local keymap = vim.keymap.set

vim.g.mapleader = ' '

set.clipboard = 'unnamedplus'
set.smartcase = true
set.ignorecase = true

-- Keymaps
keymap({"n", "v"}, "d", '"_d')
keymap({"n", "v"}, "s", "d")
keymap({"n", "v"}, "c", '"_c')

keymap("n", "D", '"_D')
keymap("n", "S", "D")
keymap("n", "C", '"_C')

keymap("n", "x", '"_x')
keymap("n", "ss", "dd")

keymap("n", "<Esc>", "<CMD>nohl<CR><Esc>", {silent = true})

keymap({"n", "v"}, "H", "^", {silent = true})
keymap({"n", "v"}, "L", "$", {silent = true})

keymap('v', '<', '< gv', {silent = true})
keymap('v', '>', '> gv', {silent = true})

keymap("n", "U", "<CMD>earlier<CR>", {silent = true})
keymap("n", "R", "<CMD>later<CR>", {silent = true})

-- Add to jump list
vim.cmd([[nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j']])
vim.cmd([[nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k']])

-- Highlights
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=200})
  augroup END
]]

-- Vscode commands --
local function notify(cmd)
    return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end

local function v_notify(cmd)
    return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<CR>", cmd)
end

keymap('n', '<leader>w', notify 'workbench.action.files.save', {silent = true})
keymap('n', '<CR>', notify 'editor.action.insertLineAfter')

keymap('n', 'ga', notify 'keyboard-quickfix.openQuickFix', {silent = true})

keymap('n', '<leader>i', notify 'editor.action.toggleMinimap', {silent = true})

-- Code jumping
keymap('n', 'gd', notify 'editor.action.revealDefinition', {silent = true})
keymap('n', 'gD', notify 'editor.action.showDefinitionPreviewHover', {silent = true})
keymap('n', 'ge', notify 'editor.action.goToReferences', {silent = true})
keymap('n', 'gr', notify 'references-view.findReferences', {silent = true})
keymap('n', 'gt', notify 'editor.action.goToTypeDefinition', {silent = true})
keymap('n', 'gi', notify 'editor.action.goToImplementation', {silent = true})
keymap('n', 'gI', notify 'references-view.findImplementations', {silent = true})
keymap('n', 'gj', notify 'editor.action.marker.next', {silent = true})
keymap('n', 'gk', notify 'editor.action.marker.prev', {silent = true})

-- Comments
keymap({'n', 'v', 'x', 'o'}, 'gc', '<Plug>VSCodeCommentary', {silent = true})
keymap('n', 'gcc', '<Plug>VSCodeCommentaryLine', {silent = true})

-- LSP symbols
keymap('n', '<leader>s', notify 'workbench.action.gotoSymbol', {silent = true})
keymap('n', '<leader>S', notify 'workbench.action.showAllSymbols', {silent = true})

-- Format
keymap('n', '<leader>q', notify 'editor.action.formatDocument')

-- Bookmarks
keymap('n', 'm', notify 'bookmarks.toggle', {silent = true})
keymap('n', 'dm', notify 'bookmarks.clearFromAllFiles', {silent = true})
keymap('n', "'", notify 'bookmarks.listFromAllFiles', {silent = true})

-- Git
keymap('n', '<leader>n', notify 'workbench.action.editor.nextChange', {silent = true})
keymap('n', '<leader>p', notify 'workbench.action.editor.previousChange', {silent = true})

keymap('n', '<leader>lh', notify 'git.viewLineHistory', {silent = true})
keymap('n', '<leader>lo', notify 'git.openChange', {silent = true})
keymap('n', '<leader>lO', notify 'gitlens.diffLineWithPrevious', {silent = true})
keymap('n', '<leader>ls', notify 'git.stageSelectedRanges')
keymap ('v', '<leader>ls', v_notify 'git.stageSelectedRanges')
keymap('n', '<leader>lg', notify 'git-graph.view', {silent = true})
keymap('n', '<leader>lb', notify 'gitlens.toggleFileBlame', {silent = true})
keymap('n', '<leader>lm', notify 'gitlens.toggleFileHeatmap', {silent = true})

-- Debug
keymap('n', '<leader>dd', notify 'workbench.action.debug.selectandstart', {silent = true})

keymap('n', '<leader>du', notify 'debug.jumpToCursor', {silent = true})
keymap('n', '<leader>dw', notify 'editor.debug.action.selectionToWatch', {silent = true})
keymap('n', '<leader>dl', notify 'editor.debug.action.showDebugHover', {silent = true})

keymap('n', '<leader>dh', notify 'editor.debug.action.toggleBreakpoint', {silent = true})
keymap('n', '<leader>dH', notify 'editor.debug.action.toggleInlineBreakpoint', {silent = true})
keymap('n', '<leader>dc', notify 'editor.debug.action.conditionalBreakpoint', {silent = true})

keymap('n', '<leader>dm', notify 'workbench.debug.viewlet.action.toggleBreakpointsActivatedAction', {silent = true})
keymap('n', '<leader>dM', notify 'workbench.debug.viewlet.action.removeAllBreakpoints', {silent = true})

keymap('n', '<leader>dg', notify 'workbench.action.debug.continue', {silent = true})
keymap('n', '<leader>dp', notify 'workbench.action.debug.pause', {silent = true})
keymap('n', '<leader>dy', notify 'workbench.action.debug.stop', {silent = true})
keymap('n', '<leader>dn', notify 'editor.debug.action.runToCursor', {silent = true})

keymap('n', '<leader>dj', notify 'workbench.action.debug.callStackDown', {silent = true})
keymap('n', '<leader>dk', notify 'workbench.action.debug.callStackUp', {silent = true})
keymap('n', '<leader>dJ', notify 'workbench.action.debug.callStackBottom', {silent = true})
keymap('n', '<leader>dK', notify 'workbench.action.debug.callStackTop', {silent = true})

keymap('n', '<leader>di', notify 'editor.debug.action.selectionToRepl', {silent = true})
keymap('v', '<leader>di', v_notify 'editor.debug.action.selectionToRepl', {silent = true})

-- Tests
keymap('n', '<leader>dt', notify 'test-explorer.pick-and-run', {silent = true})
keymap('n', '<leader>tc', notify 'test-explorer.run-test-at-cursor', {silent = true})
