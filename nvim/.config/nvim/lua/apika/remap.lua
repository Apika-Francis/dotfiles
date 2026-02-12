-- =============================================================================
--  CORE SETTINGS
-- =============================================================================

-- Sets the "Leader" key to Space. This is the prefix for many custom commands below.
vim.g.mapleader = " "

-- Space + pv: Opens the Netrw file explorer in the current directory.
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- =============================================================================
--  NAVIGATION & SCROLLING
-- =============================================================================

-- Ctrl + d: Scroll down half a page and center the cursor (zz).
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Ctrl + u: Scroll up half a page and center the cursor (zz).
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- n: Go to next search result, center it (zz), and open folds if needed (zv).
vim.keymap.set("n", "n", "nzzzv")

-- N: Go to previous search result, center it, and open folds.
vim.keymap.set("n", "N", "Nzzzv")

-- =============================================================================
--  TEXT MANIPULATION (MOVES & EDITS)
-- =============================================================================

-- Visual Mode J: Move selected lines DOWN one line.
-- Also re-indents the code automatically (=gv).
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Visual Mode K: Move selected lines UP one line.
-- Also re-indents the code automatically (=gv).
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Normal Mode J: Joins the line below to the current line.
-- Unlike standard Vim, this keeps the cursor in place (mz...`z) instead of moving it to the end.
vim.keymap.set("n", "J", "mzJ`z")

-- Indent Code: Keeps the visual selection active after indenting so you can do it multiple times.
vim.keymap.set("n", "=ap", "ma=ap'a")

-- =============================================================================
--  CLIPBOARD MAGIC (COPY & PASTE)
-- =============================================================================

-- Space + p (Visual Mode): "Paste without losing copy".
-- Deletes selected text into the void register ("_d) then pastes (P).
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Space + y: Yanks (copies) to the SYSTEM clipboard ("+y).
-- This lets you paste code into your browser/slack/etc.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- Same for capital Y (copy line)

-- Space + d: Deletes to the void register.
-- This deletes text *without* overwriting your current clipboard.
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- =============================================================================
--  SEARCH & REPLACE
-- =============================================================================

-- Space + s: Search and Replace the word under the cursor.
-- It pre-fills the command line so you just type the new word and hit Enter.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- =============================================================================
--  MISCELLANEOUS UTILITIES
-- =============================================================================

-- Space + x: Makes the current file executable (chmod +x).
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Ctrl + c: Maps Ctrl+C to Escape (Standardizes behavior to avoid plugin issues).
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Q: Disables "Ex mode" (which is rarely used and easy to trigger accidentally).
vim.keymap.set("n", "Q", "<nop>")

-- Space + Space: Sources (reloads) the current configuration file.
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- Space + zig: Restarts the Language Server (LSP).
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- =============================================================================
--  QUICKFIX NAVIGATION
-- =============================================================================

-- Ctrl + k / j: Jump to next/previous item in the Quickfix list.
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Space + k / j: Jump to next/previous item in the Location list.
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
