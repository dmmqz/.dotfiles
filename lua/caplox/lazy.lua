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
        lazy = false,
        highlight = {
            enable = true,
        },
        ensure_installed = {
            "python",
            "cpp",
            "lua",
        },
        auto_install = true,
        additional_vim_regex_highlighting = false,
    },

    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lua" },
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
    { "VonHeikemen/lsp-zero.nvim",        branch = "v3.x" },

    -- Vim fugitive, git
    { "tpope/vim-fugitive" },

    -- Commentary for easier commenting
    { "tpope/vim-commentary" },

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
    },

    -- None-ls, formatting for python
    { "nvimtools/none-ls.nvim" },
})
