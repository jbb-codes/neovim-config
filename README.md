# VSCode-Neovim Configuration

A streamlined Neovim configuration optimized for VSCode integration with essential Vim motions, text objects, and Space leader keybindings.

## Features

- **Fast navigation** with `leap.nvim` and `flash.nvim`
- **Text manipulation** with `nvim-surround` for quotes, brackets, tags
- **Space leader key** with VSCode-integrated commands
- **Automatic VSCode detection** - only loads when running in VSCode

## Prerequisites

1. **Install Neovim** - Follow the [official installation guide](https://github.com/neovim/neovim/wiki/Installing-Neovim)

2. **Install VSCode extensions**:
   ```bash
   code --install-extension asvetliakov.vscode-neovim
   code --install-extension ryuta46.multi-command
   ```

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

## VSCode Settings

### Finding Your Neovim Path

First, find where Neovim is installed on your system:

```bash
# Find Neovim path
which nvim
```

**Common paths by installation method:**

- **Homebrew (macOS)**: `/opt/homebrew/bin/nvim` (Apple Silicon) or `/usr/local/bin/nvim` (Intel)
- **Package manager (Linux)**: `/usr/bin/nvim`
- **Snap (Linux)**: `/snap/bin/nvim`
- **AppImage/Manual**: `/usr/local/bin/nvim` or custom path

### Configure VSCode Settings

Add to your VSCode `settings.json` (replace `<YOUR_NVIM_PATH>` with actual path):

```json
{
  "vscode-neovim.neovimExecutablePaths.darwin": "<YOUR_NVIM_PATH>",
  "vscode-neovim.neovimInitVimPaths.darwin": "~/.config/nvim/init.lua",
  "vscode-neovim.neovimExecutablePaths.linux": "<YOUR_NVIM_PATH>",
  "vscode-neovim.neovimInitVimPaths.linux": "~/.config/nvim/init.lua",
  "vscode-neovim.neovimExecutablePaths.win32": "<YOUR_NVIM_PATH>",
  "vscode-neovim.neovimInitVimPaths.win32": "~/AppData/Local/nvim/init.lua"
}
```

**Example for Homebrew on macOS:**

```json
{
  "vscode-neovim.neovimExecutablePaths.darwin": "/opt/homebrew/bin/nvim",
  "vscode-neovim.neovimInitVimPaths.darwin": "~/.config/nvim/init.lua"
}
```

## Usage Examples

- `cs"'` - Change surrounding quotes
- `ds(` - Delete surrounding parentheses
- `s{char}{char}` - Jump to location with leap

## Testing

1. Open VSCode and try `Space + e` to toggle explorer
2. Test Vim motions like `dw`, `ci"`, `cs"'`

## Troubleshooting

- **Extension not working**: Verify Neovim path with `which nvim`
- **Keybindings not working**: Check VSCode keybinding conflicts

## Companion Repository

For the complete VSCode development environment including custom themes, additional settings, and more keybindings, check out:

**[VSCode Settings Repository](https://github.com/jbb-codes/vscode-config)**

---

_Enhancing VSCode with powerful Neovim motions and efficient keybindings._
