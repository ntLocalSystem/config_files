local langs = { 
	"asm",
	"bash",
	"c",
	"cmake",
	"cpp",
	"csv",
	"disassembly",
	"dockerfile",
	"go",
	"javascript",
	"json",
	"json5",
	"make",
	"markdown",
	"python",
	"rust"
}

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- ensure these language parsers are installed
			ensure_installed = langs,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-s>",
					node_incremental = "<C-s>",
					scope_incremental = "<C-a>",
					node_decremental = "<C-d>",
				},
			},
		})
		-- use bash parser for zsh files
		vim.treesitter.language.register("bash", "zsh")
	end,
}
