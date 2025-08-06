local keymap = vim.keymap.set
local opt = vim.opt

-- Set leader key
vim.g.mapleader = ' '

-- General
-- keymap('n', '<leader>c', '<cmd>e ~/.config/nvim/init.lua<cr>') -- Open Neovim config
keymap('n', 'U', '<C-r>') -- Redo
keymap('n', '<Esc>', ':nohlsearch<cr>') -- Clear search highlight

-- Option settings
opt.clipboard = 'unnamedplus' -- Sync system clipboard
opt.ignorecase = true -- Ignore case in search
opt.smartcase = true -- Override ignorecase if search has uppercase

-- <leader>, : Show all open editors in the current group
keymap("n", "<leader>,", "<cmd>lua require('vscode').action('workbench.action.showAllEditors')<CR>")

-- <leader>h : Move focus to the editor group to the left
keymap("n", "<leader>h", "<cmd>lua require('vscode').action('workbench.action.navigateLeft')<CR>")

-- <leader>j : Move focus to the editor group below
keymap("n", "<leader>j", "<cmd>lua require('vscode').action('workbench.action.navigateDown')<CR>")

-- <leader>k : Move focus to the editor group above
keymap("n", "<leader>k", "<cmd>lua require('vscode').action('workbench.action.navigateUp')<CR>")

-- <leader>l : Move focus to the editor group to the right
keymap("n", "<leader>l", "<cmd>lua require('vscode').action('workbench.action.navigateRight')<CR>")

