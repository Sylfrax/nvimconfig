# Nvimconfig
A simple personal nvim config, using the *vim.pack*, only **21** plugins

## Requirements
- Neovim >= 0.12.0
- Git
- Nerd Font
- Fzf

## Installation
1. Back up your config dir
    ```bash
    mv ~/.config/nvim/ ~/.config/nvim.bak
    mv ~/.local/share/nvim/ ~/.local/share/nvim.bak
    ```
2. Clone this config
    ```bash
    git clone https://github.com/Sylfrax/nvimconfig.git ~/.config/nvim
    ```
3. Install fzf
## File structure
```txt
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
```
