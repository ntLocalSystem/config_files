-- Mappings 	Action
-- <C-n>/<Down> 	Next item
-- <C-p>/<Up> 	Previous item
-- j/k 	Next/previous (in normal mode)
-- H/M/L 	Select High/Middle/Low (in normal mode)
-- gg/G 	Select the first/last item (in normal mode)
-- <CR> 	Confirm selection
-- <C-x> 	Go to file selection as a split
-- <C-v> 	Go to file selection as a vsplit
-- <C-t> 	Go to a file in a new tab
-- <C-u> 	Scroll up in preview window
-- <C-d> 	Scroll down in preview window
-- <C-f> 	Scroll left in preview window
-- <C-k> 	Scroll right in preview window
-- <M-f> 	Scroll left in results window
-- <M-k> 	Scroll right in results window
-- <C-/> 	Show mappings for picker actions (insert mode)
-- ? 	Show mappings for picker actions (normal mode)
-- <C-c> 	Close telescope (insert mode)
-- <Esc> 	Close telescope (in normal mode)
-- <Tab> 	Toggle selection and move to next selection
-- <S-Tab> 	Toggle selection and move to prev selection
-- <C-q> 	Send all items not filtered to quickfixlist (qflist)
-- <M-q> 	Send all selected items to qflist
-- <C-r><C-w> 	Insert cword in original window into prompt (insert mode)
-- <C-r><C-a> 	Insert cWORD in original window into prompt (insert mode)
-- <C-r><C-f> 	Insert cfile in original window into prompt (insert mode)
-- <C-r><C-l> 	Insert cline in original window into prompt (insert mode)


local keymaps = {
	-- File search
	{ '<leader>ff', "<cmd>Telescope find_files<CR>",  desc = 'Find files in cwd'},
	{ '<leader>ftf', "<cmd>Telescope git_files<CR>",  desc = 'Search in tracked files' },
	{ '<leader>fg', "<cmd>Telescope live_grep<CR>",  desc = 'Live grep in cwd' },

	-- Buffers
	{ '<leader>bl', "<cmd>Telescope buffers<CR>",  desc = 'List buffers' },
	{ '<leader>bo', "<cmd>Telescope oldfiles<CR>",  desc = 'List old files' },

	-- Commands
	{ '<leader>ch', "<cmd>Telescope command_history<CR>",  desc = 'Command History' },

	-- Vim Search
	{ '<leader>sh', "<cmd>Telescope search_history<CR>",  desc = 'Search History' },
	{ '<leader>sb', "<cmd>Telescope current_buffer_fuzzy_find<CR>",  desc = 'Fuzzy search in current buffer' },
	{ '<leader>sw', "<cmd>Telescope grep_string<CR>",  desc = 'Search current word in cwd' },

	-- LSP
	-- { '<leader>lr', "<cmd>Telescope lsp_references<CR>",  desc = 'List LSP references' },
	-- { '<leader>lc', "<cmd>Telescope lsp_incoming_calls<CR>",  desc = 'List LSP incoming calls' },
	-- { '<leader>lp', "<cmd>Telescope lsp_outgoing_calls<CR>",  desc = 'List LSP outgoing calls' },
	-- { 'gi', "<cmd>Telescope lsp_implementations<CR>",  desc = 'List LSP implementations' },
	-- { 'gd', "<cmd>Telescope lsp_definitions<CR>",  desc = 'List LSP definitions'},
	-- { 'gt', "<cmd>Telescope lsp_type_definitions<CR>",  desc = 'List LSP type definitions' },

	-- Treesitter
	{ '<leader>td', "<cmd>Telescope treesitter<CR>",  desc = 'List treesitter definitions' }
}

local telescope_defaults = {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
	layout_strategy = 'horizontal',
	layout_config = {
		width = 0.9,
		preview_width = 0.4,
	},
	vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim" -- Trim the indentation at the start of search results
    },
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      },
      n = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      -- find command (defaults to `fd`)
      find_cmd = "rg"
    }
  }
}

return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
	config = function()
		local telescope = require("telescope")
		telescope.setup(telescope_defaults)
		vim.keymap.set("n", "<leader>e", function()
			telescope.extensions.file_browser.file_browser({
				path="%:p:h",
				hidden = true,
				grouped = true,
				previewer = true,
			})
		end, { desc = "File browser"})
	end,
	keys = keymaps
}

