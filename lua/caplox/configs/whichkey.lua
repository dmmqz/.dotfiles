local wk = require("which-key")

wk.register({
    ["<Leader>"] = {
        c = {
            name = "Copilot",
            d = { "Disable" },
            e = { "Enable" },
        },
        d = {
            name = "Debug",
            b = { "Toggle Breakpoint" },
            i = { "Step Into" },
            n = { "Step Over" },
            o = { "Step Out" },
            t = { "Toggle Debugger" },
            q = { "Quit" },
        },
        f = {
            name = "Telescope",
            f = { "Find files" },
            g = { "Live grep" },
        },
        g = {
            name = "Git",
            a = { "Add" },
            b = { "Blame" },
            c = { "Commit" },
            d = { "Diff" },
            l = { "Log" },
            o = { "Overview" },
            p = { "Pull" },
            u = { "Unstage All" },
        },
        l = {
            name = "LaTeX",
            e = { "Errors" },
            l = { "Compile" },
        },
        ["/"] = { "Comment" },
        ["p"] = { "Paste to Clipboard" },
        ["y"] = { "Yank to Clipboard" },
    },
    [";"] = { "Command Mode" },
    ["<C-n>"] = { "Open Parent Directory" },
    ["<F5>"] = { "Run Code" },
})
