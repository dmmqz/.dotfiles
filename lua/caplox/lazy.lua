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
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- null-ls
    {
        "nvimtools/none-ls.nvim",
        lazy = false,
        ft = { "python" },
        opts = function()
            return require "caplox.configs.null-ls"
        end,
    },

    {
        "nvimtools/none-ls.nvim",
        ft = { "cpp" },
        event = "VeryLazy",
        opts = function()
            return require "caplox.configs.null-ls"
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
        opts = {},
    },

    -- VimBeGood
    {
        "ThePrimeagen/vim-be-good",
        event = "VeryLazy",
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        highlight = {
            -- enable = true,
        },
        lazy = true,
    },

    -- Mason
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "pyright",
                "mypy",
                "black",
                "ruff",
                "clangd",
                "clang-format",
                "stylua",
                "beautysh",
            },
        },

        -- MasonInstallAll cmd
        config = function(_, opts)
            require("mason").setup(opts)

            vim.api.nvim_create_user_command("MasonInstallAll", function()
                if opts.ensure_installed and #opts.ensure_installed > 0 then
                    vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
                end
            end, {})
        end,
    },

    -- Mason requirements
    -- mason-lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
    },

    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        config = function()
            require("caplox.configs.lspconfig")
        end
    },

    -- autocomplete
    {
        "hrsh7th/nvim-cmp",
    },
    {
        "hrsh7th/cmp-nvim-lsp",
    },

    -- Snippet Engine
    {
        "L3MON4D3/LuaSnip",
    },
})
