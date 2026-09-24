return {
    "neovim/nvim-lspconfig",

    config = function()
	vim.diagnostic.config({
	    virtual_text = {
		spacing = 4,
		prefix = "●",
	    },

	    signs = true,
	    underline = true,
	    update_in_insert = false,
	    severity_sort = true,

	    float = {
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	    },
	})

	-- Diagnostic signs
	local signs = {
	    Error = "󰅚",
	    Warn = "󰀪",
	    Hint = "󰌶",
	    Info = "󰋽",
	}

	for type, icon in pairs(signs) do
	    local hl = "DiagnosticSign" .. type

	    vim.fn.sign_define(hl, {
		text = icon,
		texthl = hl,
		numhl = "",
	    })
	end

	-- LSP keymaps
	vim.api.nvim_create_autocmd("LspAttach", {
	    callback = function(event)
		local opts = {
		    buffer = event.buf,
		    silent = true,
		}

		vim.keymap.set(
		    "n",
		    "gd",
		    vim.lsp.buf.definition,
		    vim.tbl_extend("force", opts, {
			desc = "LSP: Go to definition",
		    })
		)

		vim.keymap.set(
		    "n",
		    "gD",
		    vim.lsp.buf.declaration,
		    vim.tbl_extend("force", opts, {
			desc = "LSP: Go to declaration",
		    })
		)

		vim.keymap.set(
		    "n",
		    "gr",
		    vim.lsp.buf.references,
		    vim.tbl_extend("force", opts, {
			desc = "LSP: Find references",
		    })
		)

		vim.keymap.set(
		    "n",
		    "K",
		    vim.lsp.buf.hover,
		    vim.tbl_extend("force", opts, {
			desc = "LSP: Hover documentation",
		    })
		)

		vim.keymap.set(
		    "n",
		    "<leader>rn",
		    vim.lsp.buf.rename,
		    vim.tbl_extend("force", opts, {
			desc = "LSP: Rename symbol",
		    })
		)

		vim.keymap.set(
		    { "n", "v" },
		    "<leader>ca",
		    vim.lsp.buf.code_action,
		    vim.tbl_extend("force", opts, {
			desc = "LSP: Code action",
		    })
		)

		vim.keymap.set(
		    "n",
		    "<leader>f",
		    function()
			vim.lsp.buf.format({ async = true })
		    end,
		    vim.tbl_extend("force", opts, {
			desc = "LSP: Format buffer",
		    })
		)

		vim.keymap.set(
		    "n",
		    "<leader>e",
		    vim.diagnostic.open_float,
		    vim.tbl_extend("force", opts, {
			desc = "Diagnostics: Show line",
		    })
		)

		vim.keymap.set(
		    "n",
		    "[d",
		    vim.diagnostic.goto_prev,
		    vim.tbl_extend("force", opts, {
			desc = "Diagnostics: Previous",
		    })
		)

		vim.keymap.set(
		    "n",
		    "]d",
		    vim.diagnostic.goto_next,
		    vim.tbl_extend("force", opts, {
			desc = "Diagnostics: Next",
		    })
		)
	    end,
	})

	-- BasedPyright
	vim.lsp.config("basedpyright", {

	    settings = {
		basedpyright = {
		    analysis = {
			typeCheckingMode = "standard",
			autoSearchPaths = true,
			useLibraryCodeForTypes = true,
			diagnosticMode = "workspace",
			autoImportCompletions = true,
		    },
		},
	    },
	})

	vim.lsp.enable("basedpyright")
    end,
}
