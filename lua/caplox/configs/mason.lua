-- This does autoinstallation of mason packages
require("mason-tool-installer").setup {
    ensure_installed = {
        "debugpy",
    },
    auto_update = true,
}
