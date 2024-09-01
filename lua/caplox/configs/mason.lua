-- This does autoinstallation of mason packages
require("mason-tool-installer").setup {
    ensure_installed = {
        "black",    -- Python formatter
        "pylint",   -- Python linter
        "codelldb", -- C++ debugger
        "hls",      -- Haskell language server
    },
    auto_update = true,
}
