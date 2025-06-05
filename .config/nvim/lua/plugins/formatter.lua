return {
	"mhartington/formatter.nvim",
	version = "*",
	lazy = false,
	config = function()
		-- Utilities for creating configurations
		local util = require("formatter.util")
		-- got the below function from: https://neovim.discourse.group/t/function-that-return-visually-selected-text/1601
		local function get_visual_selection()
			local s_start = vim.fn.getpos("'<")
			local s_end = vim.fn.getpos("'>")
			local n_lines = math.abs(s_end[2] - s_start[2]) + 1
			local lines = vim.api.nvim_buf_get_lines(
				0,
				s_start[2] - 1,
				s_end[2],
				false
			)
			lines[1] = string.sub(lines[1], s_start[3], -1)
			if n_lines == 1 then
				lines[n_lines] = string.sub(
					lines[n_lines],
					1,
					s_end[3] - s_start[3] + 1
				)
			else
				lines[n_lines] =
					string.sub(lines[n_lines], 1, s_end[3])
			end
			return table.concat(lines, "\n")
		end -- get the selected lines

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				lua = {
					function()
						return {
							exe = "stylua",
							cwd = pwd,
							args = {
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = false,
						}
					end,
				},
				julia = {
					function()
						-- Full specification of configurations is down below and in Vim help
						-- files. or just read the docs on github
						return {
							exe = "julia",
							cwd = pwd,
							args = {
								"--project=dev/",
								"dev/format.jl",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = false,
						}
					end,
				},
				python = {
					function()
						-- Full specification of configurations is down below and in Vim help
						-- files. or just read the docs on github
						return {
							exe = "ruff",
							cwd = pwd,
							args = {
								"format",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = false,
						}
					end,
				},
				markdown = {
					function()
						-- Full specification of configurations is down below and in Vim help
						-- files. or just read the docs on github
						return {
							exe = "deno fmt",
							cwd = pwd,
							args = {
								"format",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = false,
						}
					end,
				},
				rmd = {
					function()
						-- Full specification of configurations is down below and in Vim help
						-- files. or just read the docs on github
						return {
							exe = "deno fmt",
							cwd = pwd,
							args = {
								"format",
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = false,
						}
					end,
				},
				c = {
					function()
						-- Full specification of configurations is down below and in Vim help
						-- files. or just read the docs on github
						return {
							exe = "clang-format -i -style webkit",
							cwd = pwd,
							args = {
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = false,
						}
					end,
				},
				cpp = {
					function()
						-- Full specification of configurations is down below and in Vim help
						-- files. or just read the docs on github
						return {
							exe = "clang-format -i -style webkit",
							cwd = pwd,
							args = {
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = false,
						}
					end,
				},
				h = {
					function()
						-- Full specification of configurations is down below and in Vim help
						-- files. or just read the docs on github
						return {
							exe = "clang-format -i -style webkit",
							cwd = pwd,
							args = {
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = false,
						}
					end,
				},
				hpp = {
					function()
						-- Full specification of configurations is down below and in Vim help
						-- files. or just read the docs on github
						return {
							exe = "clang-format -i -style webkit",
							cwd = pwd,
							args = {
								util.escape_path(
									util.get_current_buffer_file_path()
								),
							},
							stdin = false,
						}
					end,
				},

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
