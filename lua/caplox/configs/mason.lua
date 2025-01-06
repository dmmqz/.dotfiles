-- This does autoinstallation of mason packages
require("mason-tool-installer").setup {
    ensure_installed = {
        "black",    -- Python formatter
        "pylint",   -- Python linter
        "codelldb", -- C++ debugger
    },
    auto_update = true,
}
