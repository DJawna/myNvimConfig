function StartRust(projectFolder)
	homeFolder = (vim.fn.environ())['HOME']
        lfsServerFileName = homeFolder .. "/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer"
	vim.lsp.start({
		name = 'rust-analyser',
		cmd = { lfsServerFileName }

	})
end

vim.api.nvim_create_user_command('StartRust',
	function()
		StartRust(vim.api.nvim_exec('pwd', true))
	end
,
{ })

vim.api.nvim_create_user_command('StartGo',
	function()
		homeFolder = (vim.fn.environ())['HOME']
		lfsServerFileName = homeFolder .. "/go/bin/gopls"
		vim.lsp.start({
			name = 'gopls',
			cmd = { lfsServerFileName  }
		})
	end
	,
	{}
)

vim.api.nvim_create_user_command('StartTs',
	function()
		lfsServerFileName =  "/usr/bin/typescript-language-server"
		vim.lsp.start({
			name = "jscript",
			cmd = { lfsServerFileName , "--stdio" },
			root_dir = vim.fn.getcwd() 
		})
	end
	,
	{}
)

vim.api.nvim_create_user_command('StartLua',
	function()
		vim.lsp.start({
			name= "lualang",
			cmd = { "/usr/bin/lua-language-server" }
		})
	end
	,
	{}
)

vim.api.nvim_create_user_command("Srn",
	function()
		vim.lsp.buf.rename()	
	end
	,
	{}
)

vim.api.nvim_create_user_command("Gd",
	function()
		vim.lsp.buf.type_definition()
	end
	,
	{}
)

