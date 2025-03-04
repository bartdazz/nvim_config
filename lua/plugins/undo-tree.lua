return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("undotree").setup()
		vim.keymap.set("n", "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", {})
	end,
}
