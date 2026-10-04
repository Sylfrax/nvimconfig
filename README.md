# nvimconfig
一个简单的个人配置（自用）

## Requirements
- Neovim >= 12.0
- Git
- Nerd Font

## Install if you want use it
1. Back up your config dir
    ```bash
    mv ~/.config/nvim/ ~/.config/nvim.bak
    mv ~/.local/share/nvim/ ~/.local/share/nvim.bak
    ```
2. Clone this config
    ```bash
    git clone https://github.com/Sylfrax/nvimconfig.git ~/.config/nvim
    ```

## File structure
nvim
├── LICENSE
├── README.md
├── init.lua
├── lua
│   ├── configs
│   │   ├── autocmd.lua
│   │   └── opt.lua
│   └── plugins
│       ├── base.lua
│       ├── embellish
│       │   ├── colorscheme.lua
│       │   └── lualine.lua
│       ├── lsp
│       │   ├── blink.lua
│       │   ├── lsp.lua
│       │   ├── lspconfig.lua
│       │   └── tree.lua
│       └── tools
│           ├── mini.lua
│           └── which-key.lua
└── nvim-pack-lock.json
