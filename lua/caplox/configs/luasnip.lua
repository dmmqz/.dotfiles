-- https://www.youtube.com/watch?v=Dn800rlPIho
local ls = require("luasnip")

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
})

-- Jump to next input area
vim.keymap.set({ "i", "s" }, "<C-d>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

-- Jump to previous input area
vim.keymap.set({ "i", "s" }, "<C-s>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

-- Cycle through options for this input
vim.keymap.set("i", "<C-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

require('luasnip.loaders.from_vscode').lazy_load() -- Some basic snippets

-- Custom snippets
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- ls.add_snippets(
--     "python", {
-- s("print", {
--     t("print("), i(1), t(")")
-- }),
-- s(
--     "class",
--     fmt(
--         [[
--     class {1}:
--         def __init__(self{2}) -> None:
--             {3}
--     ]],
--         {
--             i(1, "MyClass"),
--             i(2),
--             i(3, "pass"),
--         }
--     )
-- ),
-- }
-- )
