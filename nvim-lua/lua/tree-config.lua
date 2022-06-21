local M = {}

local function toggle_replace()
    local view = require"nvim-tree.view"
    if view.is_visible() then
        view.close()
    else
        require"nvim-tree".open_replacing_current_buffer()
    end
end

M.toggle_replace = toggle_replace

return M
