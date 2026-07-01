local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Reloads the configuration
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Reloads the current configuration file" })

-- Move the lines in normal, insert, and visual mode --------------------------

-- NORMAL MODE: Move line up/down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })

-- INSERT MODE: Move line up/down and stay in insert mode
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })

-- VISUAL MODE: Move selected block up/down
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })
--------------------------------------------------------------------------------

-- Move page down/up and center the current line
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Search - center the highlights
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Visual mode shifts
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "J", "mzJ`z")

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Replace and paste in visual mode
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "replace selection with yanked text" })
vim.keymap.set("v", "p", '"_dp', { noremap = true, silent = true, desc = "replace selection with yanked text"})

-- Leader d delete wont remember as yanked/clipboard when delete pasting
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete into NULL register" })

-- Unmaps Q in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- prevent x delete from registering when next paste
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete character into NULL register"})

-- Replace the word cursor is on globally
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
-- 						{ desc = "Replace word cursor is on globally" })

-- Tab stuff

--open new tab
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")   
--close current tab
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>") 
--go to next
vim.keymap.set("n", "<leader>tn", "<cmd>tab next<CR>")     
--go to pre
vim.keymap.set("n", "<leader>tp", "<cmd>tab prev<CR>")     
--open current buffer in new tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew current file<CR>") 
-------------------------------------------------------------------------

-- Split management
-- Split window vertically
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- Split window horizontally
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- Make split windows equal width & height
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) 
-- Close current split window
vim.keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" })

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:p") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>ld", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end, { desc = "Toggle LSP diagnostics" })

vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- Copies or Yank to system clipboard
-- TODO: system clipboard == nvim clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)

-- format without prettier using the built in
vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format)

-- Forward search current word directly
vim.keymap.set("n", "<leader>sq", ":/<C-r><C-w><CR>", { desc = "Literal search current word" })

-- Switch to previous buffer
vim.keymap.set("n", "<leader>`", ":b#<CR>", { desc = "Switch to previous buffer" })

