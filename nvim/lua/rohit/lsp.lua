-- Enable inlay hints
vim.keymap.set("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(
    not vim.lsp.inlay_hint.is_enabled()
  )
end, { desc = "Toggle inlay hints" })

vim.lsp.config('clangd', {
	cmd = { "clangd", "--background-index", "--log=verbose" },
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
-- vim.lsp.enable("ccls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("pyright")

vim.diagnostic.config({
  virtual_text = true,
})

-- Create ONE autocommand that runs whenever ANY LSP attaches.
vim.api.nvim_create_autocmd("LSPAttach", {
	callback = function(args)
	local client = vim.lsp.get_client_by_id(args.data.client_id)
	if not client then return end


	local bufnr = args.buf

	vim.keymap.set("n", "grd", vim.lsp.buf.definition)
	vim.keymap.set("n", "grD", vim.lsp.buf.declaration)

	end,
})
