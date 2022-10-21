local M = {}

local augroup = vim.api.nvim_create_augroup
local keymap = vim.keymap.set

vim.opt.ei = 'all'

M.my_vscode = augroup('MyVSCode', {})

vim.filetype.add {
    pattern = {
        ['.*%.ipynb.*'] = 'python',
        -- uses lua pattern matching
        -- rathen than naive matching
    },
}

local function notify(cmd)
    return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end

local function v_notify(cmd)
    return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<CR>", cmd)
end

vim.cmd(':let mapleader = " "')

keymap('v', '<', '< gv', { silent = true })
keymap('v', '>', '> gv', { silent = true })

keymap('n', '<leader>rn', notify 'editor.action.rename', { silent = true })
keymap('n', '<leader>rg', notify 'workbench.action.findInFiles', { silent = true })
--[[ keymap('n', '<leader>rg', notify 'search.action.openEditor', { silent = true }) ]]

-- Navigation
keymap('n', '<C-j>', notify 'workbench.action.navigateDown')
keymap('n', '<C-k>', notify 'workbench.action.navigateUp')
keymap('n', '<C-h>', notify 'workbench.action.navigateLeft')
keymap('n', '<C-l>', notify 'workbench.action.navigateRight')

-- LSP remaps
keymap('n', '<leader>rf', notify 'editor.action.refactor', { silent = true })

keymap('n', '<leader>o', ':noh', { silent = true })

keymap('n', 'ga', notify 'keyboard-quickfix.openQuickFix', { silent = true })

keymap('n', 'gd', notify 'editor.action.revealDefinition', { silent = true })
keymap('n', 'gD', notify 'editor.action.showDefinitionPreviewHover', { silent = true })
keymap('n', 'gf', notify 'editor.action.revealDeclaration', { silent = true })
keymap('n', 'gF', notify 'editor.action.peekDeclaration', { silent = true })

keymap('n', 'ge', notify 'editor.action.goToReferences', { silent = true })
keymap('n', 'gr', notify 'references-view.findReferences', { silent = true })

keymap('n', 'gt', notify 'editor.action.goToTypeDefinition', { silent = true })
keymap('n', 'gi', notify 'editor.action.goToImplementation', { silent = true })

keymap('n', 'gj', notify 'editor.action.marker.next', { silent = true })
keymap('n', 'gk', notify 'editor.action.marker.prev', { silent = true })

keymap('n', '<leader>w', notify 'workbench.action.files.save', {silent = true})

-- Comments
vim.keymap.set({'n', 'v', 'x', 'o'}, 'gc', '<Plug>VSCodeCommentary', {silent = true})
vim.keymap.set('n', 'gcc', '<Plug>VSCodeCommentaryLine', {silent = true})


-- LSP symbols
keymap('n', '<leader>s', notify 'workbench.action.gotoSymbol', { silent = true })
keymap('n', '<leader>S', notify 'workbench.action.showAllSymbols', { silent = true })

-- Diagnostics
--[[ keymap('n', '<leader>tw', notify 'workbench.actions.view.problems', { silent = true }) ]]

-- Toggle sidebar
keymap('n', '<leader>ys', notify 'workbench.action.toggleSidebarVisibility', { silent = true })
keymap('n', '<leader>yh', notify 'workbench.action.toggleAuxiliaryBar', { silent = true })
keymap('n', '<leader>yp', notify 'workbench.action.togglePanel', { silent = true })

--[[ keymap('n', '<leader>ff', notify 'workbench.action.quickOpen', { silent = true }) -- find files ]]

-- Terminal
keymap('n', '<c-t>', notify 'workbench.action.terminal.toggleTerminal', { silent = true })

-- Help
keymap('n', '<leader>h', notify 'workbench.action.showCommands', { silent = true })

-- Format
keymap('n', '<leader>q', notify 'editor.action.formatDocument')
keymap('v', '<leader>q', v_notify 'editor.action.formatSelection')

-- Bookmarks
keymap('n', 'm', notify 'bookmarks.toggle', { silent = true })
keymap('n', 'dm', notify 'bookmarks.clearFromAllFiles', { silent = true })
keymap('n', "'", notify 'bookmarks.listFromAllFiles', { silent = true })


-- Notes
keymap('n', '<leader>mm', notify 'vsnotes.listNotes', { silent = true })
keymap('n', '<leader>mn', notify 'vsnotes.newNote', { silent = true })
keymap('n', '<leader>mN', notify 'vsnotes.newNoteInWorkspace', { silent = true })
keymap('n', '<leader>mt', notify 'vsnotes.listTags', { silent = true })
keymap('n', '<leader>mf', notify 'vsnotes.search', { silent = true })
keymap('n', '<leader>mo', notify 'vsnotes.openNoteFolder', { silent = true })

