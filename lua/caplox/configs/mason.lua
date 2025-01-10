-- This does autoinstallation of mason packages
require("mason-tool-installer").setup {
    ensure_installed = {
        "black",
        "pylint", -- Python linter
    },
    auto_update = true,
}
