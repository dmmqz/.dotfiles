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

-- Enable clipboard
vim.cmd [[set clipboard+=unnamedplus]]

-- Which-key timeout
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Aliases
vim.filetype.add({
    extension = {
        qss = "css",
    },
})
