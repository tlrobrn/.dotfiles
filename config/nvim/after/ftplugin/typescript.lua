vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
    vim.cmd([[silent! EslintFixAll]])
  end,
  group = vim.api.nvim_create_augroup("AutocmdsJSFormatting", {}),
})
