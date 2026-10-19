local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Automatically imports all files directly in lua/plugins/
    { import = "plugins" },
    -- REQUIRED: Tell lazy to also look inside lua/plugins/lsp/
    { import = "plugins.lsp" }, 
  },
})
