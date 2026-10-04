local lazy = {}

---@param plug_name string
---@param setup_fn function
lazy.Load = function (plug_name, setup_fn)
    return function()
        local ok, res = pcall(function() 
            return vim.pack.get({plug_name})[1] 
        end)
        if not ok or not res then
            vim.notify("插件未安装", vim.log.ERROR)
            return
        end
        vim.cmd.packadd(res.spec.name)
        if setup_fn then setup_fn() end
    end
end

return lazy
