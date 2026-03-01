require("conform").setup({
    formatters_by_ft = {
        python = { "isort", "black" },
        html = { "prettier" },
    },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- Formatting
vim.keymap.set("n", "gq", function()
    local ft = vim.bo.filetype

    if ft == "python" or ft == "html" then
        require("conform").format({ async = true })
    else
        vim.lsp.buf.format({ async = true })
    end
end, { desc = "Format buffer" })

vim.keymap.set("v", "gq", function()
  local ft = vim.bo.filetype

  local start_pos = vim.fn.getpos("'<")
  local end_pos   = vim.fn.getpos("'>")

  -- Exit visual mode BEFORE formatting
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)

  if ft == "python" or ft == "html" then
    require("conform").format({ async = true })
    return
  end

  -- Try range formatting if supported
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    if client.supports_method("textDocument/rangeFormatting") then
      vim.lsp.buf.format({
        async = true,
        range = {
          start = { start_pos[2], start_pos[3] - 1 },
          ["end"] = { end_pos[2], end_pos[3] },
        },
      })
      return
    end
  end
end, { desc = "Format selection" })
