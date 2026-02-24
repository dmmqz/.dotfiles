require("mason").setup({})

require("mason-tool-installer").setup {
    ensure_installed = {
        "black",
        "clangd",
        "isort",
        "lua-language-server",
        "python-lsp-server",
        "ruff",
        "rust-analyzer",
        "bash-language-server",
        "shfmt",
    },
    auto_update = true,
}
