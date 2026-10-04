vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function ()
        vim.pack.add({ gh("echasnovski", "mini.nvim") })
        require("mini.pairs").setup()
        require("mini.indentscope").setup()
    
        require("mini.pick").setup()
        require("mini.files").setup()
        require("mini.icons").setup()
        require("mini.hipatterns").setup()
        require("mini.cursorword").setup()
    
        require("mini.notify").setup()
    
        require("mini.map").setup()
        require("mini.trailspace").setup()       
    end
})
