local M = {}

function find_by_path()
    local command = ":e " .. vim.fn.expand("%:p:h") .. "/"
    return command
end

M.find_by_path = find_by_path

return M

