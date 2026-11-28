vim.api.nvim_create_autocmd('FileType', {
    callback = function ()
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
        if lang and vim.treesitter.language.add(lang) then
            pcall(vim.treesitter.start)
        end
    end,
})

---@type vim.pack.Spec
return {
    src = T.gh('romus204', 'tree-sitter-manager.nvim'),
    data = {
        opts = function ()
            require('tree-sitter-manager').setup({
                auto_install = true,
            })
        end
    }
}
