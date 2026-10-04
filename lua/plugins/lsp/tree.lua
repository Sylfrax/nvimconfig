-- 2. 设置基础解析器列表，并在插件变更时自动安装
--local parsers = { 'bash', 'c', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }
--local nvim_treesitter = require('nvim-treesitter')

-- 安装基础解析器
--nvim_treesitter.install(parsers)

-- 监听 PackChanged 事件，确保插件更新后解析器也同步更新
--vim.api.nvim_create_autocmd('PackChanged', {
--  callback = function(ev)
--    local name, kind = ev.data.spec.name, ev.data.kind
--    if name == 'nvim-treesitter' and kind == 'update' then
--      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
--      vim.cmd('TSUpdate')
--    end
--  end,
--})

-- 3. 配置 FileType 自动命令：按需自动安装并启用 Treesitter
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    vim.pack.add({ gh("nvim-treesitter", "nvim-treesitter") })
    vim.notify("Tree-Sitter is add")
    local nvim_treesitter = require("nvim-treesitter")
    local buf, filetype = args.buf, args.match
    local language = vim.treesitter.language.get_lang(filetype)
    if not language then return end

    -- 检查解析器是否已安装
    local installed_parsers = nvim_treesitter.get_installed('parsers')
    if vim.tbl_contains(installed_parsers, language) then
      -- 已安装则直接启用
      vim.treesitter.start(buf, language)
    elseif vim.tbl_contains(nvim_treesitter.get_available(), language) then
      -- 未安装但官方支持则自动安装并启用
      nvim_treesitter.install(language):await(function()
        vim.treesitter.start(buf, language)
      end)
    end
  end,
})
