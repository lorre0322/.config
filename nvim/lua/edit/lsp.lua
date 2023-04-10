return function()
	local nvim_lsp = require("lspconfig")
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")

	require("lspconfig.ui.windows").default_options.border = "single"

	require("mason").setup({
		ui = {
			border = "rounded",
			keymaps = {
				toggle_server_expand = "<CR>",
				install_server = "i",
				update_server = "u",
				check_server_version = "c",
				update_all_servers = "U",
				check_outdated_servers = "C",
				uninstall_server = "X",
				cancel_installation = "<C-c>",
			},
		},
	})
	mason_lspconfig.setup({
		ensure_installed = {
      "html",
      "jsonls",
      "lua_ls",
    },
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	local opts = {
		on_attach = function()
			require("lsp_signature").on_attach({
				bind = true,
				use_lspsaga = false,
				floating_window = true,
				fix_pos = true,
				hint_enable = true,
				hi_parameter = "Search",
				handler_opts = {
					border = "rounded",
				},
			})
		end,
		capabilities = capabilities,
	}

	-- Set lsps that are not supported by `mason.nvim` but supported by `nvim-lspconfig` here.
	if vim.fn.executable("dart") then
		local _opts = {
      cmd = { "dart", "language-server", "--protocol=lsp" },
      filetypes = { "dart" },
      init_options = {
        closingLabels = true,
        flutterOutline = true,
        onlyAnalyzeProjectsWithOpenFiles = true,
        outline = true,
        suggestFromUnimportedLibraries = true,
      },
    }
		local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
		nvim_lsp.dartls.setup(final_opts)
	end
end
