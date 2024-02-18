-- This does autoinstallation of mason packages
require("mason-tool-installer").setup {
    ensure_installed = {
        "black",              -- Python formatter
        "debugpy",            -- Python debugger
        "codelldb",           -- C++ debugger
        "beautysh",           -- Bash formatter
        "bash-debug-adapter", -- Bash debugger
        "shellcheck",         -- Shell script linter
    },
    auto_update = true,
}
