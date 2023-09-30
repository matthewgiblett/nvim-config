return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local keymap = vim.keymap -- for conciseness
        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            opts.desc = "Show LSP Implementations"
            keymap.set("n", "ti", "<cmd>Telescope lsp_implementations<CR>", opts)
            opts.desc = "Show LSP definitions"
            keymap.set("n", "td", "<cmd>Telescope lsp_definitions<CR>", opts)
            opts.desc = "Show LSP type definitions"
            keymap.set("n", "tt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
            opts.desc = "Show buffer diagnostic"
            keymap.set("n", "tD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

            opts.desc = "Shows results for references and implementation"
            keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
            opts.desc = "Smart rename"
            keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
            opts.desc = "Show line diagnostic"
            keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
            opts.desc = "Show cursor diagnostic"
            keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
            opts.desc = "Show documentation under cursor"
            keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
            opts.desc = "Pin documentation under cursor to top right corner"
            keymap.set("n", "KK", "<cmd>Lspsaga hover_doc ++keep<CR>", opts)
            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
            opts.desc = "See outline"
            keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- configure html server
        lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure typescript server with plugin
        lspconfig["tsserver"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure css server
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure tailwindcss server
        lspconfig["tailwindcss"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })

        -- configure python server
        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
    end,
}
