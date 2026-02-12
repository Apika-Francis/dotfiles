-- =============================================================================
--  VISUAL SETTINGS
-- =============================================================================

-- Resets the cursor to a block. Helps prevent issues where the cursor
-- disappears or looks wrong in some terminals/TMUX.
vim.opt.guicursor = ""

-- Enable line numbers (nu) and relative line numbers (relativenumber).
-- This shows "42" on your current line, but "1, 2, 3" on lines above/below.
-- Great for calculating jumps (e.g., "delete 10 lines down" -> d10j).
vim.opt.nu = true
vim.opt.relativenumber = true

-- Disable line wrapping.
-- Long lines will run off the screen instead of continuing on the next line.
vim.opt.wrap = false

-- Highlights the column at 80 characters.
-- Acts as a visual guide to help you keep code lines short.
vim.opt.colorcolumn = "80"

-- Enables 24-bit RGB color in the terminal (needed for most modern themes).
vim.opt.termguicolors = true

-- Always show the sign column (the gutter on the left).
-- Prevents the text from shifting sideways when a git sign or error icon appears.
vim.opt.signcolumn = "yes"

-- =============================================================================
--  INDENTATION (4 SPACES)
-- =============================================================================

-- A visual Tab looks like 4 spaces.
vim.opt.tabstop = 4

-- Pressing Tab inserts 4 spaces (soft indentation).
vim.opt.softtabstop = 4

-- Indentation commands (>> or auto-indent) move text by 4 spaces.
vim.opt.shiftwidth = 4

-- Converts physical Tab keystrokes into Space characters.
vim.opt.expandtab = true

-- Smart Indent: Tries to guess indentation (e.g., indenting after `{`).
vim.opt.smartindent = true

-- =============================================================================
--  FILE MANAGEMENT & UNDO
-- =============================================================================

-- Disable swap files and backups (prevents clutter like .swp or file~).
vim.opt.swapfile = false
vim.opt.backup = false

-- Persistent Undo: Saves your undo history to a file.
-- You can undo changes even after closing and reopening a file.
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- =============================================================================
--  SEARCH BEHAVIOR
-- =============================================================================

-- Don't keep search matches highlighted after you're done (hlsearch = false).
-- (Note: 'incsearch' still highlights matches *while* you type).
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- =============================================================================
--  SCROLLING & UI
-- =============================================================================

-- Keep 8 lines of context above and below the cursor when scrolling.
-- Ensures you never type at the very edge of the screen.
vim.opt.scrolloff = 8

-- Faster update time (50ms).
-- Helps plugins trigger events faster (like highlighting the current word).
vim.opt.updatetime = 50

-- Allows the "@" character to be part of a filename.
-- Useful for jumping to files in web development (e.g. @components/Button).
vim.opt.isfname:append("@-@")
