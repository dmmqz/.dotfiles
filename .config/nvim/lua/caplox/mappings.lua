-- default keybinds
vim.g.mapleader = " " -- <Leader> keybind
vim.keymap.set("n", "<C-n>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set({ "n", "v", "i", "s" }, "<C-c>", "<ESC>")

-- Plugins
-- Telescope (fuzzy finder) keybinds
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { silent = true })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { silent = true })

-- Commentary (comments) keybinds
vim.keymap.set("n", "<Leader>/", vim.cmd.Commentary)
vim.api.nvim_set_keymap("x", "<Leader>/", "<Plug>Commentary", { silent = true })

-- Vimtex (LaTeX) keybinds
vim.keymap.set("n", "<leader>ll", ":VimtexCompile<CR>", { silent = true })
vim.keymap.set("n", "<leader>le", ":VimtexErrors<CR>", { silent = true })

-- Git (fugitive)
vim.keymap.set("n", "<leader>ga", ":Git add ", {})
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { silent = true })
vim.keymap.set("n", "<leader>gc", ":Git commit -m ", {})
vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", { silent = true })
vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { silent = true })
vim.keymap.set("n", "<leader>go", ":Git<CR>", { silent = true })
vim.keymap.set("n", "<leader>gp", ":Git pull<CR>", { silent = true })
vim.keymap.set("n", "<leader>gu", ":Git reset<CR>", {})

-- Clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')

-- LSP
vim.keymap.set("n", "grd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>r", ":update<CR> :make<CR>")
