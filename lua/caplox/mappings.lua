-- default keybinds
vim.g.mapleader = " " -- <Leader> keybind
vim.keymap.set("n", "<C-n>", vim.cmd.Ex)
vim.keymap.set("n", ";", ":")

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Plugins
-- Telescope (fuzzy finder) keybinds
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
-- vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
-- vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})

-- Commentary (comments) keybinds
vim.keymap.set("n", "<Leader>/", vim.cmd.Commentary)
vim.api.nvim_set_keymap('x', '<Leader>/', '<Plug>Commentary', {})

-- Vimtex (LaTeX) keybinds
vim.keymap.set("n", "<leader>ll", ":VimtexCompile<CR>")
vim.keymap.set("n", "<leader>le", ":VimtexErrors<CR>")
