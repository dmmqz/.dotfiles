-- Install packages needed for debugging
require("mason-nvim-dap").setup({
    ensure_installed = { "python" }, -- TODO: Add c++
    handlers = {},
})

require("dapui").setup()

-- Keybindings
vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint() <CR>")
vim.keymap.set("n", "<F5>", ":lua require('dap').continue() <CR>")
vim.keymap.set("n", "<leader>dn", ":lua require('dap').step_over() <CR>")
vim.keymap.set("n", "<leader>di", ":lua require('dap').step_into() <CR>")
vim.keymap.set("n", "<leader>do", ":lua require('dap').step_out() <CR>")

-- UI Keybindings
vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle() <CR>")
