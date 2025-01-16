local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- See :help lsp-zero-keybindings for binds
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
    ensure_installed = {
        "pylsp", -- autocompletion
        "ruff",  -- formatter + linter
        "clangd",
        "lua_ls",
    },
    handlers = {
        lsp_zero.default_setup,
        pylsp = function()
            require('lspconfig').pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            -- Plugins are installed in null.lua
                            black = { enabled = false },
                            autopep8 = { enabled = false },
                            yapf = { enabled = false },
                            pylint = { enabled = false },
                            pyflakes = { enabled = false },
                            pycodestyle = { enabled = false },
                            pylsp_mypy = { enabled = false },
                            jedi_completion = { fuzzy = false },
                            pyls_isort = { enabled = false },
                        }
                    }
                }
            })
        end,
        ruff = function()
            require('lspconfig').ruff.setup({
                init_options = {
                    settings = {
                        lineLength = 100,
                        format = {
                            preview = false,
                        },
                        lint = {
                            preview = true,
                            -- https://docs.astral.sh/ruff/rules/
                            extendSelect = {
                                "PL",
                                "SLF001",
                            },
                        },
                    }
                }
            })
        end,
        clangd = function()
            require('lspconfig').clangd.setup({})
        end,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    },
})
