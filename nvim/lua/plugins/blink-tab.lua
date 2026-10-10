-- Tab / Shift-Tab to cycle completion (like Ctrl-n / Ctrl-p)
-- Tab: next item top -> bottom, Shift-Tab: previous item bottom -> top.
-- Falls back to snippet jump / normal Tab when menu is not visible.
return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = {
          "select_next",
          LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
          "fallback",
        },
        ["<S-Tab>"] = {
          "select_prev",
          LazyVim.cmp.map({ "snippet_backward" }),
          "fallback",
        },
      },
      completion = {
        list = {
          selection = {
            -- Don't pre-select first item: menu opens with nothing
            -- selected, so 1st Tab selects item 1 (no skipping).
            preselect = false,
            auto_insert = true,
          },
        },
      },
    },
  },
}
