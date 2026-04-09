local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
    -- Dependencies first
    gh('nvim-lua/plenary.nvim'),
    gh('rafamadriz/friendly-snippets'),
    gh('echasnovski/mini.icons'),
    gh('nvim-tree/nvim-web-devicons'),

    -- Telescope
    gh('nvim-telescope/telescope.nvim'),

    -- Colorscheme
    gh('folke/tokyonight.nvim'),

    -- Treesitter
    gh('nvim-treesitter/nvim-treesitter'),

    -- Mason
    gh('williamboman/mason.nvim'),
    gh('WhoIsSethDaniel/mason-tool-installer.nvim'),

    -- Completion
    { src = gh('saghen/blink.cmp'), version = vim.version.range('1.0') },

    -- Formatting / Linting
    gh('stevearc/conform.nvim'),
    gh('mfussenegger/nvim-lint'),

    -- Diagnostics
    gh('folke/trouble.nvim'),

    -- Snippets
    gh('L3MON4D3/LuaSnip'),

    -- Git
    gh('tpope/vim-fugitive'),
    gh('lewis6991/gitsigns.nvim'),

    -- Utilities
    gh('tpope/vim-commentary'),
    gh('windwp/nvim-autopairs'),

    -- LaTeX
    gh('lervag/vimtex'),

    -- File explorer
    gh('stevearc/oil.nvim'),

    -- Which-key
    gh('folke/which-key.nvim'),
})

-- Telescope
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-c>"] = false,
                ["<ESC>"] = require("telescope.actions").close,
            },
            n = { ["<C-c>"] = require("telescope.actions").close },
        },
    },
})

-- Colorscheme
vim.cmd([[colorscheme tokyonight-storm]])

-- Treesitter
require("nvim-treesitter.config").setup({
    highlight = { enable = true },
    ensure_installed = { "python", "cpp", "lua" },
    ignore_install = { "latex" },
    auto_install = true,
    additional_vim_regex_highlighting = false,
})

-- Completion
require("blink.cmp").setup({
    keymap = {
        preset = "none",
        ["<C-e>"] = { "hide" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-j>"] = { "show", "select_next", "fallback_to_mappings" },
    },
    completion = {
        menu = { auto_show = false },
        documentation = { auto_show = true },
    },
})

-- Trouble
require("trouble").setup({})

-- Gitsigns
require("gitsigns").setup()

-- Autopairs
require("nvim-autopairs").setup()

-- VimTeX
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_quickfix_open_on_warning = false

-- Oil
require("oil").setup({
    default_file_explorer = true,
    keymaps = { ["<C-c>"] = false },
})
