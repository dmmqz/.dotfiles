local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.setup()

local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
    end,
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.beautysh.with({
            command = "beautysh",
            args = {
                "--indent-size",
                "4", -- Set indent size here
                "$FILENAME",
            },
        }),
        null_ls.builtins.diagnostics.shellcheck,
    },
})
