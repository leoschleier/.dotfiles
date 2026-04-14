return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP references"
				vim.keymap.set("n", "grr", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Show LSP implementations"
				vim.keymap.set("n", "gri", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "grt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "Show line diagnostics"
				vim.keymap.set("n", "grd", vim.diagnostic.open_float, opts)

				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "grD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
			end,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
			callback = function(args)
				local client = vim.lsp.get_clients({ id = args.data.client_id })[1]
				if client == nil then
					return
				end
				if client.name == "ruff" then
					-- Disable hover in favor of Pyright
					client.server_capabilities.hoverProvider = false
				end
			end,
			desc = "LSP: Disable hover capability from Ruff",
		})

		-- Enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local servers = {
			dockerls = {},
			jsonls = {},
			lua_ls = {},
			marksman = {},
			pyright = {},
			ruff = {},
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						checkOnSave = true,
						check = {
							command = "clippy",
						},
					},
				},
			},
			taplo = {},
			yamlls = {},
		}

		for server, config in pairs(servers) do
			config.capabilities = capabilities
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end
	end,
}
