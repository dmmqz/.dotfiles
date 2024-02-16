-- This does autoinstallation of mason packages
require("mason-tool-installer").setup {
    ensure_installed = {
        "debugpy",  -- Python debugger
        "codelldb", -- C++ debugger
    },
    auto_update = true,
}
