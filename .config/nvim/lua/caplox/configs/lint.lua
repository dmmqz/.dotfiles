local lint = require("lint")

local function line_end_col(bufnr, lnum)
    local line = vim.api.nvim_buf_get_lines(bufnr, lnum, lnum + 1, false)[1] or ""
    return math.max(#line, 1)
end

local function parse_tldr_output(output, bufnr)
    local diagnostics = {}
    local function add_diagnostic(lnum, severity, code, message)
        local parsed_lnum = math.max(tonumber(lnum) - 1, 0)
        table.insert(diagnostics, {
            lnum = parsed_lnum,
            col = 0,
            end_col = line_end_col(bufnr, parsed_lnum),
            severity = severity,
            source = "tldr-lint",
            code = code,
            message = message,
        })
    end

    for line in vim.gsplit(output, "\n", { plain = true, trimempty = true }) do
        local lnum, code, message = line:match("^[^\t]+\t(%d+)\t([A-Z]+%d+)\t(.*)$")
        if lnum ~= nil then
            add_diagnostic(lnum, vim.diagnostic.severity.WARN, code, code .. ": " .. vim.trim(message))
        else
            local parse_lnum = line:match("^Error: Parse error on line (%d+):$")
            if parse_lnum ~= nil then
                add_diagnostic(parse_lnum, vim.diagnostic.severity.ERROR, "PARSE", "PARSE: TLDR page parser error")
            end
        end
    end

    return diagnostics
end

local function make_tldr_linter(args)
    return {
        cmd = "tldr-lint",
        args = args,
        stdin = false,
        append_fname = true,
        ignore_exitcode = true,
        stream = "both",
        parser = parse_tldr_output,
    }
end

lint.linters.tldr_lint = make_tldr_linter({ "--tabular" })
lint.linters.tldr_lint_translation = make_tldr_linter({ "--tabular", "--ignore", "TLDR104" })

local diagnostic_config = {
    virtual_text = {
        prefix = "*",
        spacing = 1,
    },
    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
}

vim.diagnostic.config(diagnostic_config, lint.get_namespace("tldr_lint"))
vim.diagnostic.config(diagnostic_config, lint.get_namespace("tldr_lint_translation"))

local lint_group = vim.api.nvim_create_augroup("tldr_lint_autocmds", { clear = true })

local function is_tldr_page(bufnr)
    local path = vim.api.nvim_buf_get_name(bufnr)
    return path:match("/pages/[^/]+/[^/]+%.md$") ~= nil
        or path:match("/pages%.[^/]+/[^/]+/[^/]+%.md$") ~= nil
end

local function is_translation_tldr_page(bufnr)
    local path = vim.api.nvim_buf_get_name(bufnr)
    return path:match("/pages%.[^/]+/[^/]+/[^/]+%.md$") ~= nil
end

local function tldr_linter_for_buffer(bufnr)
    if is_translation_tldr_page(bufnr) then
        return "tldr_lint_translation"
    end

    return "tldr_lint"
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_group,
    callback = function(args)
        if vim.bo[args.buf].filetype ~= "markdown" then
            return
        end

        if not is_tldr_page(args.buf) then
            return
        end

        lint.try_lint(tldr_linter_for_buffer(args.buf))
    end,
})
