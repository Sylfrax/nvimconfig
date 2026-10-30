local augroup = vim.api.nvim_create_augroup("BlinkCmpLazy", {
    clear = true 
})
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    group = augroup,
    once = true,
    callback = function ()
        vim.defer_fn(function ()
            vim.cmd.packadd('blink.cmp')
            require("blink.cmp").setup({
                keymap = {
                    preset = "super-tab"
                },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                },
                fuzzy = {
                    --implementation = "lua"
                    sorts = { "score", "kind" },
                },
                completion = {
                    menu = {
                        draw = {
                            columns = {
                                { "kind_icon" },
                                { "label", width = { max = 40 } },
                                { "source_name", width = { max = 10 } },
                                { "kind" },
                            },
                        },
                        border = "rounded",
                        scrollbar = true,
                        auto_show = true,
                    },
                    documentation = {
                        auto_show = true,
                        auto_show_delay_ms = 200,
                        window = {
                            border = "rounded",
                        },
                    },
                    ghost_text = {
                        enabled = true,
                    },
                }

            })
        end, 50)            
    end
})
