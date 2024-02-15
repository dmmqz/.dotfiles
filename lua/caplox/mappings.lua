-- default keybinds
vim.g.mapleader = " " -- <Leader> keybind
vim.keymap.set("n", "<C-n>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
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
vim.api.nvim_set_keymap("x", "<Leader>/", "<Plug>Commentary", {})

-- Vimtex (LaTeX) keybinds
vim.keymap.set("n", "<leader>ll", ":VimtexCompile<CR>")
vim.keymap.set("n", "<leader>le", ":VimtexErrors<CR>")

-- Git (fugitive)
vim.keymap.set("n", "<leader>ga", ":Git add ")
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
vim.keymap.set("n", "<leader>gc", ":Git commit -m ")
vim.keymap.set("n", "<leader>gd", ":Git diff<CR>")
vim.keymap.set("n", "<leader>gl", ":Git log<CR>")
vim.keymap.set("n", "<leader>go", ":Git<CR>")
vim.keymap.set("n", "<leader>gp", ":Git pull<CR>")
vim.keymap.set("n", "<leader>gu", ":Git reset<CR>")
