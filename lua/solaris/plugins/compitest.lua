return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		require("competitest").setup({

			compile_command = {
				cpp = {
					exec = "clang++",
					args = {
						"$(FNAME)",
						"-o",
						"$(FNOEXT)",
						"-I",
						"/Users/ni/.local/include", -- include path for bits/stdc++.h
					},
				},
			},
			run_command = {
				cpp = { exec = "./$(FNOEXT)" },
			},

			template_file = {
				cpp = "~/dev/skillz/template/cpp_t.cpp",
			},
			evaluate_template_modifiers = true,
		})
	end,
}
