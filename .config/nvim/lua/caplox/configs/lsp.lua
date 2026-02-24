vim.lsp.enable({
    "luals",
    "pylsp",
    "clangd",
    "ruff",
    "rust_analyzer",
    "bashls",
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
                autopep8 = { enabled = false },
                flake8 = { enabled = false },
                jedi_completion = {
                    enabled = true,
                    fuzzy = true
                },
                mccabe = { enabled = false },
                pycodestyle = { enabled = false },
                pyflakes = { enabled = false },
                pylint = { enabled = false },
                yapf = { enabled = false },
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
                enable = false,
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
vim.lsp.config["bashls"] = {
    cmd = { "bash-language-server", "start" },
    filetypes = { "bash", "sh", "zsh" },
    -- Google style guide
    settings = {
        bashIde = {
            shfmt = {
                caseIndent = true,
                ignoreEditorconfig = true,
            },
        },
    },
}
