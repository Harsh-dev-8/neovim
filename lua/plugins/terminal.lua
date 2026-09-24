return {
    "akinsho/toggleterm.nvim",

    config = function()
	require("toggleterm").setup({
	    size = 15,
	    open_mapping = [[<C-\>]],
	    direction = "horizontal",

	    start_in_insert = true,
	    persist_size = true,
	    persist_mode = true,
	    close_on_exit = true,

	    shell = vim.o.shell,
	})

	-- ========================================
	-- Window navigation
	-- ========================================

	-- Normal mode
	vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {
	    desc = "Move focus down",
	})

	vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {
	    desc = "Move focus up",
	})

	-- Terminal mode
	vim.api.nvim_create_autocmd("TermOpen", {
	    callback = function()
		local opts = {
		    buffer = true,
		    silent = true,
		}

		vim.keymap.set(
		    "t",
		    "<C-j>",
		    [[<C-\><C-n><C-w><C-j>]],
		    opts
		)

		vim.keymap.set(
		    "t",
		    "<C-k>",
		    [[<C-\><C-n><C-w><C-k>]],
		    opts
		)
	    end,
	})

	-- Automatically enter terminal mode
	-- whenever we enter a terminal buffer.
	vim.api.nvim_create_autocmd("BufEnter", {
	    callback = function()
		if vim.bo.buftype == "terminal" then
		    vim.cmd("startinsert")
		end
	    end,
	})
    end,
}
