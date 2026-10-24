return {
	{
	    "lopi-py/luau-lsp.nvim",

		init = function ()
			vim.lsp.config("*", {
			  capabilities = {
				workspace = {
				  didChangeWatchedFiles = {
					dynamicRegistration = true,
				  },
				},
			  },
			})
		end,

	    opts = {
			platform = {
				type = "roblox",
			},
			types = {
				roblox_security_level = "PluginSecurity",
			},
			sourcemap = {
				enabled = true,
				autogenerate = true, -- automatic generation when the server is initialized
				rojo_path = "rojo",
				rojo_project_file = "default.project.json",
				include_non_scripts = true,
				sourcemap_file = "sourcemap.json",
			},
			plugin = {
				enabled = true,
				port = 3667,
			},
	    },
	}
}
