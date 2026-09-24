return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
	local configs = require('nvim-treesitter')
	configs.setup({
	    highlight = {
		enable = true,
	    },
	    indent = { enable = true },
	    auto_install = { enable = true },   
	    ensure_installed = {
		'python',
		'lua',
	    },
	})                                    
    end,                                    
}
