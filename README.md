# 🚀 NvimCraft - The Ultimate Neovim Configuration

<div align="center">

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)

**Transform your Neovim into a powerful, beautiful, and blazing-fast IDE**

[Features](#-features) • [Installation](#-installation) • [Requirements](#-requirements) • [Showcase](#-showcase)

</div>

---

## ✨ What is NvimCraft?

NvimCraft is a meticulously crafted Neovim configuration that transforms your terminal editor into a full-featured IDE. Built on top of LazyVim, it provides:

- 🎯 **Zero-config setup** - Works out of the box
- 🚀 **Lightning fast** - Lazy-loaded plugins for instant startup
- 🎨 **Beautiful UI** - Modern aesthetics with smooth animations
- 🧠 **Intelligent** - Advanced LSP integration and AI assistance
- 🔧 **Full-stack ready** - Support for all major languages and frameworks

## 🎬 Showcase

```
┌─────────────────────────────────────────────────────┐
│  NvimCraft                                    │
│  ├── 📁 src/                                        │
│  │   ├── 📄 main.ts      TypeScript intelligence   │
│  │   ├── 🎨 styles.css   Live color preview        │
│  │   └── 🐍 api.py       Python LSP support        │
│  ├── 📊 database.sql      Built-in SQL client      │
│  └── 🚀 .gitignore        Git integration          │
│                                                     │
│  Press <Space> to see the magic happen...           │
└─────────────────────────────────────────────────────┘
```

## 🎯 Features

### Language Support
- **TypeScript/JavaScript** - Full LSP, ESLint, Prettier
- **Python** - Pyright, Black, Ruff, debugpy
- **Rust** - rust-analyzer, rustfmt, Clippy
- **Go** - gopls, gofmt, golangci-lint
- **And many more!** - JSON, YAML, Markdown, SQL, etc.

### Developer Tools
- 🔍 **Telescope** - Fuzzy finding everything
- 🌳 **Neo-tree** - Modern file explorer
- 🔧 **LSP** - Code completion, diagnostics, refactoring
- 🎨 **Treesitter** - Advanced syntax highlighting
- 💾 **Git** - Gitsigns, Fugitive, Lazygit integration
- 🗄️ **Database** - Built-in SQL client with vim-dadbod
- 🤖 **AI** - GitHub Copilot support
- 🧪 **Testing** - Run tests without leaving Neovim
- 🐛 **Debugging** - DAP integration for all major languages

## 📦 Requirements

Before installing, ensure you have:

- **Neovim** >= 0.9.0
- **Git** >= 2.19.0
- **Node.js** >= 16.0.0 (for LSP servers)
- **A Nerd Font** (I recommend [JetBrainsMono Nerd Font](https://www.nerdfonts.com/))
- **ripgrep** (for telescope grep)
- **fd** (for telescope file finding)
- **A C compiler** (gcc/clang for treesitter)

### Quick Requirements Install

<details>
<summary><b>🐧 Linux (Ubuntu/Debian)</b></summary>

```bash
# Install Neovim (get latest version)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc

# Install dependencies
sudo apt update
sudo apt install -y git nodejs npm ripgrep fd-find build-essential

# Install a Nerd Font (JetBrainsMono)
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "JetBrains Mono Regular Nerd Font Complete.ttf" \
    https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf
fc-cache -fv
```
</details>

<details>
<summary><b>🐧 Arch Linux</b></summary>

```bash
# Install everything
sudo pacman -S neovim git nodejs npm ripgrep fd base-devel

# Install a Nerd Font from AUR
yay -S ttf-jetbrains-mono-nerd
```
</details>

<details>
<summary><b>🍎 macOS</b></summary>

```bash
# Install Homebrew if you haven't already
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install neovim git node ripgrep fd

# Install a Nerd Font
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```
</details>

<details>
<summary><b>🪟 Windows</b></summary>

```powershell
# Install Scoop if you haven't already
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# Install dependencies
scoop install neovim git nodejs ripgrep fd
scoop bucket add nerd-fonts
scoop install JetBrainsMono-NF

# Make sure to use Windows Terminal or a terminal that supports UTF-8
```
</details>

## 🚀 Installation

### One-Line Install (Recommended)

```bash
git clone https://github.com/YOUR_USERNAME/nvimcraft ~/.config/nvim && nvim
```

That's it! Neovim will automatically install all plugins on first launch.

### Manual Installation

1. **Backup your existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone NvimCraft**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/nvimcraft ~/.config/nvim
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```

4. **Wait for plugins to install** (this happens automatically)

5. **Restart Neovim** and enjoy!

### Post-Installation

After installation, you should:

1. **Check health**:
   ```vim
   :checkhealth
   ```

2. **Install LSP servers** for your languages:
   ```vim
   :Mason
   ```
   Press `i` on any server you want to install.

3. **Configure GitHub Copilot** (optional):
   ```vim
   :Copilot setup
   ```

## 🎮 Quick Start Guide

### Essential Keybindings

| Key | Description |
|-----|-------------|
| `<Space>` | Leader key (your command center) |
| `<Space><Space>` | Find files |
| `<Space>fg` | Search in files (grep) |
| `<Space>e` | File explorer |
| `K` | Show documentation |
| `gd` | Go to definition |
| `<Space>ca` | Code actions |

> 💡 Press `<Space>sk` to search all keybindings!

### First Steps

1. **Open a project**: `nvim .` in your project directory
2. **Find files**: Press `<Space><Space>`
3. **Search text**: Press `<Space>fg`
4. **Open terminal**: Press `<Ctrl>/`
5. **Manage git**: Press `<Space>gg` for Lazygit

## 🛠️ Customization

### Adding Your Own Plugins

Create a file in `~/.config/nvim/lua/plugins/my-plugins.lua`:

```lua
return {
  -- Add your plugins here
  {
    "someone/cool-plugin",
    config = function()
      require("cool-plugin").setup({})
    end,
  },
}
```

### Changing Settings

Edit `~/.config/nvim/lua/config/options.lua`:

```lua
-- Example: Use tabs instead of spaces
vim.opt.expandtab = false
vim.opt.tabstop = 4
```

### Custom Keymaps

Edit `~/.config/nvim/lua/config/keymaps.lua`:

```lua
-- Example: Save with Ctrl+S
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
```

## 🔄 Updating

To update NvimCraft:

```bash
cd ~/.config/nvim
git pull
nvim +":Lazy sync" +qa
```

## 🤝 Contributing

Found a bug or have a suggestion? Feel free to:

- 🐛 [Open an issue](https://github.com/YOUR_USERNAME/nvimcraft/issues)
- 🔧 [Submit a PR](https://github.com/YOUR_USERNAME/nvimcraft/pulls)
- ⭐ Give it a star if you like it!

## 📚 Documentation

- [Full documentation](./DOCUMENTATION.md) - Comprehensive guide
- [LazyVim docs](https://www.lazyvim.org/) - Base distribution
- [Neovim docs](https://neovim.io/doc/) - Official docs

## 🙏 Credits

- Built on top of [LazyVim](https://github.com/LazyVim/LazyVim) by @folke
- Inspired by the amazing Neovim community
- Special thanks to all plugin authors

## 📄 License

MIT License - feel free to use this configuration however you like!

---

<div align="center">

**Enjoy your supercharged Neovim experience! 🚀**

Made with ❤️ by Emanuel Koydl

</div>
