-- Enable inlay hints
vim.keymap.set("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(
    not vim.lsp.inlay_hint.is_enabled()
  )
end, { desc = "Toggle inlay hints" })


vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
-- vim.lsp.enable("ccls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("pyright")

vim.diagnostic.config({
  virtual_text = true,
})
