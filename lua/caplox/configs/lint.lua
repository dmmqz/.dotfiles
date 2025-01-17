local lint = require("lint")

-- C++ and Lua linters are included in the LSP
lint.linters_by_ft = {
    -- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
    python = { "pylint" },
}

-- Further configuration
local pylint_disabled = {
    "W1514",
}

require("lint").linters.pylint.args = {
    "-f",
    "json",
    "--from-stdin",
    "--disable=" .. table.concat(pylint_disabled, ","),
    function()
        return vim.api.nvim_buf_get_name(0)
    end,
}

-- Autolint
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
        lint.try_lint()
    end,
})
