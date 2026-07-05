-- Automatically update Treesitter on pack update
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end
})

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
require("nvim-treesitter.config").setup({})

-- Ensure these parsers are installed on startup
require("nvim-treesitter").install({ "python", "cpp", "lua" })

-- Automatically install missing parsers + start highlighting per buffer
local function install_parser_and_enable(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if not lang then return end

    local available = require("nvim-treesitter.config").get_available()
    if not vim.tbl_contains(available, lang) then return end

    local ok, loaded = pcall(vim.treesitter.language.add, lang)
    if not (ok and loaded) then
        local install_ok, task = pcall(require("nvim-treesitter").install, { lang }, { summary = false })
        if install_ok and task then
            pcall(function() task:wait(60000) end)
        end
    end

    pcall(vim.treesitter.start, args.buf, lang)
end

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("ui.treesitter", { clear = true }),
    pattern = "*",
    callback = install_parser_and_enable,
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
