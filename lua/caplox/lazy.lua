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
		highlight = {
			enable = true, -- Enable treesitter-based syntax highlighting
		},
		lazy = true,
	},

	-- Mason
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"mypy",
				"clangd",
				"stylua",
				"black",
				"clang-format",
				"beautysh",
			},
		},
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
	},

	-- Mason auto installer
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"mypy",
				"clangd",
				"stylua",
				"black",
				"clang-format",
				"beautysh",
			},
		},
	},

	-- Linting
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")

			-- Linters
			lint.linters_by_ft = {
				python = { "mypy" },
				cpp = { "clangd" },
			}

			-- Auto function
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile", "BufWritePost" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					cpp = { "clang-format" },
					bash = { "beautysh" },
				},
			})

			-- Keybind format
			vim.keymap.set({ "n", "v" }, "<leader>ll", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Format file" })

			-- Format on save
			vim.api.nvim_create_autocmd("BufWritePost", {
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
})