-- Git
keymap('n', '<leader>n', notify 'workbench.action.editor.nextChange', { silent = true })
keymap('n', '<leader>p', notify 'workbench.action.editor.previousChange', { silent = true })

keymap('n', '<leader>p', notify 'workbench.action.editor.previousChange', { silent = true })


keymap('n', '<leader>o', notify 'git.openChange', { silent = true })
keymap('n', '<leader>lh', notify 'git.viewFileHistory', { silent = true })
keymap('n', '<leader>ll', notify 'gitlens.gitCommands', { silent = true })
keymap('n', '<leader>lg', notify 'git-graph.view', { silent = true })

keymap('n', '<leader>ls', notify 'git.stageSelectedRanges', { silent = true })
keymap('n', '<leader>lr', notify 'git.revertSelectedRanges', { silent = true })
keymap('n', '<leader>lu', notify 'git.unstageSelectedRanges', { silent = true })
keymap('v', '<leader>lr', v_notify 'git.revertSelectedRanges', { silent = true })

-- REAL SCROLLING
--[[ keymap('n', '<c-d>', '<c-d>zz') ]]
--[[ keymap('n', '<c-u>', '<c-u>zz') ]]

--[[ keymap('n', '<c-d>', ) ]]

--[[ keymap('n', '<c-u>', notify 'germanScroll.bertholdUp', { silent = true })
keymap('n', '<c-d>', notify 'germanScroll.bertholdDown', { silent = true }) ]]
--[[ keymap('n', '<c-y>', notify 'germanScroll.arminUp', { silent = true }) ]]
--[[ keymap('n', '<c-e>', notify 'germanScroll.arminDown', { silent = true }) ]]

keymap('n', '<leader>dd', notify 'workbench.action.debug.selectandstart', { silent = true })
keymap('n', '<leader>df', notify 'workbench.action.debug.run', { silent = true })

keymap('n', '<leader>dm', notify 'workbench.debug.viewlet.action.toggleBreakpointsActivatedAction', { silent = true })
keymap('n', '<leader>dM', notify 'workbench.debug.viewlet.action.removeAllBreakpoints', { silent = true })

keymap('n', '<leader>dh', notify 'editor.debug.action.toggleBreakpoint', { silent = true })
keymap('n', '<leader>dH', notify 'editor.debug.action.toggleInlineBreakpoint', { silent = true })
keymap('n', '<leader>dg', notify 'editor.debug.action.conditionalBreakpoint', { silent = true })

keymap('n', '<leader>dc', notify 'workbench.action.debug.continue', { silent = true })
keymap('n', '<leader>dp', notify 'workbench.action.debug.pause', { silent = true })
keymap('n', '<leader>dy', notify 'workbench.action.debug.stop', { silent = true })

keymap('n', '<leader>dn', notify 'editor.debug.action.runToCursor', { silent = true })
keymap('n', '<leader>dr', notify 'workbench.debug.action.toggleRepl', { silent = true })

keymap('n', '<leader>de', notify 'editor.debug.action.selectionToRepl', { silent = true })
keymap('v', '<leader>de', v_notify 'editor.debug.action.selectionToRepl', { silent = true })

keymap('n', '<leader>dj', notify 'workbench.action.debug.callStackDown', { silent = true })
keymap('n', '<leader>dk', notify 'workbench.action.debug.callStackUp', { silent = true })
keymap('n', '<leader>dJ', notify 'workbench.action.debug.callStackBottom', { silent = true })
keymap('n', '<leader>dK', notify 'workbench.action.debug.callStackTop', { silent = true })

keymap('n', '<leader>du', notify 'debug.jumpToCursor', { silent = true })

keymap('n', '<leader>i', notify 'editor.action.toggleMinimap', { silent = true })

keymap('n', '<leader>di', notify 'editor.debug.action.showDebugHover', { silent = true })
keymap('n', '<leader>di', notify 'editor.debug.action.showDebugHover', { silent = true })

keymap('n', '<leader>tt', notify 'test-explorer.pick-and-run', { silent = true })
keymap('n', '<leader>tr', notify 'test-explorer.reset', { silent = true })
keymap('n', '<leader>td', notify 'test-explorer.redebug', { silent = true })
keymap('n', '<leader>tl', notify 'test-explorer.show-log', { silent = true })
keymap('n', '<leader>tc', notify 'test-explorer.run-test-at-cursor', { silent = true })

keymap('n', 'K', notify 'docsView.documentation.focus', { silent = true })

-- Navigate something
--[[ keymap('n', 'H', notify '', { silent = true }) ]]
--[[ keymap('n', 'L', notify '', { silent = true }) ]]
return M
