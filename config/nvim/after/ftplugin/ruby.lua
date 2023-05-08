vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(event)
    if vim.endswith(event.file, ".html.erb") then
      return
    end

    vim.lsp.buf.format()
  end,
  group = vim.api.nvim_create_augroup("AutocmdsRubyFormatting", {}),
})
