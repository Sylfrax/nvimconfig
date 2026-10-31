local pack_path = vim.fn.stdpath("data") .. "/site/pack/plugins/start"
vim.fn.mkdir(pack_path, "p")

require("configs.opt")

require("main")
