vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<Esc>", {
    desc = "Exit insert mode",
})
vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<CR>", {
    desc = "Save file",
})
vim.keymap.set("n", "<leader>v", "v", {
    desc = "Visual mode",
})
-- Enter Visual mode
vim.keymap.set("n", "vv", "v", {
    desc = "Visual mode",
})

-- Exit Insert/Visual mode
vim.keymap.set({ "i", "v" }, "jk", "<Esc>", {
    desc = "Exit to normal mode",
})

-- command pallate open
vim.keymap.set("n", ";", ":", {
  desc = "Open command line",
})
-- Compile and run C files with <leader>r
vim.keymap.set("n", "<leader>r", function()
  -- Save the current file first
  vim.cmd("w")
  
  -- Get the current filename and its name without extension
  local file = vim.fn.expand("%")
  local basename = vim.fn.expand("%:r")
  
  -- Ensure it's actually a C file before compiling
  if vim.bo.filetype ~= "c" then
    print("Not a C file!")
    return
  end
  
  -- Open a split terminal at the bottom, compile with gcc, and run the binary
  vim.cmd("split | terminal gcc " .. vim.fn.shellescape(file) .. " -o " .. vim.fn.shellescape(basename) .. " && " .. vim.fn.shellescape("./" .. basename))
end, { desc = "Compile and run C code" })

