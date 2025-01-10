-- This does autoinstallation of mason packages
require("mason-tool-installer").setup {
    ensure_installed = {
        "ruff",   -- Python formatter
        "pylint", -- Python linter
    },
    auto_update = true,
}
