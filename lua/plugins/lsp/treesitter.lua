vim.cmd.packadd('tree-sitter-manager.nvim')
require('tree-sitter-manager').setup({
    auto_install = true,
})
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
        if lang and vim.treesitter.language.add(lang) then
            pcall(vim.treesitter.start)
        end
    end,
})