-- <leader>p : Open the Quick Open file search (Ctrl+P)
keymap("n", "<leader>p", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")

-- <leader>e : Show and focus the Explorer in the primary sidebar
keymap("n", "<leader>e", "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>")

keymap("n", "<leader>a", "<cmd>lua require('vscode').action('workbench.action.toggleAuxiliaryBar')<CR>")

-- <leader>ab : Toggle the Activity Bar (the vertical icon bar on the far left)
keymap("n", "<leader>ab", "<cmd>lua require('vscode').action('workbench.action.toggleActivityBarVisibility')<CR>")

-- <leader>cp : Open the Command Palette (F1 or Cmd+Shift+P)
keymap("n", "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")

-- <leader>z : Toggle Zen Mode (distraction-free mode)
keymap("n", "<leader>z", "<cmd>lua require('vscode').action('workbench.action.toggleZenMode')<CR>")

-- <leader>wa : Emmet - Wrap with Abbreviation (in normal and visual mode)
keymap({"n", "v"}, "<leader>wa", "<cmd>lua require('vscode').action('editor.emmet.action.wrapWithAbbreviation')<CR>")

-- <leader>/ : Split the current editor vertically
keymap("n", "<leader>/", "<cmd>lua require('vscode').action('workbench.action.splitEditor')<CR>")

-- <leader>q : Close the current focused editor and focus remaining editor
keymap("n", "<leader>q", function()
  require('vscode').action('workbench.action.closeActiveEditor')
  vim.defer_fn(function()
    require('vscode').action('workbench.action.focusActiveEditorGroup')
  end, 50)
end)

-- <leader>w : Save the current file
keymap("n", "<leader>w", "<cmd>lua require('vscode').action('workbench.action.files.save')<CR>")

-- <leader>W : Save all files
keymap("n", "<leader>W", "<cmd>lua require('vscode').action('workbench.action.files.saveAll')<CR>")

-- <leader>cc : Focus the Copilot Chat panel
keymap("n", "<leader>cc", "<cmd>lua require('vscode').action('workbench.panel.chat.view.copilot.focus')<CR>")

-- <leader>1-9 : Go to specific buffer/tab by position
keymap("n", "<leader>1", "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex1')<CR>")
keymap("n", "<leader>2", "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex2')<CR>")
keymap("n", "<leader>3", "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex3')<CR>")
keymap("n", "<leader>4", "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex4')<CR>")
keymap("n", "<leader>5", "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex5')<CR>")
keymap("n", "<leader>6", "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex6')<CR>")
keymap("n", "<leader>7", "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex7')<CR>")
keymap("n", "<leader>8", "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex8')<CR>")
keymap("n", "<leader>9", "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex9')<CR>")

-- Search and Replace (LazyVim style)
-- <leader>sr : Search and replace in current file
keymap("n", "<leader>sr", "<cmd>lua require('vscode').action('editor.action.startFindReplaceAction')<CR>")

-- <leader>sR : Search and replace in workspace
keymap("n", "<leader>sR", "<cmd>lua require('vscode').action('workbench.action.replaceInFiles')<CR>")

-- <leader>ss : Search in current file
keymap("n", "<leader>ss", "<cmd>lua require('vscode').action('actions.find')<CR>")

-- K : Show hover information
keymap("n", "K", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")

-- <leader>ca : Code actions
keymap({"n", "v"}, "<leader>ca", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")

-- <leader>cf : Format document
keymap("n", "<leader>cf", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")

-- Window/Split Management (LazyVim style)
-- <leader>- : Split window horizontally
keymap("n", "<leader>-", "<cmd>lua require('vscode').action('workbench.action.splitEditorDown')<CR>")

-- <leader>| : Split window vertically
keymap("n", "<leader>|", "<cmd>lua require('vscode').action('workbench.action.splitEditor')<CR>")

-- <leader>wd : Close current split/window
keymap("n", "<leader>wd", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>")

-- <leader>ww : Switch between splits/windows
keymap("n", "<leader>ww", "<cmd>lua require('vscode').action('workbench.action.navigateEditorGroups')<CR>")

-- Git/Version Control
-- <leader>gg : Open source control panel
keymap("n", "<leader>gg", "<cmd>lua require('vscode').action('workbench.view.scm')<CR>")

-- <leader>gb : Git blame toggle
keymap("n", "<leader>gb", "<cmd>lua require('vscode').action('gitlens.toggleFileBlame')<CR>")

-- <leader>gd : Git diff current file
keymap("n", "<leader>gd", "<cmd>lua require('vscode').action('git.openChange')<CR>")

-- <leader>gs : Git status
keymap("n", "<leader>gs", "<cmd>lua require('vscode').action('git.openChange')<CR>")

-- ]h : Next git hunk/change
keymap("n", "]h", "<cmd>lua require('vscode').action('workbench.action.editor.nextChange')<CR>")

-- [h : Previous git hunk/change
keymap("n", "[h", "<cmd>lua require('vscode').action('workbench.action.editor.previousChange')<CR>")

-- Quick Actions & Utilities
-- <leader>fn : Create new file
keymap("n", "<leader>fn", "<cmd>lua require('vscode').action('explorer.newFile')<CR>")

-- <leader>fd : Create new folder
keymap("n", "<leader>fd", "<cmd>lua require('vscode').action('explorer.newFolder')<CR>")

-- <leader>fr : Reveal file in Explorer
keymap("n", "<leader>fr", "<cmd>lua require('vscode').action('revealFileInOS')<CR>")

-- <leader>fc : Copy file path
keymap("n", "<leader>fc", "<cmd>lua require('vscode').action('copyFilePath')<CR>")

-- <leader>fC : Copy relative file path
keymap("n", "<leader>fC", "<cmd>lua require('vscode').action('copyRelativeFilePath')<CR>")

-- Text Manipulation (common Vim patterns)
-- J/K : Move lines up/down in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")


-- Clipboard & Selection helpers
-- <leader>d : Delete without yanking
keymap({"n", "v"}, "<leader>d", '"_d')

-- Quick Symbol Navigation
-- <leader>o : Go to symbol in file (@)
keymap("n", "<leader>@", "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>")

-- <leader>O : Go to symbol in workspace (#)
keymap("n", "<leader>#", "<cmd>lua require('vscode').action('workbench.action.showAllSymbols')<CR>")

-- <leader>fs : Search project symbols (#)
keymap("n", "<leader>fs", "<cmd>lua require('vscode').action('workbench.action.showAllSymbols')<CR>")

-- Telescope-style Additional Pickers
-- <leader>ff : Find files (same as <leader>p but more explicit)
keymap("n", "<leader>ff", "<cmd>lua require('vscode').action('extension.fuzzySearch')<CR>")

-- <leader>fg : Live grep / find in files
keymap("n", "<leader>fg", "<cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>")
