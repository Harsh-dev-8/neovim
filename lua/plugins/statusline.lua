local cached_branch = ""
local last_git_dir = nil

local function get_git_branch()
  local file = vim.api.nvim_buf_get_name(0)
  local start_dir = (file ~= "" and vim.fn.fnamemodify(file, ":h")) or vim.fn.getcwd()
  local git_dir = vim.fn.finddir(".git", start_dir .. ";")

  if git_dir == "" then
    cached_branch = ""
    last_git_dir = nil
    return ""
  end

  if git_dir == last_git_dir and cached_branch ~= "" then
    return cached_branch
  end

  last_git_dir = git_dir
  local f = io.open(git_dir .. "/HEAD", "r")
  if not f then
    cached_branch = ""
    return ""
  end

  local content = f:read("*l") or ""
  f:close()

  local branch = content:match("^ref: refs/heads/(.+)$")
  cached_branch = branch or content:sub(1, 7)
  return cached_branch
end

local function mode_info()
  local mode = vim.fn.mode()
  local map = {
    ["n"] = { label = "NORMAL", hl = "SlModeNormal" },
    ["no"] = { label = "O-PENDING", hl = "SlModeNormal" },
    ["nov"] = { label = "O-PENDING", hl = "SlModeNormal" },
    ["noV"] = { label = "O-PENDING", hl = "SlModeNormal" },
    ["no\22"] = { label = "O-PENDING", hl = "SlModeNormal" },
    ["niI"] = { label = "NORMAL", hl = "SlModeNormal" },
    ["niR"] = { label = "NORMAL", hl = "SlModeNormal" },
    ["niV"] = { label = "NORMAL", hl = "SlModeNormal" },
    ["v"] = { label = "VISUAL", hl = "SlModeVisual" },
    ["V"] = { label = "V-LINE", hl = "SlModeVisualLine" },
    ["\22"] = { label = "V-BLOCK", hl = "SlModeVisualBlock" },
    ["s"] = { label = "SELECT", hl = "SlModeVisual" },
    ["S"] = { label = "S-LINE", hl = "SlModeVisualLine" },
    ["\19"] = { label = "S-BLOCK", hl = "SlModeVisualBlock" },
    ["i"] = { label = "INSERT", hl = "SlModeInsert" },
    ["ic"] = { label = "INSERT", hl = "SlModeInsert" },
    ["ix"] = { label = "INSERT", hl = "SlModeInsert" },
    ["R"] = { label = "REPLACE", hl = "SlModeReplace" },
    ["Rc"] = { label = "REPLACE", hl = "SlModeReplace" },
    ["Rx"] = { label = "REPLACE", hl = "SlModeReplace" },
    ["Rv"] = { label = "V-REPLACE", hl = "SlModeReplace" },
    ["c"] = { label = "COMMAND", hl = "SlModeNormal" },
    ["cv"] = { label = "EX", hl = "SlModeNormal" },
    ["ce"] = { label = "EX", hl = "SlModeNormal" },
    ["r"] = { label = "PROMPT", hl = "SlModeNormal" },
    ["rm"] = { label = "MORE", hl = "SlModeNormal" },
    ["r?"] = { label = "CONFIRM", hl = "SlModeNormal" },
    ["!"] = { label = "SHELL", hl = "SlModeNormal" },
    ["t"] = { label = "TERMINAL", hl = "SlModeInsert" },
  }
  return map[mode] or { label = mode:upper(), hl = "SlModeNormal" }
end

local function set_highlights()
  vim.api.nvim_set_hl(0, "StatusLine", { fg = "#9e9e9e", bg = "#181818" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#585858", bg = "#181818" })
  vim.api.nvim_set_hl(0, "SlBranch", { fg = "#8c8c8c", bg = "#181818" })
  vim.api.nvim_set_hl(0, "SlFile", { fg = "#d4d4d4", bg = "#181818", bold = true })
  vim.api.nvim_set_hl(0, "SlMod", { fg = "#b5b5b5", bg = "#181818" })
  vim.api.nvim_set_hl(0, "SlMeta", { fg = "#8c8c8c", bg = "#181818" })

  -- Mode colors with distinct backgrounds matching your earlier color config
  vim.api.nvim_set_hl(0, "SlModeNormal", { fg = "#1d2021", bg = "#a89984", bold = true })
  vim.api.nvim_set_hl(0, "SlModeInsert", { fg = "#1d2021", bg = "#83a598", bold = true })
  vim.api.nvim_set_hl(0, "SlModeVisual", { fg = "#1d2021", bg = "#d79921", bold = true })
  vim.api.nvim_set_hl(0, "SlModeVisualLine", { fg = "#1d2021", bg = "#d79921", bold = true })
  vim.api.nvim_set_hl(0, "SlModeVisualBlock", { fg = "#1d2021", bg = "#d79921", bold = true })
  vim.api.nvim_set_hl(0, "SlModeReplace", { fg = "#1d2021", bg = "#cc241d", bold = true })
end

function _G.CustomStatusline()
  local parts = {}
  local m = mode_info()

  -- 1. Slim mode block with no extra side padding spaces
  table.insert(parts, "%#" .. m.hl .. "#" .. m.label .. "%#StatusLine#")

  -- 2. Git branch right next to mode
  local branch = get_git_branch()
  if branch ~= "" then
    table.insert(parts, "%#SlBranch# " .. branch .. "%#StatusLine#")
  end

  -- 3. File name only + modified indicator
  local filename = vim.fn.expand("%:t")
  if filename == "" then
    filename = "[No Name]"
  end
  local modified = vim.bo.modified and " %#SlMod#[+]" or ""
  table.insert(parts, " %#SlFile#" .. filename .. modified .. "%#StatusLine#")

  -- Right alignment spacer
  table.insert(parts, "%=")

  -- 4. System format + auto-detected language
  local fileformat = vim.bo.fileformat ~= "" and vim.bo.fileformat or "unix"
  local ft = vim.bo.filetype ~= "" and vim.bo.filetype or "none"
  table.insert(parts, "%#SlMeta#" .. fileformat .. "  " .. ft .. " ")

  return table.concat(parts)
end

return {
  dir = vim.fn.stdpath("config"),
  name = "custom-statusline",
  lazy = false,
  priority = 900,
  config = function()
    set_highlights()
    vim.opt.laststatus = 2
    vim.opt.showmode = false
    vim.opt.statusline = "%!v:lua.CustomStatusline()"

    local group = vim.api.nvim_create_augroup("CustomStatuslineGroup", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = group,
      callback = set_highlights,
    })
    vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged" }, {
      group = group,
      callback = function()
        last_git_dir = nil
      end,
    })
  end,
}
