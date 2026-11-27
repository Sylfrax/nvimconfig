---@class Tool
---@field gh function
---@field addplug function
---@field lazy function
local M = {}

---@param name string
---@param repo string
M.gh = function (name, repo)
    return ("https://github.com/%s/%s"):format(name, repo)
end

---@param dir string
---@return table
M.addplug = function(dir)
    ---@type table
    local names = {}
    for name in vim.fs.dir(dir) do names[#names + 1] = name end
    table.sort(names)

    local p = {}
    for _, n in ipairs(names) do
        local path = dir .. "/" .. n
        if vim.fn.isdirectory(path) == 1 then
            vim.list_extend(p, M.addplug(path))
        elseif n:match("%.lua$") then
            local spec = dofile(path)
            if spec then p[#p + 1] = spec end
        end
    end
    return p
end


---@class Data
---@field event? vim.event
---@field opts function

---@class Spec : vim.pack.Spec
---@field data Data

---@param plug vim.pack.PlugData
M.lazy = function(plug)
    ---@cast plug.spec Spec

    local d = plug.spec.data
    if not d or not d.opts then return end

    if d.event then
        vim.api.nvim_create_autocmd(d.event, {
            once = true,
            callback = function (ev)
                vim.cmd.packadd(plug.spec.name)
                d.opts(ev)
            end
        })
    else
        vim.cmd.packadd(plug.spec.name)
        d.opts()
    end
end

return M
