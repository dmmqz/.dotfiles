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
        null_ls.builtins.formatting.black.with({
            command = "black",
        }),
        null_ls.builtins.diagnostics.pylint.with({
            command = "pylint",
            args = {
                "--disable=F0401", -- Ignore import errors, as they are handled by the language server
                "--output-format=json",
                "$FILENAME",
            },
        }),
    },
    diagnostics_format = "#{m} [#{c}]",
    diagnostics_postprocess = function(_, _, diagnostics)
        for _, diagnostic in ipairs(diagnostics) do
            diagnostic.code = diagnostic.message_id
        end
        return diagnostics
    end,
})
