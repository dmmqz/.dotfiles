local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                defaults = {
                    -- Flip C-c and ESC bindings
                    mappings = {
                        i = {
                            ["<C-c>"] = false,
                            ["<ESC>"] = require('telescope.actions').close,
                        },
                        n = {
                            ["<C-c>"] = require('telescope.actions').close,
                        }
                    }
                }
            })
        end,
    },


    -- Tokyonight theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight-storm]])
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                },
                ensure_installed = {
                    "python",
                    "cpp",
                    "lua",
                },
                ignore_install = {
                    "latex",
                },
                auto_install = true,
                additional_vim_regex_highlighting = false,
            })
        end,
    },

    -- Mason
    { "williamboman/mason.nvim", },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },

    -- Completion
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        opts = {
            keymap = {
                preset = "none",
                ["<C-e>"] = { "hide" },
                ["<CR>"] = { "accept", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
                ["<C-j>"] = { "show", "select_next", "fallback_to_mappings" },
            },
            completion = {
                menu = { auto_show = false },
                documentation = { auto_show = true }
            },
        },
    },

    -- Formatting (uses LSP as fallback)
    { "stevearc/conform.nvim" },

    -- Diagnostics
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            {
                " xX",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                " xx",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                " xs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                " xl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                " xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                " xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },

    -- Vim fugitive and Gitsigns for git
    { "tpope/vim-fugitive" },
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },

    -- Commentary for easier commenting
    { "tpope/vim-commentary", },

    -- Autopair braces etc
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    -- LaTeX compiler
    {
        "lervag/vimtex",
        ft = { "tex", "plaintex" },
        config = function()
            vim.g.vimtex_view_general_viewer = "zathura"
        end,
    },

    -- Oil, a netrw like file explorer
    {
        "stevearc/oil.nvim",
        opts = {
            default_file_explorer = true,
            keymaps = {
                ["<C-c>"] = false,
            }
        },
    },

    -- Whichkey
    {
        "folke/which-key.nvim",
        dependencies = {
            "nvim-mini/mini.icons",
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
})
