-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v")        -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")        -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")        -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>")    -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     --  go to previous tab

-- move text in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z") -- append below line to current line without moving cursor

-- half page jumping with centred cursor
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor centred while searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- paste over word without losing current buffer
keymap.set("x", "<leader>p", [["_dP]])

-- copy to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- paste from system clipboard
keymap.set({ "n", "v" }, "<leader>p", [["+p]])
keymap.set("n", "<leader>P", [["+P]])

-- delete to void register
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format file
keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- replace word under cursor
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- debugging
keymap.set("n", "<F10>", '<cmd>lua require"dap".step_over()<CR>')
keymap.set("n", "<F11>", '<cmd>lua require"dap".step_into()<CR>')
keymap.set("n", "<F12>", '<cmd>lua require"dap".step_out()<CR>')
keymap.set("n", "<F5>", '<cmd>lua require"dap".continue()<CR>')
keymap.set("n", "<leader>db", '<cmd>lua require"dap".toggle_breakpoint()<CR>')
keymap.set("n", "<leader>dc", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')

keymap.set("n", "<leader>du", '<cmd>lua require"dapui".toggle()<CR>')

keymap.set("n", "<leader>dpr", '<cmd>lua require"dap-python".test_method()<CR>')

-- trouble
keymap.set("n", "<leader>xx", function()
    require("trouble").open()
end)
keymap.set("n", "<leader>xw", function()
    require("trouble").open("workspace_diagnostics")
end)
keymap.set("n", "<leader>xd", function()
    require("trouble").open("document_diagnostics")
end)
keymap.set("n", "<leader>xq", function()
    require("trouble").open("quickfix")
end)
keymap.set("n", "<leader>xl", function()
    require("trouble").open("loclist")
end)
keymap.set("n", "gR", function()
    require("trouble").open("lsp_references")
end)
