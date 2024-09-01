return {
	"gsuuon/model.nvim",
	version = "*",
	lazy = false,
	ft = "mchat",
	config = function()
		local ollama = require("model.providers.ollama")
		local function input_if_selection(input, context)
			return context.selection and input or ""
		end

		codegemma_fmt = {
			---@param messages ChatMessage[]
			---@param config ChatConfig
			chat = function(messages, config)
				if #messages < 1 then
					error("Need at least one message")
				end

				local first_msg = messages[1]
				local prompt = ""
				if config.system then
					prompt = "<start_of_turn>user\n" .. config.system .. "<end_of_turn>\n"
				end

				for _, msg in ipairs(messages) do
					prompt = prompt
						.. (msg.role == "user" and "<start_of_turn>user\n" or "<start_of_turn>model\n")
						.. msg.content
						.. "<|end_of_turn|>\n"
				end

				prompt = prompt .. "<start_of_turn>model\n"

				return {
					prompt = prompt,
					raw = true,
				}
			end,
		}

		require("model").setup({
			chats = {
				code = {
					provider = ollama,
					params = {
						model = "codegemma:7b",
					},
					create = input_if_selection,
					run = codegemma_fmt.chat,
				},
			},
		})
	end,
}
