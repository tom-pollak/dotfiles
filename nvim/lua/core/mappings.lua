-- Mappings, independant of plugins
vim.keymap.set("n", "<Esc>", "<CMD>nohl<CR><Esc>", {silent = true})

if vim.g.vscode == nil then
    vim.keymap.set("n", "<Leader>w", "<CMD>update<CR>", {silent = true})
end

vim.keymap.set("n", "<Leader><CR>", "<CMD>update<CR><CMD>so %<CR>",
               {silent = true})

vim.keymap.set("n", "<leader>o", "<CMD>noh<CR>", {silent = true})

vim.keymap.set("n", "U", "<CMD>earlier<CR>", {silent = true})
vim.keymap.set("n", "R", "<CMD>later<CR>", {silent = true})

if vim.g.vscode == nil then
    vim.keymap.set("n", "n", "nzz", {silent = true})
    vim.keymap.set("n", "N", "Nzz", {silent = true})
    vim.keymap.set("n", "*", "*zz", {silent = true})
end

vim.keymap.set({"n", "v"}, "H", "^", {silent = true})
vim.keymap.set({"n", "v"}, "L", "$", {silent = true})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {silent = true})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {silent = true})

vim.keymap.set({"n"}, "<CR>", function()
    vim.cmd([[call append(line("."),   repeat([""], v:count1))]])
end)

vim.cmd([[nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j']])
vim.cmd([[nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k']])

vim.keymap.set({"n", "x"}, "j",
               function() return vim.v.count > 0 and "j" or "gj" end,
               {noremap = true, expr = true})
vim.keymap.set({"n", "x"}, "k",
               function() return vim.v.count > 0 and "k" or "gk" end,
               {noremap = true, expr = true})

vim.keymap.set("n", "<c-f>",
               function() return ":e " .. vim.fn.expand("%:p:h") .. "/" end,
               {expr = true})

vim.keymap.set("n", "<leader>rp", function()
    return vim.cmd(":lcd" .. vim.fn.expand("%:p:h") .. "/")
end, {expr = true})

vim.keymap.set("n", "<leader>y", function() return ":!" end, {expr = true})

local t =
    function(s) return vim.api.nvim_replace_termcodes(s, true, true, true) end

vim.keymap.set("n", "<c-;>", function() vim.cmd(t("normal <c-6>")) end)

-- Forward delete, (BS is C-h)
vim.keymap.set("i", "<C-d>", "<Del>")

vim.keymap.set({"n", "v"}, "d", '"_d')
vim.keymap.set({"n", "v"}, "s", "d")
vim.keymap.set({"n", "v"}, "c", '"_c')
vim.keymap.set("v", "p", '"_dP', { noremap = true })

vim.keymap.set("n", "D", '"_D')
vim.keymap.set("n", "S", "D")
vim.keymap.set("n", "C", '"_C')

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "ss", "dd")

vim.keymap.set("n", "_", "<CMD>res +5<CR>")
vim.keymap.set("n", "+", "<CMD>res -5<CR>")
vim.keymap.set("n", "=", "<CMD>vertical res +5<CR>")
vim.keymap.set("n", "-", "<CMD>vertical res -5<CR>")

vim.keymap.set("n", "<leader>[", "<Plug>(MatchitNormalMultiBackward)")
vim.keymap.set("n", "<leader>]", "<Plug>(MatchitNormalMultiForward)")
