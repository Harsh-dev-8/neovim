-- Clear existing highlights if reloading the theme
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") ~= 0 then
    vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "custom_dark"

-- Define your color palette variables
local palette = {
    bg        = "#21252b", -- Dark charcoal background
    fg        = "#abb2bf", -- Main text color
    comment   = "#5c6370", -- Muted gray for comments
    red       = "#e06c75", -- Errors, constants, delete
    green     = "#e06c75", -- Strings
    yellow    = "#e5c07b", -- Types, classes, warnings
    blue      = "#61afef", -- Functions, methods
    purple    = "#c678dd", -- Keywords (if, else, def, return)
    cyan      = "#56b6c2", -- Operators, special
    trueGreen          = "#98c379", -- Green for dot properties (.gtk_proc)
}

-- Apply highlight groups using Neovim's modern API
local highlights = {
    Normal     = { fg = palette.fg, bg = palette.bg },
    Comment    = { fg = palette.comment, italic = true },
    String     = { fg = palette.green },
    Function   = { fg = palette.cyan, bold = true },
    Statement  = { fg = palette.purple }, -- Covers keywords like 'if', 'return'
    Keyword    = { fg = palette.purple },
    Conditional= { fg = palette.purple }, -- 'if', 'else'
    Repeat     = { fg = palette.purple },
    Operator   = { fg = palette.cyan },
    Identifier = { fg = palette.red },
    Type       = { fg = palette.yellow },
    Constant   = { fg = palette.yellow },
    -- Property and attribute access after a dot (e.g., self.gtk_proc, self.config)
    ["@property"]            = { fg = palette.trueGreen},       -- Or change to your preferred color
    ["@field"]               = { fg = palette.trueGreen},
    ["@attribute"]           = { fg = palette.trueGreen},
}

-- Loop through and set the highlights
for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
end

