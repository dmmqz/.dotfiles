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
    -- telescope, fuzzy finder etc
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
            vim.cmd([[colorscheme tokyonight]])
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

    -- cmp (completion)
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "onsails/lspkind.nvim" },
    { "neovim/nvim-lspconfig" },

    -- Linter
    -- { "mfussenegger/nvim-lint" },
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
            vim.g.vimtex_view_general_viewer = "okular"
        end,
    },

    -- None-ls, formatting for python
    { "nvimtools/none-ls.nvim", },

    -- nvim-dap
    { "mfussenegger/nvim-dap" },
    { "jay-babu/mason-nvim-dap.nvim" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "https://github.com/nvim-neotest/nvim-nio" },
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
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
            "echasnovski/mini.icons",
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },

    -- Cmake
    {
        "Civitasv/cmake-tools.nvim",
        ft = { "cpp" },
        opts = {},
        keys = {
            {
                " cc",
                "<cmd>CMakeRun<cr>",
                desc = "Run current selection",
            },
            {
                " cr",
                "<cmd>CMakeRunCurrentFile<cr>",
                desc = "Run current file",
            },
            {
                " ct",
                "<cmd>CMakeCloseRunner<cr>",
                desc = "Close Terminal",
            },
            {
                " cs",
                "<cmd>CMakeSelectLaunchTarget<cr>",
                desc = "Switch Executable",
            },
        },
    },
})
