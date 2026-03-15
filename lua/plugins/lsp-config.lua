return {
	{ "mason-org/mason.nvim" },
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "clangd" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Lua
			vim.lsp.config("lua_ls", { settings = {} }, { capabilities = capabilities })
			vim.lsp.enable("lua_ls")

			-- C / C++
			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--background-index",
					--"--clang-tidy",
					"--completion-style=detailed",
				},
				{ capabilities = capabilities },
			})
			vim.lsp.enable("clangd")

			--Python
			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
				{ capabilities = capabilities },
			})
			vim.lsp.enable("pyright")

            -- Zig
            vim.lsp.config("zls", { capabilities = capabilities })
            vim.lsp.enable("zls")
		end,
	},
}
