vim.api.nvim_create_autocmd("BufReadPost", {
    once = true,
    callback = function()
        vim.cmd.packadd('lualine.nvim')
        vim.notify("Lualine is running( ^3^ )/~~")
        require("lualine").setup({
            options = {
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            }
        })
    end
})

