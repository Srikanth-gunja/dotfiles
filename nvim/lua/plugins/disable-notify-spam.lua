-- Kills the bottom-right notification spam (e.g. repeated
-- '"~/Projects/.../data_types.go" 10L, 123B' popups on every save).
-- With this + shortmess+=W in options.lua, saving a file shows nothing.
return {
  -- LazyVim routes :w messages to a bottom-right popup via snacks notifier.
  -- Turn it off completely: no popups, ever.
  {
    "folke/snacks.nvim",
    opts = {
      notifier = { enabled = false },
    },
  },
  -- noice.nvim also mirrors Vim messages (written, yanks, etc.) into
  -- mini/notify views at the bottom-right. Disable it so messages stay
  -- on the classic cmdline (which we already silence with shortmess W).
  { "folke/noice.nvim", enabled = false },
  -- In case nvim-notify is still pulled in by something else, kill it too.
  { "rcarriga/nvim-notify", enabled = false },
}
