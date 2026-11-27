---@type vim.pack.Spec
return {
    src = T.gh('saghen', 'blink.cmp'),
    version = 'v1.10.2',
    data = {
        event = 'InsertEnter',
        opts = function ()
            require('blink.cmp').setup({
                keymap = {
                    preset = 'super-tab',
                },
                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer' },
                },
                fuzzy = {
                    sorts = { 'score', 'kind' },
                },
                completion = {
                    menu = {
                        draw = {
                            columns = {
                                { 'kind_icon' },
                                { 'label', width = { max = 40 } },
                                { 'source_name', width = { max = 10 } },
                                { 'kind' },
                            },
                        },
                        border = 'rounded',
                        scrollbar = true,
                        auto_show = true,
                    },
                    documentation = {
                        auto_show = true,
                        auto_show_delay_ms = 200,
                        window = {
                            border = 'rounded',
                        },
                    },
                    ghost_text = {
                        enabled = true,
                    },
                }
            })
        end
    }
}
