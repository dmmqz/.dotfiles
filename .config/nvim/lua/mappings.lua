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
vim.keymap.set("n", "<leader>lt", ":VimtexTocToggle<CR>", { silent = true })

-- Git (fugitive)
vim.keymap.set("n", "<leader>gaa", ":Git add --all<CR>", { silent = true })
vim.keymap.set("n", "<leader>gaf", function()
    if vim.fn.expand("%") == "" then
        vim.notify("No file in this buffer", vim.log.levels.WARN)
        return
    end
    vim.cmd("Git add " .. vim.fn.fnameescape(vim.fn.expand("%:p")))
end, { silent = true })
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { silent = true })
vim.keymap.set("n", "<leader>gc", ":Git commit -m ", {})
vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", { silent = true })
vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { silent = true })
vim.keymap.set("n", "<leader>go", ":Git<CR>", { silent = true })
vim.keymap.set("n", "<leader>gp", ":Git pull<CR>", { silent = true })
vim.keymap.set("n", "<leader>gu", ":Git reset<CR>", {})

-- Git (gitsigns hunks)
vim.keymap.set("n", "<leader>ghs", ":Gitsigns stage_hunk<CR>", { silent = true })
vim.keymap.set("n", "<leader>ghr", ":Gitsigns reset_hunk<CR>", { silent = true })

-- Clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')

-- LSP
vim.keymap.set("n", "grd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>r", ":update<CR> :make<CR>")

-- Trouble
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>",                        { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           { desc = "Buffer Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>",                { desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions (Trouble)" })
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                            { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                             { desc = "Quickfix List (Trouble)" })
