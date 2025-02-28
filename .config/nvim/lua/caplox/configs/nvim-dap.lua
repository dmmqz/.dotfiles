-- Install packages needed for debugging
require("mason-nvim-dap").setup({
    ensure_installed = { "python" },
    handlers = {},
})

require("dapui").setup()

-- Keybindings
vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint() <CR>", { silent = true })
vim.keymap.set("n", "<F5>", ":lua require('dap').continue() <CR>", { silent = true })
vim.keymap.set("n", "<leader>dn", ":lua require('dap').step_over() <CR>", { silent = true })
vim.keymap.set("n", "<leader>di", ":lua require('dap').step_into() <CR>", { silent = true })
vim.keymap.set("n", "<leader>do", ":lua require('dap').step_out() <CR>", { silent = true })
vim.keymap.set("n", "<leader>dq", ":lua require('dap').close() <CR>", { silent = true })

-- UI Keybindings
vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle() <CR>", { silent = true })
