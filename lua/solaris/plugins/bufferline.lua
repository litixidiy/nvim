return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
		},
	},

	event = "ColorScheme",
	config = function()
		local highlights = require("rose-pine.plugins.bufferline")
		require("bufferline").setup({ highlights = highlights })
	end,
}
