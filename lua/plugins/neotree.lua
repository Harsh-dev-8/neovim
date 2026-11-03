return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Configure Neo-tree to NOT auto open on startup or directories
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        hijack_netrw_behavior = "disabled", -- Stops neo-tree from replacing default netrw automatically on startup
        use_libuv_file_watcher = true,
      },
    })

    -- Your keymap for toggling Neo-tree on demand
    vim.keymap.set("n", "<leader>b", "<cmd>Neotree toggle<CR>", {
      desc = "Toggle file explorer",
    })
  end,
}
