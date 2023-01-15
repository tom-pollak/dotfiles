local M = {}

local augroup = vim.api.nvim_create_augroup
local keymap = vim.keymap.set

vim.opt.ei = 'all'

M.my_vscode = augroup('MyVSCode', {})

vim.filetype.add {
    pattern = {
        ['.*%.ipynb.*'] = 'python'
        -- uses lua pattern matching
        -- rathen than naive matching
    }
}

local function notify(cmd)
    return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end

local function v_notify(cmd)
    return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<CR>", cmd)
end

vim.cmd(':let mapleader = " "')

keymap('n', '<leader>w', notify 'workbench.action.files.save', {
    silent = true
})
keymap('v', '<', '< gv', {
    silent = true
})
keymap('v', '>', '> gv', {
    silent = true
})
keymap('n', '<CR>', notify 'editor.action.insertLineAfter')
-- Shift enter is not possible in vim, done in keybindings

keymap('n', '<leader>rn', notify 'editor.action.rename', {
    silent = true
})
keymap('n', '<leader>rg', notify 'workbench.action.findInFiles', {
    silent = true
})

keymap('n', '<leader>rf', notify 'editor.action.refactor', {
    silent = true
})

keymap('n', '<leader>k', notify 'docsView.documentation.focus', {
    silent = true
})
keymap('n', 'K', notify 'editor.action.showHover', {
    silent = true
})

-- Navigation
keymap('n', '<C-j>', notify 'workbench.action.navigateDown')
keymap('n', '<C-k>', notify 'workbench.action.navigateUp')
keymap('n', '<C-h>', notify 'workbench.action.navigateLeft')
keymap('n', '<C-l>', notify 'workbench.action.navigateRight')

-- LSP remaps
keymap('n', 'ga', notify 'keyboard-quickfix.openQuickFix', {
    silent = true
})

keymap('n', 'gd', notify 'editor.action.revealDefinition', {
    silent = true
})
keymap('n', 'gD', notify 'editor.action.showDefinitionPreviewHover', {
    silent = true
})
keymap('n', 'gf', notify 'editor.action.revealDeclaration', {
    silent = true
})
keymap('n', 'gF', notify 'editor.action.peekDeclaration', {
    silent = true
})
keymap('n', 'ge', notify 'editor.action.goToReferences', {
    silent = true
})
keymap('n', 'gr', notify 'references-view.findReferences', {
    silent = true
})
keymap('n', 'gt', notify 'editor.action.goToTypeDefinition', {
    silent = true
})
keymap('n', 'gi', notify 'editor.action.goToImplementation', {
    silent = true
})
keymap('n', 'gI', notify 'references-view.findImplementations', {
    silent = true
})
keymap('n', 'gj', notify 'editor.action.marker.next', {
    silent = true
})
keymap('n', 'gk', notify 'editor.action.marker.prev', {
    silent = true
})

-- Comments
vim.keymap.set({ 'n', 'v', 'x', 'o' }, 'gc', '<Plug>VSCodeCommentary', {
    silent = true
})
vim.keymap.set('n', 'gcc', '<Plug>VSCodeCommentaryLine', {
    silent = true
})

-- LSP symbols
keymap('n', '<leader>s', notify 'workbench.action.gotoSymbol', {
    silent = true
})
keymap('n', '<leader>S', notify 'workbench.action.showAllSymbols', {
    silent = true
})

-- Format
keymap('n', '<leader>q', notify 'editor.action.formatDocument')
keymap('v', '<leader>q', v_notify 'editor.action.formatSelection')

-- Bookmarks
keymap('n', 'm', notify 'bookmarks.toggle', {
    silent = true
})
keymap('n', 'dm', notify 'bookmarks.clearFromAllFiles', {
    silent = true
})
keymap('n', "'", notify 'bookmarks.listFromAllFiles', {
    silent = true
})

keymap('n', '<leader>u', notify 'github.copilot.generate', { silent = true })

-- Notes
keymap('n', '<leader>mm', notify 'vsnotes.listNotes', {
    silent = true
})
keymap('n', '<leader>mn', notify 'vsnotes.newNote', {
    silent = true
})
keymap('n', '<leader>mN', notify 'vsnotes.newNoteInWorkspace', {
    silent = true
})
keymap('n', '<leader>mt', notify 'vsnotes.listTags', {
    silent = true
})
keymap('n', '<leader>mf', notify 'vsnotes.search', {
    silent = true
})
keymap('n', '<leader>mo', notify 'vsnotes.openNoteFolder', {
    silent = true
})

