vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function ()
        vim.pack.add({ gh('lukas-reineke', 'indent-blankline.nvim') })
        local hooks = require("ibl.hooks")

-- 注册亮青色高亮组，换主题时自动重建
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "IblCyan", { fg = "#7bc6d0" })  -- 亮青色
        end)
        require('ibl').setup({
            indent = {
                char = '|',
                tab_char = '>',
            },
            scope = {
                char = '¦',
                enabled = true,
                show_start = true,
                show_end = true,
                highlight = 'IblCyan'
            },
            exclude = {
                buftypes = { 'terminal', 'nofile' }
            }
        })
    end
})
