return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		strategies = {
			chat = {
				adapter = "groq_cloud",
			},
			inline = {
				adapter = "groq_cloud",
			},
			cmd = {
				adapter = "groq_cloud",
			},
		},
		adapters = {
			groq_cloud = function()
				return require("codecompanion.adapters").extend(
					"openai_compatible",
					{
						env = {
							url = "https://api.groq.com/openai", -- optional: default value is ollama url http://127.0.0.1:11434
							api_key = "cmd: echo $GROQ_API_KEY", -- optional: if your endpoint is authenticated
							chat_url = "/v1/chat/completions", -- optional: default value, override if different
							models_endpoint = "/v1/models", -- optional: attaches to the end of the URL to form the endpoint to retrieve models
						},
						schema = {
							model = {
								default = "deepseek-r1-distill-llama-70b", -- define llm model to be used
							},
						},
					}
				)
			end,
		},
	},
}
