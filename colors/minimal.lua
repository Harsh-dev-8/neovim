vim.cmd("highlight clear")
vim.cmd("set t_Co=256")

--------------------------------------------------
-- Base
--------------------------------------------------

vim.api.nvim_set_hl(0, "Normal", {
    fg = "#D4D4D4",
    bg = "#0D0D0D",
})

vim.api.nvim_set_hl(0, "NormalFloat", {
    fg = "#D4D4D4",
    bg = "#0D0D0D",
})

vim.api.nvim_set_hl(0, "Cursor", {
    fg = "#0D0D0D",
    bg = "#FFFFFF",
})

vim.api.nvim_set_hl(0, "LineNr", {
    fg = "#555555",
    bg = "#0D0D0D",
})

vim.api.nvim_set_hl(0, "CursorLineNr", {
    fg = "#FFFFFF",
    bg = "#0D0D0D",
})

vim.api.nvim_set_hl(0, "CursorLine", {
    bg = "#111111",
})

--------------------------------------------------
-- Standard Vim syntax groups
--------------------------------------------------

vim.api.nvim_set_hl(0, "Comment", {
    fg = "#6A9955",
})

vim.api.nvim_set_hl(0, "String", {
    fg = "#CE9178",
})

vim.api.nvim_set_hl(0, "Keyword", {
    fg = "#569CD6",
})

vim.api.nvim_set_hl(0, "Function", {
    fg = "#4EC9B0",
})

vim.api.nvim_set_hl(0, "Type", {
    fg = "#4EC9B0",
})

vim.api.nvim_set_hl(0, "Identifier", {
    fg = "#D4D4D4",
})

vim.api.nvim_set_hl(0, "Constant", {
    fg = "#4FC1FF",
})

vim.api.nvim_set_hl(0, "Number", {
    fg = "#B5CEA8",
})

vim.api.nvim_set_hl(0, "Boolean", {
    fg = "#569CD6",
})

vim.api.nvim_set_hl(0, "Operator", {
    fg = "#D4D4D4",
})

vim.api.nvim_set_hl(0, "Delimiter", {
    fg = "#D4D4D4",
})

--------------------------------------------------
-- Tree-sitter
--------------------------------------------------

-- Comments
vim.api.nvim_set_hl(0, "@comment", {
    fg = "#6A9955",
})

vim.api.nvim_set_hl(0, "@comment.python", {
    fg = "#6A9955",
})

-- Keywords: class, def, return, import, from, if, else...
vim.api.nvim_set_hl(0, "@keyword", {
    fg = "#569CD6",
})

vim.api.nvim_set_hl(0, "@keyword.python", {
    fg = "#569CD6",
})

-- Function definitions
vim.api.nvim_set_hl(0, "@function", {
    fg = "#4EC9B0",
})

vim.api.nvim_set_hl(0, "@function.python", {
    fg = "#4EC9B0",
})

-- Function calls
vim.api.nvim_set_hl(0, "@function.call", {
    fg = "#4EC9B0",
})

vim.api.nvim_set_hl(0, "@function.call.python", {
    fg = "#4EC9B0",
})

-- Classes / types
vim.api.nvim_set_hl(0, "@type", {
    fg = "#4EC9B0",
})

vim.api.nvim_set_hl(0, "@type.python", {
    fg = "#4EC9B0",
})

-- Class constructors / names
vim.api.nvim_set_hl(0, "@constructor", {
    fg = "#4EC9B0",
})

vim.api.nvim_set_hl(0, "@constructor.python", {
    fg = "#4EC9B0",
})

-- Variables
vim.api.nvim_set_hl(0, "@variable", {
    fg = "#D4D4D4",
})

vim.api.nvim_set_hl(0, "@variable.python", {
    fg = "#D4D4D4",
})

-- Parameters
vim.api.nvim_set_hl(0, "@variable.parameter", {
    fg = "#D4D4D4",
})

vim.api.nvim_set_hl(0, "@variable.parameter.python", {
    fg = "#D4D4D4",
})

-- Built-in variables/functions
vim.api.nvim_set_hl(0, "@variable.builtin", {
    fg = "#9CDCFE",
})

vim.api.nvim_set_hl(0, "@function.builtin", {
    fg = "#4EC9B0",
})

-- Strings
vim.api.nvim_set_hl(0, "@string", {
    fg = "#CE9178",
})

vim.api.nvim_set_hl(0, "@string.python", {
    fg = "#CE9178",
})

-- Numbers
vim.api.nvim_set_hl(0, "@number", {
    fg = "#B5CEA8",
})

-- Constants
vim.api.nvim_set_hl(0, "@constant", {
    fg = "#4FC1FF",
})

vim.api.nvim_set_hl(0, "@constant.python", {
    fg = "#4FC1FF",
})

-- Operators
vim.api.nvim_set_hl(0, "@operator", {
    fg = "#D4D4D4",
})

-- Punctuation
vim.api.nvim_set_hl(0, "@punctuation.delimiter", {
    fg = "#D4D4D4",
})

vim.api.nvim_set_hl(0, "@punctuation.bracket", {
    fg = "#D4D4D4",
})

--------------------------------------------------
-- Selection / search
--------------------------------------------------

vim.api.nvim_set_hl(0, "Visual", {
    bg = "#264F78",
})

vim.api.nvim_set_hl(0, "Search", {
    fg = "#0D0D0D",
    bg = "#D7BA7D",
})

vim.api.nvim_set_hl(0, "IncSearch", {
    fg = "#0D0D0D",
    bg = "#D7BA7D",
})

--------------------------------------------------
-- Diagnostics
--------------------------------------------------

vim.api.nvim_set_hl(0, "DiagnosticError", {
    fg = "#F44747",
})

vim.api.nvim_set_hl(0, "DiagnosticWarn", {
    fg = "#DCDCAA",
})

vim.api.nvim_set_hl(0, "DiagnosticInfo", {
    fg = "#4FC1FF",
})

vim.api.nvim_set_hl(0, "DiagnosticHint", {
    fg = "#4EC9B0",
})
