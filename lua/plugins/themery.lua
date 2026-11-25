return {
  -- Theme picker
  {
    "zaldih/themery.nvim",
    lazy = false,
    priority = 1000,

    config = function()
      require("themery").setup({
        livePreview = true,

        themes = {
          -- Catppuccin
          {
            name = "Catppuccin Mocha",
            colorscheme = "catppuccin-mocha",
          },

          -- Tokyo Night
          {
            name = "Tokyo Night",
            colorscheme = "tokyonight-night",
          },
          {
            name = "Tokyo Night Storm",
            colorscheme = "tokyonight-storm",
          },
          {
            name = "Tokyo Night Moon",
            colorscheme = "tokyonight-moon",
          },

          -- Gruvbox
          {
            name = "Gruvbox Dark",
            colorscheme = "gruvbox",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Gruvbox Light",
            colorscheme = "gruvbox",
            before = [[
              vim.opt.background = "light"
            ]],
          },

          -- Kanagawa
          {
            name = "Kanagawa Wave",
            colorscheme = "kanagawa-wave",
          },
          {
            name = "Kanagawa Dragon",
            colorscheme = "kanagawa-dragon",
          },

          -- Rosé Pine
          {
            name = "Rosé Pine",
            colorscheme = "rose-pine",
          },
          {
            name = "Rosé Pine Moon",
            colorscheme = "rose-pine-moon",
          },

          -- Nightfox
          {
            name = "Nightfox",
            colorscheme = "nightfox",
          },
          {
            name = "Carbonfox",
            colorscheme = "carbonfox",
          },
          {
            name = "Duskfox",
            colorscheme = "duskfox",
          },

          -- Everforest
          {
            name = "Everforest Dark",
            colorscheme = "everforest",
            before = [[
              vim.opt.background = "dark"
              vim.g.everforest_background = "hard"
            ]],
          },

          -- Cyberdream
          {
            name = "Cyberdream",
            colorscheme = "cyberdream",
          },

          -- OneDark
          {
            name = "OneDark",
            colorscheme = "onedark",
          },

          -- Oxocarbon
          {
            name = "Oxocarbon",
            colorscheme = "oxocarbon",
          },

          -- Dracula
          {
            name = "Dracula",
            colorscheme = "dracula",
          },

          -- GitHub
          {
            name = "GitHub Dark",
            colorscheme = "github_dark",
          },
          {
            name = "GitHub Dark Dimmed",
            colorscheme = "github_dark_dimmed",
          },

          -- VS Code
          {
            name = "VSCode Dark",
            colorscheme = "vscode",
          },

          -- Nord
          {
            name = "Nord",
            colorscheme = "nord",
          },
        },
      })

      -- Open the theme picker
      vim.keymap.set("n", "<leader>th", "<cmd>Themery<cr>", {
        desc = "Theme picker",
        silent = true,
      })
    end,
  },

  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },

  -- Tokyo Night
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Rosé Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
  },

  -- Nightfox
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Everforest
  {
    "neanias/everforest-nvim",
    name = "everforest",
    lazy = false,
    priority = 1000,
  },

  -- Cyberdream
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },

  -- OneDark
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Oxocarbon
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Dracula
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
  },

  -- GitHub
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
  },

  -- VSCode
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Nord
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
  },
}

