if vim.g.vscode then
    -- Mini plugins setup
    -- require("vscode-plugins.mini")
    -- require("mini.surround").setup()

   -- Leap setup
    require("leap").set_default_mappings()

   -- Surround setup
    require("nvim-surround").setup()

    -- VSCode neovim keymaps
    require("vscode-neovim.vscode_keymaps")
else
    -- Ordinary Neovim
    -- bootstrap lazy.nvim, LazyVim and your plugins
    require("config.lazy")
end
