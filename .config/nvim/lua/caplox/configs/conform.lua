require("conform").setup({
    formatters_by_ft = {
        python = { "isort", "black" },
    },
})

vim.keymap.set("n", "<leader>t", require("conform").format)
