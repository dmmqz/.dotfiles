local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets(
    "python", {
        s("print", {
            t("print("), i(1), t(")")
        }),

        -- Functions & classes
        s(
            "class",
            fmt(
                [[
    class {1}:
        def __init__(self{2}) -> None:
            {3}
    ]],
                {
                    i(1, "MyClass"),
                    i(2),
                    i(3, "pass"),
                }
            )
        ),
        s(
            "defm",
            fmt(
                [[
    def {1}(self{2}) -> {3}:
        {4}
    ]],
                {
                    i(1, "new_method"), i(2), i(3, "None"),
                    i(4, "pass"),
                }
            )
        ),
        s(
            "def",
            fmt(
                [[
    def {1}({2}) -> {3}:
        {4}
    ]],
                {
                    i(1, "new_function"), i(2), i(3, "None"),
                    i(4, "pass"),
                }
            )
        ),

        -- ifmain
        s(
            "ifmain",
            fmt(
                [[
    if __name__ == "__main__":
        {1}
    ]],
                {
                    i(1, "main()")
                }
            )
        ),

        -- Comprehensions
        s("lc", {
            t("["), i(3, "i"), t(" for "), i(2, "i"), t(" in "), i(1, "range(10)"), t("]")
        }),
        s("sc", {
            t("{"), i(3, "i"), t(" for "), i(2, "i"), t(" in "), i(1, "range(10)"), t("}")
        }),
        s("dc", {
            t("{"), i(5, "k"), t(": "), i(4, "v"), t(" for "), i(3, "k"), t(", "), i(2, "v"), t(" in "), i(1,
            "dct.items()"), t("}")
        }),
    }
)
