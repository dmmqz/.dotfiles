local wk = require("which-key")

wk.add({
    { "<C-n>", desc = "Open Parent Directory" },
    { "<F5>", desc = "Run Code" },

    { "<Leader>/", desc = "Comment", icon = "󰅺" },

    { "<Leader>d", group = "Debug", "" },
    { "<Leader>db", desc = "Toggle Breakpoint" },
    { "<Leader>di", desc = "Step Into" },
    { "<Leader>dn", desc = "Step Over" },
    { "<Leader>do", desc = "Step Out" },
    { "<Leader>dq", desc = "Quit" },
    { "<Leader>dt", desc = "Toggle Debugger" },

    { "<Leader>f", group = "Telescope", icon = "" },
    { "<Leader>ff", desc = "Find files" },
    { "<Leader>fg", desc = "Live grep" },

    { "<Leader>g", group = "Git", icon = "" },
    { "<Leader>ga", desc = "Add" },
    { "<Leader>gb", desc = "Blame" },
    { "<Leader>gc", desc = "Commit" },
    { "<Leader>gd", desc = "Diff" },
    { "<Leader>gl", desc = "Log" },
    { "<Leader>go", desc = "Overview" },
    { "<Leader>gp", desc = "Pull" },
    { "<Leader>gu", desc = "Unstage All" },

    { "<Leader>l", group = "LaTeX", icon = "" },
    { "<Leader>le", desc = "Errors" },
    { "<Leader>ll", desc = "Compile" },

    { "<Leader>p", desc = "Paste to Clipboard", icon = "" },
    { "<Leader>y", desc = "Yank to Clipboard", icon = "" },

    { "<Leader>x", group = "Trouble", icon = "" },
    { "<Leader>xx", desc = "Diagnostics" },
    { "<Leader>xX", desc = "Buffer Diagnostics", },
    { "<Leader>xs", desc = "Symbols", },
    { "<Leader>xl", desc = "LSP Definitions", },
    { "<Leader>xL", desc = "Location List" },
    { "<Leader>xQ", desc = "Quickfix List" },

    { "<Leader>c", group = "CMake", icon = "" },
    { "<Leader>cc", icon = "" },
    { "<Leader>cr", icon = "" },
    { "<Leader>cs", icon = "" },
    { "<Leader>ct", icon = "" },

    { "gr", group = "LSP", icon = "" },
    { "gra", desc = "Code completion", icon = "" },
    { "grd", desc = "Go to definition", icon = "" },
    { "gri", desc = "Go to implementation", icon = "" },
    { "grn", desc = "Rename", icon = "" },
    { "grr", desc = "See references", icon = "" },
})
