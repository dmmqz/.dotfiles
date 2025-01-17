local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    -- https://github-wiki-see.page/m/hrsh7th/nvim-cmp/wiki/List-of-sources
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer',  keyword_length = 5 },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
    }),

    -- Disable cmp on comments and Telescope buffer
    enabled = function()
        local context = require 'cmp.config.context'

        local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
        local filetype = vim.bo.filetype

        -- Disable cmp in Telescope buffers
        if filetype == 'TelescopePrompt' or buftype == 'prompt' then
            return false
        end

        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
        end
    end
})
