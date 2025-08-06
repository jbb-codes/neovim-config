# 💤 LazyVim + VSCode-Neovim Hybrid Configuration

A dual-purpose Neovim configuration:

- **VSCode Mode**: Lightweight config with essential Vim motions and keybindings
- **Standalone Mode**: Full LazyVim experience with all plugins

## What This Provides

**VSCode Integration:**

- Space leader key with LazyVim-style bindings
- Fast navigation (`leap.nvim`, `flash.nvim`)
- Text object manipulation (`nvim-surround`)
- Window navigation (`<leader>h/j/k/l`)
- File operations (`<leader>e`, `<leader>p`, `<leader>w`)

> **Want the Full Setup?** This Neovim configuration is part of a complete VSCode + Neovim development environment. Check out the [VSCode Settings Repository](https://github.com/jbb-codes/vscode-config) for the full setup including custom themes, extensions, keybindings, and more!

## 🚀 Installation & Setup

### ⚠️ IMPORTANT: Backup Your Current Setup First

**Before making ANY changes, create comprehensive backups of your existing configurations:**

#### Full System Backup (Recommended)

```bash
# Create a timestamped backup directory
BACKUP_DIR="$HOME/config-backups/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "Creating backup in: $BACKUP_DIR"

# Backup Neovim configuration
if [ -d "$HOME/.config/nvim" ]; then
    cp -r "$HOME/.config/nvim" "$BACKUP_DIR/nvim-backup"
    echo "✅ Neovim config backed up"
else
    echo "ℹ️ No existing Neovim config found"
fi

# Backup VSCode settings (macOS)
if [ -d "$HOME/Library/Application Support/Code/User" ]; then
    mkdir -p "$BACKUP_DIR/vscode-backup"
    cp "$HOME/Library/Application Support/Code/User/settings.json" "$BACKUP_DIR/vscode-backup/" 2>/dev/null && echo "✅ VSCode settings.json backed up"
    cp "$HOME/Library/Application Support/Code/User/keybindings.json" "$BACKUP_DIR/vscode-backup/" 2>/dev/null && echo "✅ VSCode keybindings.json backed up"
    cp "$HOME/Library/Application Support/Code/User/snippets/" "$BACKUP_DIR/vscode-backup/" -r 2>/dev/null && echo "✅ VSCode snippets backed up"
fi

# Backup shell configuration
for file in .zshrc .bashrc .bash_profile .profile; do
    if [ -f "$HOME/$file" ]; then
        cp "$HOME/$file" "$BACKUP_DIR/"
        echo "✅ $file backed up"
    fi
done

# Create backup info file
cat > "$BACKUP_DIR/BACKUP_INFO.txt" << EOF
Backup created: $(date)
System: $(uname -a)
Neovim version: $(nvim --version 2>/dev/null | head -1 || echo "Not installed")
VSCode version: $(code --version 2>/dev/null | head -1 || echo "Not installed")
Shell: $SHELL

To restore:
1. Neovim: cp -r $BACKUP_DIR/nvim-backup ~/.config/nvim
2. VSCode settings: cp $BACKUP_DIR/vscode-backup/* "~/Library/Application Support/Code/User/"
3. Shell config: cp $BACKUP_DIR/.* ~/
EOF

echo ""
echo "🎉 Backup completed successfully!"
echo "📁 Backup location: $BACKUP_DIR"
echo "📄 Restoration commands saved in: $BACKUP_DIR/BACKUP_INFO.txt"
echo ""
```

#### Quick Backup (Minimal)

If you prefer individual commands:

```bash
# Backup Neovim configuration
cp -r ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)

# Backup VSCode settings (macOS)
cp "~/Library/Application Support/Code/User/settings.json" ~/vscode-settings.backup.$(date +%Y%m%d_%H%M%S).json
cp "~/Library/Application Support/Code/User/keybindings.json" ~/vscode-keybindings.backup.$(date +%Y%m%d_%H%M%S).json

# Linux VSCode backup
cp ~/.config/Code/User/settings.json ~/vscode-settings.backup.$(date +%Y%m%d_%H%M%S).json
cp ~/.config/Code/User/keybindings.json ~/vscode-keybindings.backup.$(date +%Y%m%d_%H%M%S).json

# Windows VSCode backup (in PowerShell/Command Prompt)
copy "%APPDATA%\Code\User\settings.json" "%USERPROFILE%\vscode-settings.backup.%date:~-4,4%%date:~-10,2%%date:~-7,2%.json"
copy "%APPDATA%\Code\User\keybindings.json" "%USERPROFILE%\vscode-keybindings.backup.%date:~-4,4%%date:~-10,2%%date:~-7,2%.json"
```

#### Verify Your Backups

```bash
# Check Neovim backup
ls -la ~/.config/nvim.backup*

# Check VSCode backups
ls -la ~/vscode-*.backup*

# Verify backup contents
echo "Neovim backup contents:"
ls ~/.config/nvim.backup*/

echo "\nVSCode backup verification:"
file ~/vscode-*.backup*.json
```

#### Recovery Instructions

**If something goes wrong, restore your backups:**

```bash
# Find your backups
ls -la ~/.config/nvim.backup*
ls -la ~/vscode-*.backup*

# Restore Neovim (replace TIMESTAMP with your backup timestamp)
rm -rf ~/.config/nvim
cp -r ~/.config/nvim.backup.TIMESTAMP ~/.config/nvim

# Restore VSCode settings (macOS)
cp ~/vscode-settings.backup.TIMESTAMP.json "~/Library/Application Support/Code/User/settings.json"
cp ~/vscode-keybindings.backup.TIMESTAMP.json "~/Library/Application Support/Code/User/keybindings.json"

# Restart VSCode to apply restored settings
```

### Prerequisites

```bash
# Install Neovim
brew install neovim  # macOS

# Install VSCode extensions
code --install-extension asvetliakov.vscode-neovim
code --install-extension ryuta46.multi-command
```

## 🔄 Setup Options

Choose the approach that best fits your current setup:

#### Option 1: Full Integration (Recommended)

**1. Backup your existing configuration:**

```bash
cp -r ~/.config/nvim ~/.config/nvim.backup
```

**2. Clone this repository:**

```bash
cd ~/.config
mv nvim nvim.old  # Move existing config
git clone <this-repo-url> nvim
cd nvim

# Initialize and update submodules for VSCode plugins
git submodule update --init --recursive
```

**3. Migrate your existing customizations:**

```bash
# Copy your existing LazyVim customizations
cp -r ~/.config/nvim.old/lua/plugins/* ~/.config/nvim/lua/plugins/ 2>/dev/null || true
cp ~/.config/nvim.old/lua/config/*.lua ~/.config/nvim/lua/config/ 2>/dev/null || true

# Merge any custom settings
cp ~/.config/nvim.old/lazy-lock.json ~/.config/nvim/ 2>/dev/null || true
```

#### Option 2: Minimal Integration (VSCode-only components)

If you want to keep your existing Neovim setup and only add VSCode support:

**1. Add conditional loading to your existing `init.lua`:**

```lua
-- Add this at the top of your existing ~/.config/nvim/init.lua
if vim.g.vscode then
    -- VSCode-specific setup

    -- Load VSCode plugins from pack directory
    vim.cmd('set packpath^=~/.config/nvim')

    -- Setup VSCode-specific plugins
    require("leap").set_default_mappings()
    require("nvim-surround").setup()

    -- Load VSCode-specific keymaps
    if pcall(require, "vscode-neovim.vscode_keymaps") then
        -- Keymaps loaded successfully
    else
        -- Fallback: create the file or use inline keymaps
        vim.g.mapleader = ' '
        local keymap = vim.keymap.set

        -- Essential VSCode keymaps
        keymap("n", "<leader>e", "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>")
        keymap("n", "<leader>p", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
        keymap("n", "<leader>w", "<cmd>lua require('vscode').action('workbench.action.files.save')<CR>")
        keymap("n", "<leader>h", "<cmd>lua require('vscode').action('workbench.action.navigateLeft')<CR>")
        keymap("n", "<leader>l", "<cmd>lua require('vscode').action('workbench.action.navigateRight')<CR>")
        -- Add more keymaps as needed
    end

    -- Don't load the rest of your config in VSCode
    return
end

-- Your existing Neovim configuration continues here...
-- (existing lazy.nvim setup, plugins, etc.)
```

**2. Add VSCode plugins as git submodules:**

```bash
cd ~/.config/nvim

# Create pack directory structure
mkdir -p pack/vscode-plugins/start

# Add plugins as submodules
git submodule add https://github.com/ggandor/leap.nvim.git pack/vscode-plugins/start/leap.nvim
git submodule add https://github.com/kylechui/nvim-surround.git pack/vscode-plugins/start/nvim-surround
git submodule add https://github.com/folke/flash.nvim.git pack/vscode-plugins/start/flash.nvim

# Initialize submodules
git submodule update --init --recursive
```

**3. Create VSCode-specific keymaps file:**

```bash
mkdir -p ~/.config/nvim/lua/vscode-neovim
```

Then copy the keymaps from this repository:

```bash
# Copy from this repo or create manually
cp <path-to-this-repo>/lua/vscode-neovim/vscode_keymaps.lua ~/.config/nvim/lua/vscode-neovim/
```

#### Option 3: Symlink Approach (Advanced)

For users who want to maintain separate configs but share VSCode components:

```bash
# Keep your main config
cd ~/.config
mv nvim nvim-main

# Clone this repo as nvim-vscode
git clone <this-repo-url> nvim-vscode
cd nvim-vscode
git submodule update --init --recursive

# Create hybrid config
mkdir nvim
cd nvim

# Symlink VSCode components from this repo
ln -s ../nvim-vscode/pack pack
ln -s ../nvim-vscode/lua/vscode-neovim lua/vscode-neovim

# Symlink your main config components
ln -s ../nvim-main/lua/config lua/config
ln -s ../nvim-main/lua/plugins lua/plugins
ln -s ../nvim-main/lazy-lock.json lazy-lock.json

# Create hybrid init.lua
cat > init.lua << 'EOF'
if vim.g.vscode then
    -- Load VSCode-specific setup
    require("leap").set_default_mappings()
    require("nvim-surround").setup()
    require("vscode-neovim.vscode_keymaps")
else
    -- Load main LazyVim config
    require("config.lazy")
end
EOF
```

## 🔧 VSCode Settings Integration

**Apply VSCode settings from companion repository:**

```bash
cd ~/repos
git clone https://github.com/jbb-codes/vscode-config.git vscode-settings
cd vscode-settings

# Copy settings (backup first!)
cp settings.json "~/Library/Application Support/Code/User/"
cp keybindings.json "~/Library/Application Support/Code/User/"
```

**Verify paths in VSCode settings:**

```json
{
  "vscode-neovim.neovimExecutablePaths.darwin": "/opt/homebrew/bin/nvim",
  "vscode-neovim.neovimInitVimPaths.darwin": "/Users/jarrenbess/.config/nvim/init.lua"
}
```

## 🧪 Testing

**Test standalone Neovim:**

```bash
nvim  # Should load normal LazyVim config
```

**Test VSCode integration:**

- Open VSCode with a file
- Try `Space + e` (toggle explorer)
- Try `Space + p` (quick open)
- Test Vim motions (`dw`, `ci"`, etc.)

## 🔑 Key Bindings (Space Leader)

```
<leader>h/j/k/l  -- Window navigation
<leader>e        -- File explorer
<leader>p        -- Quick open
<leader>w        -- Save file
<leader>q        -- Close editor
<leader>sr       -- Search/replace in file
<leader>ca       -- Code actions
<leader>cf       -- Format document
<leader>gg       -- Source control
K                -- Hover info
```

## ⚙️ Adding Custom Keymaps

Edit `lua/vscode-neovim/vscode_keymaps.lua`:

```lua
keymap("n", "<leader>custom",
  "<cmd>lua require('vscode').action('your.command')<CR>")
```

## 🐛 Troubleshooting

**VSCode not finding Neovim:**

```bash
# Verify installation
nvim --version

# Check path in VSCode settings
which nvim
```

**Keybindings not working:**

- Ensure vscode-neovim extension is enabled
- Check VSCode keybindings for conflicts
- Verify init.lua is loading correctly

**Plugins not loading:**

- Update git submodules: `git submodule update --init --recursive`
- Check VSCode Output panel for errors

---

_This configuration provides the best of both worlds: powerful Vim motions in VSCode and a full-featured Neovim setup for terminal use._
