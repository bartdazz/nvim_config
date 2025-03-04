return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    --"java_language_server"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.pyright.setup({
                capabilities = capabilities
            })
            --lspconfig.r_language_server.setup({
--                capabilities = capabilities
--            })
            --lspconfig.java_language_server.setup({})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            --vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            --vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
            --vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
            --vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
        end
    }
}

