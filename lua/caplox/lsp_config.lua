-- Mason setup
require("mason").setup()

-- Mason lsp setup
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "clangd",
    },
})

local on_attach = function(client, bufnr)
    if client.name == "lua_ls" then
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        -- elseif client.name == "pyright" then
    end
end

-- lua_ls (Lua)
require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- pyright (Python)
require("lspconfig").pyright.setup({
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- clangd (C++/C)
require("lspconfig").clangd.setup({
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})
