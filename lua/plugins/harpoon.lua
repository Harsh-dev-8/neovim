return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
	"nvim-lua/plenary.nvim",
    },

    config = function()
	local harpoon = require("harpoon")

	harpoon:setup()

	-- Add current file
	vim.keymap.set("n", "<leader>a", function()
	    harpoon:list():add()
	end, { desc = "Harpoon add file" })

	-- Harpoon menu
	vim.keymap.set("n", "<leader>h", function()
	    harpoon.ui:toggle_quick_menu(harpoon:list())
	end, { desc = "Harpoon menu" })

	-- Jump to Harpoon files
	vim.keymap.set("n", "<leader>1", function()
	    harpoon:list():select(1)
	end)

	vim.keymap.set("n", "<leader>2", function()
	    harpoon:list():select(2)
	end)

	vim.keymap.set("n", "<leader>3", function()
	    harpoon:list():select(3)
	end)

	vim.keymap.set("n", "<leader>4", function()
	    harpoon:list():select(4)
	end)

	-- Telescope + Harpoon
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	vim.keymap.set("n", "<leader>fh", function()
	    local list = harpoon:list()

	    pickers.new({}, {
		prompt_title = "Harpoon",
		finder = finders.new_table({
		    results = list.items,

		    entry_maker = function(item)
			return {
			    value = item,
			    display = item.value,
			    ordinal = item.value,
			}
		    end,
		}),

		sorter = conf.generic_sorter({}),

		previewer = conf.file_previewer({}),

		attach_mappings = function(_, map)
		    map("i", "<CR>", function(prompt_bufnr)
			local selection = action_state.get_selected_entry()

			actions.close(prompt_bufnr)

			vim.cmd(
			    "edit " .. vim.fn.fnameescape(selection.value.value)
			)
		    end)

		    return true
		end,
	    }):find()
	end, { desc = "Telescope Harpoon" })
    end,
}
