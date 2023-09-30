return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/playground",
            "windwp/nvim-ts-autotag",
        },
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            treesitter.setup({ -- enable syntax highlighting
                highlight = {
                    enable = true,
                },
                indent = { enable = true },
                autotag = { enable = true },
                ensure_installed = {
                    "json",
                    "javascript",
                    "typescript",
                    "yaml",
                    "html",
                    "css",
                    "markdown",
                    "bash",
                    "lua",
                    "vim",
                    "dockerfile",
                    "gitignore",
                    "c",
                    "python",
                    "markdown",
                    "markdown_inline",
                },
                auto_install = true,
                sync_install = false,
                additional_vim_regex_highlighting = false,
            })
        end,
    },
}
