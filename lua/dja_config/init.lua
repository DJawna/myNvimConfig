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
			cmd = { lfsServerFileName  },
			root_dir = vim.fn.getcwd() 
		})
	end
	,
	{}
	)
