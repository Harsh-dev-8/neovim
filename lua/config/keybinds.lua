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

