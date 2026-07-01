vim.g.netrw_banner = 0

vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true

-- editor swap and backup functionality
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.backup = false

-- Always hard wrap at 80 characters in every file
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    callback = function()
        vim.opt_local.textwidth = 80
        vim.opt_local.formatoptions:append("t") -- wrap text
        vim.opt_local.smartindent = false
    end,
})

vim.opt.inccommand = "split"
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.opt.foldenable = true
vim.opt.foldmethod = manual
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "0"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.updatetime = 50
vim.opt.mouse = "a"
vim.opt.isfname:append("@-@")
-- vim.opt.colorcolumn = "80"

-- Makes the system clipboard == nvim clipboard
vim.opt.clipboard:append("unnamedplus")

-- Make invisible characters visible
vim.opt.list = true
vim.opt.listchars = {
  tab = "▸ ",
  trail = "·",
  eol = "$",
}
