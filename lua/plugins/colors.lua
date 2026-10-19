 -- lua/plugins/colors.lua
return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      contrast = "hard",
      palette_overrides = {
        dark0_hard = "#000000",
      },
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}       
