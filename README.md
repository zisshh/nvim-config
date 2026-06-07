# nvim-config

My personal Neovim configuration. Lua-based, managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Structure

```
init.lua                     -- bootstrap lazy.nvim, load core modules
lua/core/
├── options.lua              -- editor options
├── keymaps.lua              -- global keymaps
├── plugins.lua              -- plugin list (lazy.nvim spec)
└── plugin_config/           -- per-plugin config
    ├── colorscheme.lua
    ├── lsp_config.lua
    ├── telescope.lua
    ├── treesitter.lua
    ├── completions.lua
    ├── nvimtree_config.lua
    └── ...
```

## Install

Requires Neovim 0.10+ (uses `vim.lsp.config`), `git`, `node`/`npm`, a [Nerd Font](https://www.nerdfonts.com/), and [yazi](https://github.com/sxyazi/yazi) for the file manager.

```bash
git clone https://github.com/zisshh/nvim-config.git ~/.config/nvim
nvim
```

lazy.nvim self-installs on first launch and pulls all plugins. Run `:Mason` to confirm LSP servers installed.

## Custom Settings

### Editor options (`options.lua`)
- Leader key: `<Space>`
- 2-space indent, `expandtab`, `shiftround`
- Line numbers on, `cursorline` on
- `termguicolors`, dark background
- No swapfile, `autoread` + `autowrite`

### Theme
- **gruvbox** (dark) — `colorscheme.lua`
- lualine statusline

### Keymaps (`keymaps.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `jj` | insert | escape |
| `<C-h/j/k/l>` | normal | move between splits |
| `<C-d>` / `<C-u>` | normal | half-page scroll, centered |
| `<leader>e` | normal | toggle nvim-tree |
| `<leader>h` | normal | clear search highlight |
| `<S-l>` / `<S-h>` | normal | next / previous buffer |
| `<C-Up/Down/Left/Right>` | normal | resize splits |
| `<A-j>` / `<A-k>` | visual | move line down / up |
| `J` / `K` | visual block | move selection down / up |
| `p` | visual | paste without yanking replaced text |
| `Q` | normal | disabled (no Ex mode) |

### Telescope (`telescope.lua`)

| Key | Action |
|-----|--------|
| `<C-p>` | find files |
| `<Space><Space>` | recent files |
| `<Space>fg` | live grep |
| `<Space>fh` | help tags |

`node_modules` ignored in pickers.

### Yazi file manager

| Key | Action |
|-----|--------|
| `<leader>n` | open yazi at current file |
| `<leader>cw` | open yazi in cwd |
| `<leader>yt` | resume last yazi session |

### LSP (`lsp_config.lua`)

Servers (auto-installed via mason): `lua_ls`, `ts_ls`, `gopls`, `tailwindcss`.

| Key | Action |
|-----|--------|
| `gd` / `gD` | definition / declaration |
| `gi` | implementation |
| `gr` | references |
| `K` | hover docs |
| `<space>rn` | rename |
| `<space>ca` | code action |
| `<space>D` | type definition |
| `<space>f` | format buffer |

### Claude Code (`claudecode.nvim`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ac` | normal | toggle Claude |
| `<leader>af` | normal | focus Claude |
| `<leader>as` | visual | send selection to Claude |

## Plugins

- **lazy.nvim** — plugin manager
- **gruvbox / catppuccin / dracula** — colorschemes
- **lualine** — statusline
- **nvim-treesitter** — syntax
- **telescope** — fuzzy finder
- **nvim-tree** + **oil** + **yazi.nvim** — file management
- **nvim-cmp** + **LuaSnip** + **friendly-snippets** — completion
- **mason** + **nvim-lspconfig** — LSP
- **copilot.vim** + **claudecode.nvim** — AI assist
- **gitsigns** + **vim-fugitive** — git
- **vim-test** + **vimux** — testing
- **vim-tmux-navigator** — tmux split navigation
- **vim-commentary**, **vim-surround**, **emmet-vim** — editing
- **markdown-preview**, **swagger-preview** — previews