-- Git
keymap('n', '<leader>n', notify 'workbench.action.editor.nextChange', {
    silent = true
})
keymap('n', '<leader>p', notify 'workbench.action.editor.previousChange', {
    silent = true
})

keymap('n', '<leader>lo', notify 'gitlens.toggleFileChanges', {
    silent = true
})
keymap('n', '<leader>lh', notify 'gitlens.views.lineHistory.toggleVisibility', {
    silent = true
})
keymap('n', '<leader>lg', notify 'git-graph.view', {
    silent = true
})
keymap('n', '<leader>lb', notify 'gitlens.toggleFileBlame', { silent = true })

keymap('n', '<leader>lm', notify 'gitlens.toggleFileHeatmap', { silent = true })

--[[ keymap({'n', 'v'}, '<leader>ls', notify 'git.stageSelectedRanges', { ]]
--[[     silent = true ]]
--[[ }) ]]
--[[ keymap({'n', 'v'}, '<leader>lr', notify 'git.revertSelectedRanges', { ]]
--[[     silent = true ]]
--[[ }) ]]
--[[ keymap({'n', 'v'}, '<leader>lu', notify 'git.unstageSelectedRanges', { ]]
--[[     silent = true ]]
--[[ }) ]]

if vim.bo.filetype == "rust" then
    keymap('n', '<leader>dd', notify 'rust-analyzer.debug', {
        silent = true
    })
    keymap('n', '<leader>df', notify 'rust-analyzer.run', {
        silent = true
    })

else
    keymap('n', '<leader>dd', notify 'workbench.action.debug.selectandstart', {
        silent = true
    })
    keymap('n', '<leader>df', notify 'workbench.action.debug.run', {
        silent = true
    })
end

keymap('n', '<leader>dm', notify 'workbench.debug.viewlet.action.toggleBreakpointsActivatedAction', {
    silent = true
})
keymap('n', '<leader>dM', notify 'workbench.debug.viewlet.action.removeAllBreakpoints', {
    silent = true
})

keymap('n', '<leader>dh', notify 'editor.debug.action.toggleBreakpoint', {
    silent = true
})
keymap('n', '<leader>dH', notify 'editor.debug.action.toggleInlineBreakpoint', {
    silent = true
})
keymap('n', '<leader>dg', notify 'editor.debug.action.conditionalBreakpoint', {
    silent = true
})

keymap('n', '<leader>dc', notify 'workbench.action.debug.continue', {
    silent = true
})
keymap('n', '<leader>dp', notify 'workbench.action.debug.pause', {
    silent = true
})
keymap('n', '<leader>dy', notify 'workbench.action.debug.stop', {
    silent = true
})

keymap('n', '<leader>dn', notify 'editor.debug.action.runToCursor', {
    silent = true
})

keymap({ 'n', 'v' }, '<leader>de', notify 'editor.debug.action.selectionToRepl', {
    silent = true
})

keymap('n', '<leader>dj', notify 'workbench.action.debug.callStackDown', {
    silent = true
})
keymap('n', '<leader>dk', notify 'workbench.action.debug.callStackUp', {
    silent = true
})
keymap('n', '<leader>dJ', notify 'workbench.action.debug.callStackBottom', {
    silent = true
})
keymap('n', '<leader>dK', notify 'workbench.action.debug.callStackTop', {
    silent = true
})

keymap('n', '<leader>du', notify 'debug.jumpToCursor', {
    silent = true
})

keymap('n', '<leader>i', notify 'editor.action.toggleMinimap', {
    silent = true
})

keymap('n', '<leader>di', notify 'editor.debug.action.showDebugHover', {
    silent = true
})

keymap('n', '<leader>tt', notify 'test-explorer.pick-and-run', {
    silent = true
})
keymap('n', '<leader>tr', notify 'test-explorer.reset', {
    silent = true
})
keymap('n', '<leader>td', notify 'test-explorer.redebug', {
    silent = true
})
keymap('n', '<leader>tl', notify 'test-explorer.show-log', {
    silent = true
})
keymap('n', '<leader>tc', notify 'test-explorer.run-test-at-cursor', {
    silent = true
})


-- Leap
--[[ vim.keymap.set({ 'n', 'x', 'o' }, ';', '<Plug>(leap-forward-to)') ]]
--[[ vim.keymap.set({ 'n', 'x', 'o' }, ',', '<Plug>(leap-backward-to)') ]]
--[[ vim.keymap.set({ 'n', 'x', 'o' }, 'g;', '<Plug>(leap-cross-window)') ]]

-- Navigate something
--[[ keymap('n', 'H', notify '', { silent = true }) ]]
--[[ keymap('n', 'L', notify '', { silent = true }) ]]
return M
