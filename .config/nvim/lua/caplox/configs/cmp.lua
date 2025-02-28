local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local lspkind = require('lspkind')

cmp.setup({
    -- https://github-wiki-see.page/m/hrsh7th/nvim-cmp/wiki/List-of-sources
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer',  keyword_length = 5 },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
    }),
    formatting = {
        -- https://github.com/onsails/lspkind.nvim?tab=readme-ov-file#option-2-nvim-cmp
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = {
                menu = 50,
                abbr = 50,
            },
            ellipsis_char = '...',
        })
    },
    enabled = function()
        local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
        local filetype = vim.bo.filetype

        -- Disable cmp in Telescope buffers
        return not (filetype == 'TelescopePrompt' or buftype == 'prompt')
    end
})
