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

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Enable clipboard
vim.cmd [[set clipboard+=unnamedplus]]

-- Specify Python provider
-- vim.g.python3_host_prog = vim.env.HOME .. '/miniconda3/envs/sim-mesa/bin/python'
vim.g.python3_host_prog = vim.env.HOME .. '/.local/venv/nvim/bin/python'
