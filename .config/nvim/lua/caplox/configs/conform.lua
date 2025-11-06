require("conform").setup({
    formatters_by_ft = {
        python = { "isort", "black" },
        html = { "prettier" },
    },
})

vim.keymap.set("n", "<leader>t", require("conform").format)
vim.keymap.set("n", "gq", function()
    require("conform").format({ async = true })
end, { desc = "Format with conform" })

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
