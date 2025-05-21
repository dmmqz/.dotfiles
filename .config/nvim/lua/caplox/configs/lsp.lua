-- Reserve space in gutter
vim.opt.signcolumn = 'yes'

-- lsp setup for cmp
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- New way to configure LSPs (v0.11)
-- Configure LSPs (installed with Mason)
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
vim.lsp.config["clangd"] = {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_markers = { ".clang-format" },
}

-- Enable LSPs
vim.lsp.enable("luals")
vim.lsp.enable("pylsp")
vim.lsp.enable("clangd")
vim.lsp.enable("ruff")
