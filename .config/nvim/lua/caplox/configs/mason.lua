require("mason").setup({})

require("mason-tool-installer").setup {
    ensure_installed = {
        "clangd",
        "lua-language-server",
        "pylint",
        "python-lsp-server",
        "ruff",
        "rust-analyzer"
    },
    auto_update = true,
}
