------------
-- VSCODE --
------------

-- Only surround pluging
vim.cmd("set noloadplugins")
vim.cmd("source ~/.dotfiles/nvim/lua/surround.vim")

-- Add to jump list -- doesn't work vscode
-- vim.cmd([[nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j']])
-- vim.cmd([[nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k']])


local vscode_neovim = require("vscode-neovim")

-- Comments --

local comment = vscode_neovim.to_op(function(ctx)
  local cmd = ctx.is_linewise and "editor.action.commentLine" or "editor.action.blockComment"
  local opts = { range = ctx.range, callback = esc }
  if ctx.is_linewise and ctx.is_current_line then
    opts.range = nil
  end
  vscode_neovim.action(cmd, opts)
end)

local comment_block = vscode_neovim.to_op(function(ctx)
  local cmd = "editor.action.blockComment"
  local opts = { range = ctx.range, callback = esc }
  if ctx.is_linewise and ctx.is_current_line then
    opts.range = nil
  end
  vscode_neovim.action(cmd, opts)
end)

local comment_line = function()
  return comment() .. "_"
end

local k = function(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { expr = true }) -- expr is required
end

k({ "n", "x", "v"}, "gc", comment)
k({ "n" }, "gcc", comment_line)
k({ "n", "x", "v"}, "gb", comment_block)


-- Vscode commands --
local function notify(cmd)
    return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end

local function v_notify(cmd, leave_selection)
    local line1 = vim.fn.getpos("'<")[2]
    local line2 = vim.fn.getpos("'>")[2]
    leave_selection = leave_selection ~= nil and leave_selection
    vscode_neovim.notify_range(cmd, line1, line2, leave_selection)
end

-- Keymaps --
local keymap = vim.keymap.set

keymap('n', '<leader>w', notify 'workbench.action.files.save', {silent = true})
keymap('n', '<CR>', notify 'editor.action.insertLineAfter')

keymap('n', 'ga', notify 'keyboard-quickfix.openQuickFix', {silent = true})

keymap('n', '<leader>i', notify 'editor.action.toggleMinimap', {silent = true})

keymap('n', '<leader>rn', notify 'editor.action.rename', {silent = true})
keymap('n', '<leader>rf', notify 'editor.action.refactor', {silent = true})

keymap('n', '<leader>k', notify 'docsView.documentation.focus', {silent = true})
keymap('n', 'K', notify 'editor.action.showHover', {silent = true})

keymap('n', '<leader>a', notify 'breadcrumbs.focusAndSelect', {silent = true})

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

-- LSP symbols
keymap('n', '<leader>s', notify 'workbench.action.gotoSymbol', {silent = true})
keymap('n', '<leader>S', notify 'workbench.action.showAllSymbols', {silent = true})

-- Format
keymap('n', '<leader>e', notify 'editor.action.formatDocument')

-- Bookmarks
keymap('n', 'm', notify 'bookmarks.toggle', {silent = true})
keymap('n', 'dm', notify 'bookmarks.clearFromAllFiles', {silent = true})
keymap('n', "'", notify 'bookmarks.listFromAllFiles', {silent = true})

-- Git
keymap('n', '<leader>n', notify 'workbench.action.editor.nextChange', {silent = true})
keymap('n', '<leader>p', notify 'workbench.action.editor.previousChange', {silent = true})

keymap('n', '<leader>lo', notify 'gitlens.diffWithPrevious', {silent = true})
keymap('n', '<leader>lO', notify 'gitlens.diffLineWithPrevious', {silent = true})

keymap('n', '<leader>lc', notify 'gitlens.toggleFileChanges', {silent = true})
keymap('n', '<leader>lb', notify 'gitlens.toggleFileBlame', {silent = true})

-- Debug
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

-- Tests
keymap('n', '<leader>dt', notify 'test-explorer.pick-and-run', {silent = true})
keymap('n', '<leader>tc', notify 'test-explorer.run-test-at-cursor', {silent = true})
