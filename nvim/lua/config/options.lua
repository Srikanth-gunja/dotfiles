-- Options are automatically loaded before lazy.nvim startup.
require("config.remote_clipboard").setup()

vim.opt.relativenumber = false
vim.g.autoformat = false

-- Don't show '"file" 10L, 123B' written message on save (this is what
-- was spamming the bottom-right via noice/snacks notification popups)
vim.opt.shortmess:append("W")
-- Belt and suspenders: don't report :w yank/delete counts either
vim.opt.report = 9999
-- Hide the empty command-line row below lualine when idle (0 = no extra bar)
vim.opt.cmdheight = 0
