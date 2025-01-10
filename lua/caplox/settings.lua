-- Tab == 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.autoindent = true
vim.smartindent = true

-- Haskell 2 space indent
vim.api.nvim_create_autocmd("FileType", {
    pattern = "haskell",
    command = "setlocal tabstop=2 shiftwidth=2 expandtab"
})

-- Relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Format on save (except Haskell)
vim.cmd([[
  autocmd BufWritePre * lua if not vim.tbl_contains({"haskell"}, vim.bo.filetype) then vim.lsp.buf.format() end
]])

-- Enable clipboard
vim.cmd [[set clipboard+=unnamedplus]]

-- Specify Python provider
vim.g.python3_host_prog = vim.env.HOME .. '/.local/venv/nvim/bin/python'
