-- Ensure treesitter parsers for languages LazyVim doesn't ship by default.
-- Without these, files fall back to Vim regex syntax: user identifiers get no
-- @variable/@type captures and render as grey Normal text instead of white.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "go", "gomod", "gosum", "gowork" },
    },
  },
}
