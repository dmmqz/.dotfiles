-- Tab == 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Theme
vim.cmd [[colorscheme tokyonight]]

-- Relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
