# 🚀 Emanuel's Full-Stack Neovim Configuration

> A professional Neovim setup built on LazyVim, optimized for full-stack development with extensive language support, intelligent code completion, and a beautiful UI.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [First Launch](#first-launch)
- [Core Concepts](#core-concepts)
- [Complete Keybindings Guide](#complete-keybindings-guide)
- [Language Support](#language-support)
- [Plugin Management](#plugin-management)
- [Customization Guide](#customization-guide)
- [Tips & Tricks](#tips--tricks)
- [Troubleshooting](#troubleshooting)
- [Backup & Recovery](#backup--recovery)

## 🎯 Overview

This configuration transforms Neovim into a powerful IDE-like environment while maintaining the speed and efficiency of a terminal editor. Built on top of [LazyVim](https://github.com/LazyVim/LazyVim), it provides:

- **Zero-config language support** for modern full-stack development
- **Intelligent code completion** with LSP integration
- **Beautiful and functional UI** with animations and icons
- **Extensive git integration** for seamless version control
- **Database management tools** built right into your editor
- **AI-powered coding assistance** (optional)

## ✨ Features

### 🧠 Intelligence & Productivity
- **Native LSP Support**: Full Language Server Protocol integration
- **Auto-completion**: Context-aware suggestions with nvim-cmp
- **Snippets**: Extensive snippet support with LuaSnip
- **Diagnostics**: Real-time error detection and quick fixes
- **Code Actions**: Refactoring and quick fixes at your fingertips
- **Formatting**: Auto-format on save with null-ls/conform.nvim
- **Linting**: Real-time linting with dedicated linters

### 🔍 Navigation & Search
- **Telescope**: Fuzzy finder for files, text, symbols, and more
- **Neo-tree**: Modern file explorer with git status integration
- **Hop/Flash**: Lightning-fast cursor movement
- **Buffer Management**: Smart buffer switching and organization
- **Project Management**: Auto-detect and switch between projects

### 🎨 UI & Experience
- **Multiple Themes**: Tokyo Night, Catppuccin, and more
- **Status Line**: Beautiful and informative with lualine
- **Tab Line**: Clear buffer/tab visualization
- **Indent Guides**: Visual indent indicators
- **Color Highlighting**: See colors in your code
- **Smooth Scrolling**: Mini.animate for smooth UI transitions
- **Icons**: Nerd Font integration throughout

### 🛠️ Development Tools
- **Git Integration**: Gitsigns, Fugitive, and Lazygit
- **Database Client**: vim-dadbod with UI for SQL development
- **REST Client**: Make HTTP requests from your editor
- **Terminal**: Integrated terminal with toggleterm
- **Debugging**: DAP (Debug Adapter Protocol) support
- **Testing**: Run tests from within Neovim
- **AI Assistance**: GitHub Copilot integration

## 📦 Installation

### Prerequisites

```bash
# On Arch Linux (already installed for you):
sudo pacman -S neovim git ripgrep fd nodejs npm

# Install a Nerd Font (you already have some installed)
# If you need more: https://www.nerdfonts.com/
```

### Verification

```bash
# Check all dependencies
nvim --version  # Should be 0.9.0+
node --version  # For LSP servers
rg --version    # ripgrep for searching
fd --version    # fd for file finding
```

## 🚦 First Launch

1. **Start Neovim**:
   ```bash
   nvim
   ```

2. **Initial Plugin Installation**:
   - Lazy.nvim will automatically start installing plugins
   - This takes 1-2 minutes on first launch
   - Press `q` to close the Lazy window when done

3. **Health Check**:
   ```vim
   :checkhealth
   ```
   - Review any warnings or errors
   - Most are optional enhancements

4. **Install Language Servers**:
   ```vim
   :Mason
   ```
   - Press `i` on any server to install
   - Recommended: typescript-language-server, pyright, rust-analyzer, gopls

## 🧭 Core Concepts

### Leader Key
The `<Space>` key is your gateway to most commands. Think of it as your command palette.

### Modal Editing
- **Normal Mode**: Navigate and manipulate text
- **Insert Mode**: Type text
- **Visual Mode**: Select text
- **Command Mode**: Run commands

### Buffers vs Windows vs Tabs
- **Buffers**: Open files in memory
- **Windows**: Viewports showing buffers
- **Tabs**: Collections of windows

## ⌨️ Complete Keybindings Guide

### 🎛️ Essential Keys

| Key | Description | Mode |
|-----|-------------|------|
| `<Space>` | Leader key | Normal |
| `jk` or `jj` | Exit insert mode | Insert |
| `<Esc>` | Exit current mode | Any |
| `:` | Command mode | Normal |
| `/` | Search forward | Normal |
| `?` | Search backward | Normal |

### 📁 File Operations

| Key | Description |
|-----|-------------|
| `<Space><Space>` | Find files (Telescope) |
| `<Space>ff` | Find files (alternative) |
| `<Space>fr` | Recent files |
| `<Space>fb` | Browse buffers |
| `<Space>fg` | Live grep (search in files) |
| `<Space>fG` | Grep with args |
| `<Space>e` | Toggle file explorer |
| `<Space>E` | Focus file explorer |

### 🪟 Window Management

| Key | Description |
|-----|-------------|
| `<C-h/j/k/l>` | Navigate windows |
| `<C-w>s` or `ss` | Split horizontally |
| `<C-w>v` or `sv` | Split vertically |
| `<C-w>c` | Close window |
| `<C-w>=` | Equal size windows |
| `<C-w>_` | Max height |
| `<C-w>|` | Max width |
| `<C-Up/Down/Left/Right>` | Resize windows |

### 📑 Buffer Management

| Key | Description |
|-----|-------------|
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `<Space>bd` | Delete buffer |
| `<Space>bD` | Force delete buffer |
| `<Space>bb` | Switch to other buffer |
| `<Space>bp` | Pin buffer |

### 🔍 Search & Replace

| Key | Description |
|-----|-------------|
| `/` | Search forward |
| `?` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor |
| `<Space>sr` | Replace in file |
| `<Space>sR` | Replace in all files |
| `<C-r>` | Toggle search/replace preview |

### 💻 LSP Features

| Key | Description |
|-----|-------------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gI` | Go to implementation |
| `gy` | Go to type definition |
| `K` | Hover documentation |
| `<C-k>` | Signature help |
| `<Space>ca` | Code actions |
| `<Space>cc` | Run codelens |
| `<Space>cC` | Refresh codelens |
| `<Space>cr` | Rename symbol |
| `<Space>cf` | Format document |
| `<Space>cd` | Line diagnostics |
| `]d` | Next diagnostic |
| `[d` | Previous diagnostic |
| `]e` | Next error |
| `[e` | Previous error |
| `]w` | Next warning |
| `[w` | Previous warning |

### 🌳 Git Integration

| Key | Description |
|-----|-------------|
| `<Space>gg` | Lazygit (full UI) |
| `<Space>gG` | Git in new tab |
| `<Space>gb` | Git blame |
| `<Space>gB` | Browse in GitHub |
| `<Space>gf` | Git files (changed) |
| `<Space>gl` | Git log |
| `<Space>gc` | Git commits |
| `<Space>gs` | Git status |
| `]h` | Next hunk |
| `[h` | Previous hunk |
| `<Space>ghs` | Stage hunk |
| `<Space>ghr` | Reset hunk |
| `<Space>ghp` | Preview hunk |
| `<Space>ghu` | Undo stage hunk |

### 🔨 Code Manipulation

| Key | Description |
|-----|-------------|
| `gcc` | Comment line |
| `gc` | Comment motion/selection |
| `gbc` | Block comment |
| `>` | Indent |
| `<` | Unindent |
| `=` | Auto-indent |
| `J` | Join lines |
| `<Space>cf` | Format file/selection |
| `<C-a>` | Increment number |
| `<C-x>` | Decrement number |

### 🎯 Navigation

| Key | Description |
|-----|-------------|
| `gg` | Go to first line |
| `G` | Go to last line |
| `{` | Previous paragraph |
| `}` | Next paragraph |
| `%` | Matching bracket |
| `<C-o>` | Jump back |
| `<C-i>` | Jump forward |
| `<Space>sj` | Flash jump |
| `<Space>sS` | Flash treesitter |

### 🖥️ Terminal

| Key | Description |
|-----|-------------|
| `<C-/>` | Toggle terminal |
| `<C-_>` | Which key in terminal |
| `<Esc><Esc>` | Enter normal mode in terminal |
| `<Space>ft` | Terminal in telescope |

### 🎨 UI Toggles

| Key | Description |
|-----|-------------|
| `<Space>uf` | Toggle formatting |
| `<Space>us` | Toggle spelling |
| `<Space>uw` | Toggle word wrap |
| `<Space>ul` | Toggle line numbers |
| `<Space>ud` | Toggle diagnostics |
| `<Space>uc` | Toggle conceal |
| `<Space>uh` | Toggle highlights |
| `<Space>ui` | Toggle indent lines |

### 🔌 Plugin Specific

| Key | Description |
|-----|-------------|
| `<Space>l` | Open Lazy plugin manager |
| `<Space>cm` | Open Mason (LSP installer) |
| `<Space>db` | Toggle DBUI |
| `<Space>du` | Toggle DBUI |
| `<Space>sk` | Search keymaps |
| `<Space>sh` | Search help |
| `<Space>sm` | Search man pages |
| `<Space>sM` | Search marks |
| `<Space>so` | Search options |

## 🌐 Language Support

### Pre-configured Languages

#### TypeScript/JavaScript
- LSP: typescript-language-server
- Linting: ESLint
- Formatting: Prettier
- Debugging: node-debug2-adapter

#### Python
- LSP: Pyright/Pylsp
- Linting: Ruff/Flake8
- Formatting: Black/Ruff
- Debugging: debugpy

#### Rust
- LSP: rust-analyzer
- Formatting: rustfmt
- Debugging: codelldb

#### Go
- LSP: gopls
- Linting: golangci-lint
- Formatting: gofmt/goimports
- Debugging: delve

#### Others
- JSON, YAML, TOML
- Markdown
- HTML/CSS
- SQL
- Lua
- Bash/Shell

### Adding Language Support

1. Install LSP server:
   ```vim
   :Mason
   ```

2. Add language extras:
   ```lua
   -- In lua/config/lazy.lua
   { import = "lazyvim.plugins.extras.lang.ruby" },
   ```

## 🔧 Plugin Management

### Using Lazy.nvim

```vim
:Lazy          " Open plugin manager
:Lazy sync     " Update all plugins
:Lazy install  " Install new plugins
:Lazy clean    " Remove unused plugins
:Lazy profile  " Profile startup time
```

### Adding Custom Plugins

Create a new file in `~/.config/nvim/lua/plugins/my-plugin.lua`:

```lua
return {
  "username/plugin-name",
  event = "VeryLazy",  -- Lazy load
  config = function()
    require("plugin-name").setup({
      -- options
    })
  end,
}
```

### Disabling Built-in Plugins

```lua
return {
  { "plugin-name", enabled = false },
}
```

## 🎨 Customization Guide

### Change Colorscheme

```lua
-- In lua/config/lazy.lua or a custom plugin file
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",  -- or "tokyonight", etc.
    },
  },
}
```

### Modify Options

```lua
-- In lua/config/options.lua
vim.opt.relativenumber = false  -- Disable relative numbers
vim.opt.tabstop = 4            -- Change tab size
vim.opt.scrolloff = 10         -- Keep 10 lines visible
```

### Custom Keymaps

```lua
-- In lua/config/keymaps.lua
local map = vim.keymap.set

-- Your custom mappings
map("n", "<leader>qq", ":qa<CR>", { desc = "Quit all" })
map("n", "<leader>ww", ":w<CR>", { desc = "Save file" })
```

### Configure Specific Plugins

```lua
-- In lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      layout_strategy = "flex",
      layout_config = {
        width = 0.9,
        height = 0.9,
      },
    },
  },
}
```

## 💡 Tips & Tricks

### Productivity Boosters

1. **Quick File Switching**: Use `<Space><Space>` frequently
2. **Multi-cursor**: Use `<C-n>` in visual mode
3. **Surround**: Use `ys`, `cs`, `ds` for quotes/brackets
4. **Quick Fix**: `<Space>xx` for trouble.nvim quickfix
5. **Marks**: `ma` to set, `'a` to jump
6. **Macros**: `qa` to record, `@a` to play
7. **Registers**: `"ay` to yank to register a
8. **Sessions**: Auto-session saves your workspace

### Performance Tips

1. **Lazy Loading**: Most plugins load on-demand
2. **Startup Time**: Check with `:Lazy profile`
3. **Large Files**: Use `:TSDisable` for huge files
4. **Disable Animations**: Remove mini.animate if slow

### Workflow Enhancements

1. **Project Search**: `<Space>sg` searches entire project
2. **Symbol Search**: `<Space>ss` for document symbols
3. **TODO Comments**: `<Space>st` finds all TODOs
4. **Git Time Machine**: Use `:Gitsigns toggle_linehl`
5. **Snippets**: Type snippet prefix and `<Tab>`

## 🚨 Troubleshooting

### Common Issues

#### Plugins Not Loading
```vim
:Lazy sync
:checkhealth lazy
```

#### LSP Not Working
```vim
:LspInfo
:Mason
:checkhealth lsp
```

#### Slow Startup
```vim
:Lazy profile
" Disable slow plugins in their config
```

#### Icons Not Showing
- Ensure terminal uses a Nerd Font
- Check `:echo g:WebDevIconsOS`

#### Clipboard Issues
```bash
# Install clipboard provider
sudo pacman -S xclip  # or wl-clipboard for Wayland
```

### Debug Mode

```vim
:lua vim.lsp.set_log_level("debug")
:lua vim.fn.writefile(vim.split(vim.inspect(vim.lsp.get_active_clients()), "\n"), "lsp.log")
```

## 💾 Backup & Recovery

### Your Backups

```bash
# List all backups
ls -la ~/.config/nvim.* 

# Restore a backup
mv ~/.config/nvim ~/.config/nvim.broken
mv ~/.config/nvim.backup-20240116-131501 ~/.config/nvim
```

### Create New Backup

```bash
# Quick backup
cp -r ~/.config/nvim ~/.config/nvim.backup-$(date +%Y%m%d-%H%M%S)

# Backup with git
cd ~/.config/nvim
git init
git add .
git commit -m "Backup: $(date)"
```

### Sync Across Machines

1. Push to GitHub:
   ```bash
   cd ~/.config/nvim
   git remote add origin YOUR_REPO_URL
   git push -u origin main
   ```

2. Clone on new machine:
   ```bash
   git clone YOUR_REPO_URL ~/.config/nvim
   nvim +"Lazy sync"
   ```

## 📚 Learning Resources

### Built-in Help
- `:Tutor` - Interactive Vim tutorial
- `:help` - Comprehensive help system
- `:help lazy.nvim` - Plugin manager docs
- `:help lsp` - LSP documentation
- `<Space>sh` - Search all help topics

### Online Resources
- [LazyVim Documentation](https://www.lazyvim.org/)
- [Neovim Documentation](https://neovim.io/doc/)
- [Vim Cheatsheet](https://vim.rtorr.com/)
- [r/neovim](https://reddit.com/r/neovim)

### Practice
- [Vim Adventures](https://vim-adventures.com/)
- [VimGolf](https://www.vimgolf.com/)
- [Practical Vim](https://pragprog.com/titles/dnvim2/practical-vim-second-edition/)

## 🎉 Enjoy Your New Setup!

You now have a professional-grade Neovim configuration that will grow with you. Remember:

- **Be patient**: Vim has a learning curve, but the payoff is huge
- **Customize freely**: This is YOUR editor
- **Stay curious**: There's always something new to learn
- **Have fun**: Enjoy the journey of mastering your tools

Happy coding! 🚀
