return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gi", vim.cmd.Git)
    end,
}
