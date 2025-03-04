return {
    {
        "R-nvim/R.nvim",
        config = function()
            opts = {
                auto_start = "on startup",
            }
        end,
    },
--    {
--        "R-nvim/cmp-r",
--        {
--            "hrsh7th/nvim-cmp",
--            config = function()
--                require("cmp").setup({ sources = { { name = "cmp_r" } } })
--                require("cmp_r").setup({})
--                require("r").setup({ assign_map = "_" })
--            end,
--        },
--    },
}
