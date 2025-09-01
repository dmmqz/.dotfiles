-- Tab == 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.autoindent = true
vim.smartindent = true

-- Relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Reserve space in gutter
vim.opt.signcolumn = 'yes'

-- Format on save
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Enable clipboard
vim.cmd [[set clipboard+=unnamedplus]]
