vim.lsp.enable({
    "luals",
    "pylsp",
    "clangd",
    "ruff",
    "rust_analyzer",
})

vim.lsp.config["luals"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc" },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            }
        }
    }
}
vim.lsp.config["pylsp"] = {
    cmd = { "pylsp" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml" },
    settings = {
        pylsp = {
            plugins = {
                black = { enabled = false },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                pylint = { enabled = false },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                pylsp_mypy = { enabled = false },
                jedi_completion = { fuzzy = true },
                pyls_isort = { enabled = false },
            }
        }
    }
}
vim.lsp.config["clangd"] = {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_markers = { ".clang-format" },
}
vim.lsp.config["ruff"] = {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml" },
    init_options = {
        settings = {
            lineLength = 100,
            format = {
                preview = false,
            },
            lint = {
                enable = true,
                preview = false,
            },
        }
    }
}
vim.lsp.config["rust_analyzer"] = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml" }
}
