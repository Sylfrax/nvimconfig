vim.api.nvim_create_autocmd('FileType', {
    once = true,
    pattern = 'lua',
    callback = function ()
        vim.pack.add({
            { src = "https://github.com/brenoprata10/nvim-highlight-colors" }
        })

        require("nvim-highlight-colors").setup({
            render = "background",        -- 高亮样式：background/foreground/virtual
            enable_hex = true,            -- 识别 #FFFFFF
            enable_short_hex = true,      -- 识别 #FFF
            enable_rgb = true,            -- 识别 rgb(255, 255, 255)
            enable_hsl = true,            -- 识别 hsl(0, 0%, 100%)
            enable_named_colors = true,   -- 识别 "red"、"blue" 等命名颜色
            enable_tailwind = false,      -- 是否识别 Tailwind 类名（如 bg-blue-500）
        })
    end
})
