-- Reserve space in gutter
vim.opt.signcolumn = 'yes'

-- lsp setup for cmp
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- Binds
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    end,
})

-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
    ensure_installed = {
        "pylsp", -- Python autocompletion
        "ruff",  -- Python formatter and linter
        "clangd",
        "lua_ls",
    },
    handlers = {
        pylsp = function()
            require('lspconfig').pylsp.setup({
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
                            enable = true,
                            preview = false,
                        },
                    }
                }
            })
        end,
        clangd = function()
            require('lspconfig').clangd.setup({})
        end,
        lua_ls = function()
            require('lspconfig').lua_ls.setup({})
        end,
    },
})
