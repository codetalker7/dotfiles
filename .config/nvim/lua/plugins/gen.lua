return {
	"David-Kunz/gen.nvim",
	version = "*",
	lazy = false,
	opts = {
		model = "codellama:13b-instruct",
		host = "localhost",
		port = "11434",
		quit_map = "q",
		retry_map = "<c-r>",
		init = function(options)
			pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
		end,
		-- Function to initialize Ollama
		command = function(options)
			local body = { model = options.model, stream = true }
			return "curl --silent --no-buffer -X POST http://"
				.. options.host
				.. ":"
				.. options.port
				.. "/api/chat -d $body"
		end,
		display_mode = "horizontal-split",
		show_prompt = true, -- Shows the prompt submitted to Ollama.
		show_model = true, -- Displays which model you are using at the beginning of your chat session.
		no_auto_close = true, -- Never closes the window automatically.
		config = function() end,
	},
}
