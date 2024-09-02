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

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Enable clipboard
vim.cmd [[set clipboard+=unnamedplus]]
