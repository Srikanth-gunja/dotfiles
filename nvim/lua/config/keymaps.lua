-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "n", "v" }, "<A-d>", '"_d', { desc = "Delete without yanking (black hole)" })
vim.keymap.set({ "n", "v" }, "<A-c>", '"_c', { desc = "Cut without yanking (black hole)" })

-- Ctrl+T: toggle floating terminal (root dir), in normal AND terminal mode
vim.keymap.set({ "n", "t" }, "<C-t>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Toggle Terminal (Root Dir)" })

-- Tab / Shift-Tab: cycle native popup menu (Ctrl-n / Ctrl-p behavior).
-- This covers vim's built-in completion when blink.cmp is not showing.
-- blink.cmp handles its own menu via lua/plugins/blink-tab.lua and falls
-- back to these mappings when its menu is hidden.
vim.keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, desc = "Next completion item (or Tab)" })
vim.keymap.set("i", "<S-Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true, desc = "Prev completion item (or Shift-Tab)" })

-- %: select whole file (overrides match-bracket jump)
vim.keymap.set({ "n", "x" }, "%", "<Cmd>keepjumps normal! ggVG<CR>", { desc = "Select whole file" })

-- Helix-style line selection (overrides delete-char x / backspace X):
-- x selects current line, repeat extends downward; X extends upward
vim.keymap.set("n", "x", "V", { desc = "Select line (x again extends down)" })
vim.keymap.set("n", "X", "V", { desc = "Select line (X again extends up)" })
vim.keymap.set("x", "x", "j", { desc = "Extend line selection downward" })
vim.keymap.set("x", "X", "k", { desc = "Extend line selection upward" })

-- Helix-style line ends: gh = start of line, gl = end of line
vim.keymap.set({ "n", "x", "o" }, "gh", "^", { desc = "Start of line" })
vim.keymap.set({ "n", "x", "o" }, "gl", "$", { desc = "End of line" })
