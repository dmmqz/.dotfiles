local wk = require("which-key")

wk.add({
    { ";", desc = "Command Mode" },
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

    { "<Leader>h", group = "Haskell", icon = "" },
    { "<Leader>hr", desc = "Run", icon = "" },
    { "<Leader>hs", desc = "Hoogle Search", icon = "" },
    { "<Leader>ha", desc = "Eval All", icon = "" },
    { "<Leader>hr", desc = "REPL package", icon = "" },
    { "<Leader>ht", desc = "REPL buffer", icon = "" },
    { "<Leader>hq", desc = "Quit REPL", icon = "" },
})
