return {
    {
        "R-nvim/R.nvim",
        config = function()
            local opts = {
                -- auto_start = "on startup",
                hook = {
                    on_filetype = function()
                        vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
                        vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
                        vim.api.nvim_buf_set_keymap(
                            0,
                            "n",
                            "<localleader>rc",
                            "<Plug>RmdInsertChunk",
                            { noremap = true }
                        )
                    end,
                },
                R_args = { "--quiet", "--no-save" },
                min_editor_width = 72,
                rconsole_width = 78,
                disable_cmds = {
                    "RClearConsole",
                    "RCustomStart",
                    "RSPlot",
                    "RSaveClose",
                    "RInsertPipe",
                },
                pdfviewer = "~/Applications/Skim.app",
            }
            require("r").setup(opts)
        end,
    },
}
