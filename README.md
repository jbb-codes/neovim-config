# VSCode-Neovim Configuration

A streamlined Neovim configuration optimized for VSCode integration with essential Vim motions, text objects, and Space leader keybindings.

## Features

- **Fast navigation** with `leap.nvim` and `flash.nvim`
- **Text manipulation** with `nvim-surround` for quotes, brackets, tags
- **Space leader key** with VSCode-integrated commands
- **Automatic VSCode detection** - only loads when running in VSCode

## Prerequisites

- **Install Neovim** - Follow the [official installation guide](https://github.com/neovim/neovim/wiki/Installing-Neovim)

## Installation

**⚠️ Backup first:**

```bash
cp -r ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)
```

**Install this config:**

```bash
cd ~/.config
mv nvim nvim.old  # Move existing config
git clone <repo-url> nvim
cd nvim
git submodule update --init --recursive
```

## Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Main config with VSCode detection
├── pack/vscode-plugins/start/  # Plugins as git submodules
│   ├── leap.nvim/             # Fast navigation
│   ├── nvim-surround/         # Text objects
│   └── flash.nvim/            # Enhanced search
└── lua/vscode-neovim/
    └── vscode_keymaps.lua     # VSCode-specific keybindings
```

## How init.lua Works

The configuration uses `vim.g.vscode` to detect if running inside VSCode:

```lua
if vim.g.vscode then
    -- VSCode-specific setup
    require("leap").set_default_mappings()
    require("nvim-surround").setup()
    require("vscode-neovim.vscode_keymaps")
else
    -- Could add standalone Neovim config here
end
```

## Usage Examples

- `cs"'` - Change surrounding quotes
- `ds(` - Delete surrounding parentheses
- `s{char}{char}` - Jump to location with leap

## Testing

1. Open VSCode and try `Space + e` to toggle explorer
2. Test Vim motions like `dw`, `ci"`, `cs"'`

## Companion Repository

For the complete VSCode setup including:
- Extension installation and configuration
- VSCode settings.json with Neovim paths
- Custom themes and UI configuration  
- Additional keybindings and shortcuts
- Troubleshooting guides

Check out: **[VSCode Settings Repository](https://github.com/jbb-codes/vscode-config)**

---

_Enhancing VSCode with powerful Neovim motions and efficient keybindings._
