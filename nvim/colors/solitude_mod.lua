-- solitude_mod for Neovim — port of Helix `solitude_mod` (vis `nvim` / ashen).
-- Palette (from ~/.config/vis/themes/nvim.lua + ~/.config/helix/themes/solitude_mod.toml):
--   bg #101315   text #B4B4B4   bright #E5E5E5   comment #737373
--   orange #C4693D   red #DF6464   dark red #B14242   error red #C53030
--   teal #4A8B8B   yellow #E5A72A   grey #949494   operator #E0E2EA
--   extra UI: selection #323232  elevated #535353  cursorline #212121
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "solitude_mod"
vim.o.background = "dark"
vim.o.termguicolors = true

local p = {
  bg = "#101315",
  text = "#B4B4B4",
  bright = "#E5E5E5",
  ident = "#FFFFFF", -- pure white for non-bold identifiers (types, fields, vars, funcs)
  comment = "#737373",
  orange = "#C4693D",
  red = "#DF6464",
  darkred = "#B14242",
  error = "#C53030",
  teal = "#4A8B8B",
  yellow = "#E5A72A",
  grey = "#949494",
  operator = "#E0E2EA",
  sel = "#323232",
  elevated = "#535353",
  cursorline = "#212121",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ========== Base / UI (helix ui.*) ==========
hl("Normal", { fg = p.text, bg = p.bg })
hl("NormalNC", { fg = p.text, bg = p.bg })
hl("NormalFloat", { fg = p.text, bg = p.bg })
hl("FloatBorder", { fg = p.elevated, bg = p.bg })
hl("FloatTitle", { fg = p.bright, bg = p.bg, bold = true })
hl("EndOfBuffer", { fg = p.elevated, bg = p.bg }) -- FIX: brighter ~ like Helix
hl("SignColumn", { fg = p.text, bg = p.bg })
hl("FoldColumn", { fg = p.comment, bg = p.bg })
hl("Folded", { fg = p.comment, bg = p.bg })
hl("Conceal", { fg = p.grey })
hl("NonText", { fg = p.sel })
hl("Whitespace", { fg = p.elevated })
hl("SpecialKey", { fg = p.elevated })
hl("VertSplit", { fg = p.elevated })
hl("WinSeparator", { fg = p.elevated, bg = p.bg })
hl("WinBar", { fg = p.comment, bg = p.bg })
hl("WinBarNC", { fg = p.comment, bg = p.bg })

-- Cursor (helix ui.cursor*) — normal #737373, insert #E5E5E5, select #4A8B8B
hl("Cursor", { fg = p.bg, bg = p.comment })
hl("lCursor", { fg = p.bg, bg = p.comment })
hl("CursorIM", { fg = p.bg, bg = p.bright })
hl("TermCursor", { fg = p.bg, bg = p.bright })
-- matched bracket (helix ui.cursor.match)
hl("MatchParen", { fg = p.yellow, bold = true })

-- Line numbers (helix ui.linenr*)
hl("LineNr", { fg = p.sel, bg = p.bg })
hl("LineNrAbove", { fg = p.sel, bg = p.bg })
hl("LineNrBelow", { fg = p.sel, bg = p.bg })
hl("CursorLineNr", { fg = p.comment, bg = p.bg, bold = true })

-- Cursor line / highlight
-- FIX: Helix screenshot shows no cursorline band, so clear it
hl("CursorLine", {})
hl("CursorColumn", { bg = p.cursorline })
hl("ColorColumn", { bg = p.cursorline })

-- Selection (helix ui.selection)
hl("Visual", { bg = p.sel })
hl("VisualNOS", { bg = p.sel })
hl("Search", { bg = p.cursorline, bold = true })
hl("IncSearch", { fg = p.bg, bg = p.bright, bold = true })
hl("CurSearch", { fg = p.bg, bg = p.bright, bold = true })
hl("Substitute", { fg = p.bg, bg = p.yellow, bold = true })

-- Statusline (helix ui.statusline*)
hl("StatusLine", { fg = p.grey, bg = p.sel })
hl("StatusLineNC", { fg = p.grey, bg = p.sel })
-- mode colors: normal bright-on-elevated, insert inverted, visual/select teal
hl("ModeMsg", { fg = p.bright, bg = p.elevated, bold = true })
hl("MsgArea", { fg = p.text, bg = p.sel })

-- Popup / menu (helix ui.popup, ui.menu*)
hl("Pmenu", { fg = p.text, bg = p.bg })
hl("PmenuSel", { fg = p.bright, bg = p.elevated, bold = true })
hl("PmenuSbar", { bg = p.sel })
hl("PmenuThumb", { bg = p.elevated })
hl("PmenuKind", { fg = p.teal })
hl("PmenuKindSel", { fg = p.teal, bg = p.elevated, bold = true })
hl("PmenuExtra", { fg = p.comment })
hl("PmenuExtraSel", { fg = p.comment, bg = p.elevated })
hl("WildMenu", { fg = p.bright, bg = p.elevated, bold = true })
hl("Question", { fg = p.teal, bold = true })
hl("MoreMsg", { fg = p.teal, bold = true })

-- Tabline / bufferline (helix ui.bufferline*)
hl("TabLine", { fg = p.comment, bg = p.bg })
hl("TabLineFill", { fg = p.comment, bg = p.bg })
hl("TabLineSel", { fg = p.bright, bg = p.sel, bold = true })
hl("BufferLineFill", { fg = p.comment, bg = p.bg })
hl("BufferLineBackground", { fg = p.comment, bg = p.bg })
hl("BufferLineBufferSelected", { fg = p.bright, bg = p.sel, bold = true })

-- Miscellaneous UI
hl("Directory", { fg = p.teal, bold = true }) -- helix ui.text.directory
hl("Title", { fg = p.bright, bold = true }) -- helix markup.heading
hl("ErrorMsg", { fg = p.error, bold = true })
hl("WarningMsg", { fg = p.yellow, bold = true })
hl("InfoMsg", { fg = p.teal })
hl("HintMsg", { fg = p.grey })
hl("healthError", { fg = p.error })
hl("healthSuccess", { fg = p.teal })
hl("healthWarning", { fg = p.yellow })

-- ========== Syntax (classic groups, vis-mapped) ==========
hl("Comment", { fg = p.comment }) -- vis STYLE_COMMENT
hl("String", { fg = p.red }) -- vis STYLE_STRING
hl("Character", { fg = p.red })
hl("Number", { fg = p.orange }) -- vis STYLE_NUMBER
hl("Float", { fg = p.orange })
hl("Boolean", { fg = p.teal, bold = true }) -- helix constant.builtin.boolean
hl("Constant", { fg = p.orange, bold = true }) -- vis STYLE_CONSTANT
hl("Identifier", { fg = p.ident }) -- vis STYLE_IDENTIFIER
hl("Function", { fg = p.ident }) -- vis STYLE_FUNCTION
hl("Statement", { fg = p.bright, bold = true })
hl("Conditional", { fg = p.bright, bold = true })
hl("Repeat", { fg = p.bright, bold = true })
hl("Label", { fg = p.ident })
hl("Operator", { fg = p.operator }) -- vis STYLE_OPERATOR
hl("Keyword", { fg = p.bright, bold = true }) -- vis STYLE_KEYWORD
hl("Exception", { fg = p.bright, bold = true })
hl("PreProc", { fg = p.darkred, bold = true }) -- vis STYLE_PREPROCESSOR
hl("Include", { fg = p.darkred, bold = true })
hl("Define", { fg = p.darkred, bold = true })
hl("Macro", { fg = p.darkred, bold = true }) -- helix function.macro
hl("PreCondit", { fg = p.darkred, bold = true })
hl("Type", { fg = p.orange, bold = true }) -- vis STYLE_TYPE (builtin); user types overridden below via TS
hl("StorageClass", { fg = p.bright, bold = true })
hl("Structure", { fg = p.ident })
hl("Typedef", { fg = p.bright, bold = true })
hl("Special", { fg = p.grey })
hl("SpecialChar", { fg = p.darkred, bold = true }) -- helix constant.character.escape
hl("SpecialComment", { fg = p.comment })
hl("Delimiter", { fg = p.text })
hl("Debug", { fg = p.error })
hl("Todo", { fg = p.yellow, bold = true })
hl("Error", { fg = p.error, bold = true })
hl("Underlined", { underline = true })
hl("Bold", { bold = true })
hl("Italic", { italic = true })

-- ========== Tree-sitter (helix scopes -> @ captures) ==========
-- Keywords: bold bright, every language
hl("@keyword", { fg = p.bright, bold = true })
hl("@keyword.conditional", { fg = p.bright, bold = true })
hl("@keyword.repeat", { fg = p.bright, bold = true })
hl("@keyword.import", { fg = p.bright, bold = true })
hl("@keyword.return", { fg = p.bright, bold = true })
hl("@keyword.exception", { fg = p.bright, bold = true })
hl("@keyword.operator", { fg = p.bright, bold = true })
hl("@keyword.function", { fg = p.bright, bold = true })
hl("@keyword.storage", { fg = p.bright, bold = true })
hl("@keyword.storage.type", { fg = p.bright, bold = true })
hl("@keyword.storage.modifier", { fg = p.bright, bold = true })
hl("@keyword.type", { fg = p.bright, bold = true })
hl("@keyword.modifier", { fg = p.bright, bold = true })
hl("@keyword.coroutine", { fg = p.bright, bold = true })
hl("@keyword.directive", { fg = p.darkred, bold = true })
hl("@keyword.debug", { fg = p.darkred, bold = true })

-- Functions: plain bright; macros dark-red bold
hl("@function", { fg = p.ident })
hl("@function.builtin", { fg = p.ident })
hl("@function.call", { fg = p.ident })
hl("@function.method", { fg = p.ident })
hl("@function.method.call", { fg = p.ident })
hl("@function.special", { fg = p.ident }) -- helix function.special
hl("@function.macro", { fg = p.darkred, bold = true })
hl("@method", { fg = p.ident }) -- legacy alias of @function.method
hl("@method.call", { fg = p.ident })
hl("@constructor", { fg = p.ident })

-- Types: builtin bold orange, user white
hl("@type", { fg = p.ident })
hl("@type.builtin", { fg = p.orange, bold = true })
hl("@type.definition", { fg = p.ident })
hl("@type.parameter", { fg = p.ident }) -- helix type.parameter
hl("@type.enum", { fg = p.ident }) -- helix type.enum
hl("@type.enum.variant", { fg = p.ident }) -- helix type.enum.variant
hl("@type.qualifier", { fg = p.bright, bold = true })
hl("@storageclass", { fg = p.bright, bold = true })
hl("@structure", { fg = p.ident })
hl("@namespace", { fg = p.ident })
hl("@namespace.builtin", { fg = p.ident })
hl("@module", { fg = p.ident })

-- Constants / numbers
hl("@constant", { fg = p.orange, bold = true })
hl("@constant.builtin", { fg = p.teal, bold = true })
hl("@constant.macro", { fg = p.darkred, bold = true })
hl("@boolean", { fg = p.teal, bold = true })
hl("@number", { fg = p.orange })
hl("@number.float", { fg = p.orange })
hl("@character", { fg = p.red })
hl("@character.special", { fg = p.darkred, bold = true })

-- Strings: red
hl("@string", { fg = p.red })
hl("@string.regexp", { fg = p.red })
hl("@string.escape", { fg = p.darkred, bold = true })
hl("@string.special", { fg = p.red })
hl("@string.special.path", { fg = p.red })
hl("@string.special.url", { fg = p.red }) -- helix: red, NO underline (gopls "fmt" links)
hl("@string.special.symbol", { fg = p.red })
hl("@string.regex", { fg = p.red }) -- nvim name for helix string.regexp

-- Comments
hl("@comment", { fg = p.comment })
hl("@comment.documentation", { fg = p.comment })
hl("@comment.error", { fg = p.error, bold = true })
hl("@comment.warning", { fg = p.yellow, bold = true })
hl("@comment.todo", { fg = p.yellow, bold = true })
hl("@comment.note", { fg = p.teal, bold = true })

-- Variables / identifiers: bright (vis STYLE_IDENTIFIER)
hl("@variable", { fg = p.ident })
hl("@variable.builtin", { fg = p.ident })
hl("@variable.parameter", { fg = p.ident })
hl("@variable.parameter.builtin", { fg = p.ident })
hl("@variable.member", { fg = p.ident })
hl("@property", { fg = p.ident })
hl("@field", { fg = p.ident })

-- Misc syntax
hl("@label", { fg = p.ident })
hl("@attribute", { fg = p.teal, bold = true })
hl("@tag", { fg = p.error, bold = true })
hl("@tag.attribute", { fg = p.teal, bold = true })
hl("@tag.delimiter", { fg = p.text })
hl("@operator", { fg = p.operator })
hl("@punctuation", { fg = p.text }) -- helix punctuation
hl("@punctuation.delimiter", { fg = p.text })
hl("@punctuation.bracket", { fg = p.text })
hl("@punctuation.special", { fg = p.grey })
hl("@symbol", { fg = p.red })
hl("@annotation", { fg = p.teal, bold = true })
hl("@special", { fg = p.grey }) -- helix special
hl("@debug", { fg = p.darkred, bold = true })
hl("@define", { fg = p.darkred, bold = true })
hl("@macro", { fg = p.darkred, bold = true })
hl("@preproc", { fg = p.darkred, bold = true })
hl("@conditional", { fg = p.bright, bold = true }) -- legacy: helix keyword.control.conditional
hl("@repeat", { fg = p.bright, bold = true }) -- legacy: helix keyword.control.repeat
hl("@exception", { fg = p.bright, bold = true }) -- legacy: helix keyword.control.exception
hl("@include", { fg = p.bright, bold = true }) -- legacy: helix keyword.control.import (NOT darkred)
hl("@parameter", { fg = p.ident }) -- legacy: helix variable.parameter

-- Markup
hl("@markup.heading", { fg = p.bright, bold = true })
hl("@markup.heading.1", { fg = p.bright, bold = true })
hl("@markup.heading.2", { fg = p.bright, bold = true })
hl("@markup.heading.3", { fg = p.bright, bold = true })
hl("@markup.heading.4", { fg = p.bright, bold = true })
hl("@markup.heading.5", { fg = p.bright, bold = true })
hl("@markup.heading.6", { fg = p.bright, bold = true })
hl("@markup.list", { fg = p.grey })
hl("@markup.list.checked", { fg = p.teal })
hl("@markup.list.unchecked", { fg = p.elevated })
hl("@markup.strong", { bold = true })
hl("@markup.italic", { italic = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.underline", { underline = true })
hl("@markup.link", { fg = p.teal })
hl("@markup.link.label", { fg = p.teal })
hl("@markup.link.url", { fg = p.red })
hl("@markup.raw", { fg = p.red })
hl("@markup.quote", { fg = p.grey })
hl("@markup.math", { fg = p.orange })
hl("@markup.environment", { fg = p.orange, bold = true })
hl("@markup.bold", { bold = true }) -- nvim alias of helix markup.bold
hl("@text.title", { fg = p.bright, bold = true }) -- legacy: markup.heading
hl("@text.literal", { fg = p.red }) -- legacy: markup.raw
hl("@text.uri", { fg = p.red }) -- legacy: markup.link.url (no underline, per helix)
hl("@text.reference", { fg = p.teal }) -- legacy: markup.link
hl("@text.todo", { fg = p.yellow, bold = true })
hl("@text.underline", { underline = true })
hl("@text.warning", { fg = p.yellow, bold = true })
hl("@text.danger", { fg = p.error, bold = true })

-- Diff (helix diff.*)
hl("DiffAdd", { fg = p.teal })
hl("DiffDelete", { fg = p.error })
hl("DiffChange", { fg = p.yellow })
hl("DiffText", { fg = p.yellow, bold = true })
hl("Added", { fg = p.teal })
hl("Removed", { fg = p.error })
hl("Changed", { fg = p.yellow })
hl("@diff.plus", { fg = p.teal })
hl("@diff.minus", { fg = p.error })
hl("@diff.delta", { fg = p.yellow })
hl("diffAdded", { fg = p.teal })
hl("diffRemoved", { fg = p.error })
hl("diffChanged", { fg = p.yellow })
hl("diffFile", { fg = p.teal, bold = true })
hl("diffNewFile", { fg = p.teal, bold = true })
hl("diffLine", { fg = p.yellow })
hl("diffIndexLine", { fg = p.comment })

-- ========== Diagnostics (helix diagnostic.* + error/warning/info/hint) ==========
hl("DiagnosticError", { fg = p.error })
hl("DiagnosticWarn", { fg = p.yellow })
hl("DiagnosticInfo", { fg = p.teal })
hl("DiagnosticHint", { fg = p.grey })
hl("DiagnosticOk", { fg = p.teal })
hl("DiagnosticUnderlineError", { sp = p.error, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = p.yellow, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = p.teal, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = p.grey, undercurl = true })
hl("DiagnosticUnderlineOk", { sp = p.teal, undercurl = true })
hl("DiagnosticVirtualTextError", { fg = p.error })
hl("DiagnosticVirtualTextWarn", { fg = p.yellow })
hl("DiagnosticVirtualTextInfo", { fg = p.teal })
hl("DiagnosticVirtualTextHint", { fg = p.grey })
hl("DiagnosticFloatingError", { fg = p.error })
hl("DiagnosticFloatingWarn", { fg = p.yellow })
hl("DiagnosticFloatingInfo", { fg = p.teal })
hl("DiagnosticFloatingHint", { fg = p.grey })
hl("DiagnosticSignError", { fg = p.error })
hl("DiagnosticSignWarn", { fg = p.yellow })
hl("DiagnosticSignInfo", { fg = p.teal })
hl("DiagnosticSignHint", { fg = p.grey })
hl("DiagnosticDeprecated", { strikethrough = true })
hl("DiagnosticUnnecessary", {}) -- helix diagnostic.unnecessary = {} (normal brightness)
hl("ErrorText", { fg = p.error })
hl("WarningText", { fg = p.yellow })
hl("InfoText", { fg = p.teal })
hl("HintText", { fg = p.grey })

-- Spelling (reuse diagnostic curl colors)
hl("SpellBad", { sp = p.error, undercurl = true })
hl("SpellCap", { sp = p.yellow, undercurl = true })
hl("SpellLocal", { sp = p.teal, undercurl = true })
hl("SpellRare", { sp = p.grey, undercurl = true })

-- LSP / inlay
hl("LspReferenceText", { bg = p.cursorline, bold = true })
hl("LspReferenceRead", { bg = p.cursorline, bold = true })
hl("LspReferenceWrite", { bg = p.cursorline, bold = true })
hl("LspSignatureActiveParameter", { fg = p.bright, bold = true })
hl("LspInlayHint", { fg = p.comment })
hl("LspCodeLens", { fg = p.comment })
hl("LspCodeLensSeparator", { fg = p.elevated })

-- ========== Git / signs / indent ==========
hl("GitSignsAdd", { fg = p.teal })
hl("GitSignsChange", { fg = p.yellow })
hl("GitSignsDelete", { fg = p.error })
hl("GitSignsCurrentLineBlame", { fg = p.comment })
hl("SignColumnSB", { fg = p.text, bg = p.bg })
hl("IblIndent", { fg = p.sel })
hl("IblScope", { fg = p.elevated })
hl("IndentBlanklineChar", { fg = p.sel })
hl("IndentBlanklineContextChar", { fg = p.elevated })

-- ========== Completion / snippets ==========
hl("CmpItemAbbr", { fg = p.text })
hl("CmpItemAbbrMatch", { fg = p.bright, bold = true })
hl("CmpItemAbbrMatchFuzzy", { fg = p.bright, bold = true })
hl("CmpItemKind", { fg = p.teal })
hl("CmpItemMenu", { fg = p.comment })
hl("BlinkCmpMenu", { fg = p.text, bg = p.bg })
hl("BlinkCmpMenuSelection", { fg = p.bright, bg = p.elevated, bold = true })
hl("BlinkCmpLabelMatch", { fg = p.bright, bold = true })
hl("BlinkCmpKind", { fg = p.teal })
hl("SnippetTabstop", { bg = p.cursorline, bold = true })

-- ========== File explorer / telescope / snacks (keep helix ui.* feel) ==========
hl("NeoTreeNormal", { fg = p.text, bg = p.bg })
hl("NeoTreeNormalNC", { fg = p.text, bg = p.bg })
hl("NeoTreeDirectoryName", { fg = p.teal, bold = true })
hl("NeoTreeDirectoryIcon", { fg = p.teal, bold = true })
hl("NeoTreeFileName", { fg = p.text })
hl("NeoTreeDotfile", { fg = p.comment })
hl("NeoTreeGitModified", { fg = p.yellow })
hl("NeoTreeGitAdded", { fg = p.teal })
hl("NeoTreeGitDeleted", { fg = p.error })
hl("TelescopeNormal", { fg = p.text, bg = p.bg })
hl("TelescopeBorder", { fg = p.elevated, bg = p.bg })
hl("TelescopePromptNormal", { fg = p.text, bg = p.bg })
hl("TelescopePromptBorder", { fg = p.elevated, bg = p.bg })
hl("TelescopeSelection", { fg = p.bright, bg = p.elevated, bold = true })
hl("TelescopeMatching", { fg = p.bright, bold = true })
hl("SnacksPicker", { fg = p.text, bg = p.bg })
hl("SnacksPickerBorder", { fg = p.elevated, bg = p.bg })
hl("SnacksPickerSelection", { fg = p.bright, bg = p.elevated, bold = true })

-- ========== Misc plugin groups ==========
hl("WhichKey", { fg = p.teal, bold = true })
hl("WhichKeyGroup", { fg = p.bright, bold = true })
hl("WhichKeyDesc", { fg = p.text })
hl("LazyNormal", { fg = p.text, bg = p.bg })
hl("MasonNormal", { fg = p.text, bg = p.bg })
hl("TroubleNormal", { fg = p.text, bg = p.bg })
hl("NoiceCmdlinePopupBorder", { fg = p.elevated })
hl("DapBreakpoint", { fg = p.error, bold = true })
hl("DapStopped", { fg = p.yellow, bold = true })

-- ========== FIX: drop LSP semantic-token highlights ==========
-- Helix has no semantic tokens, so tree-sitter colors (e.g. orange uint16/int32/string)
-- must win. Keep this block at the very end of the file.
for _, g in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  hl(g, {})
end

-- Clearing groups is not enough: gopls creates `@lsp.*.go` groups lazily, after this
-- file has run, and they sit at higher priority (125-127) than tree-sitter.
-- So turn semantic tokens off for real, for new and already-attached LSP clients.
local group = vim.api.nvim_create_augroup("SolitudeNoSemanticTokens", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
-- already-running clients (when the colorscheme is applied after LSP attached)
for _, client in ipairs(vim.lsp.get_clients()) do
  client.server_capabilities.semanticTokensProvider = nil
end
if vim.lsp.semantic_tokens and vim.lsp.semantic_tokens.enable then
  pcall(vim.lsp.semantic_tokens.enable, false) -- nvim 0.11+: stops existing tokens
end
