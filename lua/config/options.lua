vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4

vim.opt.signcolumn = "number"

local function set_gutter_highlights()
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#585858", bg = "#1f1f1f" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ebdbb2", bg = "#262626", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1f1f1f" })

  vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#cc241d", bg = "#1f1f1f", bold = true })
  vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#d79921", bg = "#1f1f1f", bold = true })
  vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#83a598", bg = "#1f1f1f" })
  vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#8ec07c", bg = "#1f1f1f" })
end

set_gutter_highlights()
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_gutter_highlights,
})

-- vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.cmdheight = 0

vim.opt.fillchars = {
    eob = " ",
}
-- Option 2: Force block in ALL modes (same look everywhere)
vim.opt.guicursor = "n-v-c-i-ci-ve:block,r-cr:hor20,o:hor50"
-- Native inline error messages at the end of the line
vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- Symbol preceding error message
    source = "always", -- Show source (e.g. clangd, gcc)
  },
  signs = true,
  underline = true,
  update_in_insert = true, -- Show errors live while typing!
  severity_sort = true,
})
