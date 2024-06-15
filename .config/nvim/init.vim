" disable netrw at the very start of your init.lua; for nvim-tree.lua
lua <<EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
EOF

syntax enable

"loa ./lua/plugins.lua
lua require('plugins')

"some indentation settings
" show existing tab with x spaces width
set tabstop=4

" when indenting with '>', use x spaces width 
set shiftwidth=4

" on pressing tab, insert spaces
set expandtab

" highlight text during search
set hlsearch

" This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

set nu

"setup nvim-cmp
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'
  local lspkind = require('lspkind')

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    formatting = {
      -- lspkind-nvim
      format = lspkind.cmp_format({
         mode = 'symbol_text',
	 maxwidth = 50,
	 ellipsis_char = '...',
      })
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['julials'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['marksman'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
    cmd = {"clangd-12"},
  }
  require('lspconfig')['jdtls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['golangci_lint_ls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['texlab'].setup {
    capabilities = capabilities
  }

EOF

"setup dracula theme for starry
lua <<EOF

local config = {
  border = false, -- Split window borders
  italics = {
    comments = false, -- Italic comments
    strings = false, -- Italic strings
    keywords = false, -- Italic keywords
    functions = false, -- Italic functions
    variables = false -- Italic variables
  },

  contrast = { -- Select which windows get the contrast background
    enable = true, -- Enable contrast
    terminal = true, -- Darker terminal
    filetypes = {}, -- Which filetypes get darker? e.g. *.vim, *.cpp, etc.
  },

  text_contrast = {
    lighter = false, -- Higher contrast text for lighter style
    darker = false -- Higher contrast text for darker style
  },

  disable = {
    background = false, -- true: transparent background
    term_colors = false, -- Disable setting the terminal colors
    eob_lines = false -- Make end-of-buffer lines invisible
  },

  style = {
    name = 'moonlight', -- Theme style name (moonlight, earliestsummer, etc.)
    -- " other themes: dracula, oceanic, dracula_blood, 'deep ocean', darker, palenight, monokai, mariana, emerald, middlenight_blue
    disable = {},  -- a list of styles to disable, e.g. {'bold', 'underline'}
    fix = true,
    darker_contrast = false, -- More contrast for darker style
    daylight_swith = false, -- Enable day and night style switching
    deep_black = false, -- Enable a deeper black background
  },

  custom_colors = {
    variable = '#f797d7',
  },
  custom_highlights = {
    LineNr = { fg = '#777777' },
    Idnetifier = { fg = '#ff4797' },
  }
}
require('starry').setup(config)
require('starry.functions').change_style("dracula")

EOF

"devicons
lua <<EOF
  require'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
	-- you can specify color or cterm_color instead of specifying both of them
	-- DevIcon will be appended to `name`
	override = {
	  zsh = {
	    icon = "",
	    color = "#428850",
	    cterm_color = "65",
	    name = "Zsh"
	  }
	};
	-- globally enable different highlight colors per icon (default to true)
	-- if set to false all icons will have the default icon's color
	color_icons = true;
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true;
	-- globally enable "strict" selection of icons - icon will be looked up in
	-- different tables, first by filename, and if not found by extension; this
	-- prevents cases when file doesn't have any extension but still gets some icon
	-- because its name happened to match some extension (default to false)
	strict = true;
	-- same as `override` but specifically for overrides by filename
	-- takes effect when `strict` is true
	override_by_filename = {
	  [".gitignore"] = {
	    icon = "",
	    color = "#f1502f",
	    name = "Gitignore"
	  }
	};
	-- same as `override` but specifically for overrides by extension
	-- takes effect when `strict` is true
	override_by_extension = {
	  ["log"] = {
	    icon = "",
	    color = "#81e043",
	    name = "Log"
	  }
	};
}
EOF

"lualine setup
lua <<EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}  
EOF

"tabline
set termguicolors
lua << EOF
  require("bufferline").setup{}
EOF

"config for nvim-treesitter
function FoldConfig()
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
endfunction

autocmd BufAdd,BufEnter,BufNew,BufNewFile,BufWinEnter * :call FoldConfig()

"indent-blankline
lua << EOF
  require("ibl").setup()
EOF

" for nvim-lightbulb
autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()

"file explorer
lua <<EOF
  require("nvim-tree").setup()
EOF

"vim slime; to send to another tmux pane for instance
let g:slime_target="tmux"
let g:slime_paste_file=expand("$HOME/.slime_paste")
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"} " set the default target pane to the second pane in the current window

"configuring lsp-signature.nvim
lua <<EOF
cfg = {
  debug = false, -- set to true to enable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
  -- default is  ~/.cache/nvim/lsp_signature.log
  verbose = false, -- show debug line number

  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you DO NOT want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode, 10 by default

  max_height = 12, -- max height of signature floating_window
  max_width = 80, -- max_width of signature floating_window
  noice = false, -- set to true if you using noice to render markdown
  wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
  
  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap

  floating_window_off_x = 1, -- adjust float windows x position. 
                             -- can be either a number or function
  floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
                              -- can be either number or function, see examples

  close_timeout = 4000, -- close floating window after ms when laster parameter is entered
  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "󰼈 ",  -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
  hint_scheme = "String",
  hint_inline = function() return false end,  -- should the hint be inline(nvim 0.10 only)?  default false
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none, or a table of borders
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = '<M-x>', -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
  toggle_key_flip_floatwin_setting = false, -- true: toggle float setting after toggle key pressed

  select_signature_key = '<M-n>', -- cycle to next signature, e.g. '<M-n>' function overloading
  move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
}
require'lsp_signature'.setup(cfg)
EOF

"configuring lspsaga
lua <<EOF
local keymap = vim.keymap.set

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
EOF

"markdown preview
" let g:mkdp_preview_options = {
" 	'katex': {
" 		'macros': {"\\R": "\\mathbb{R}"}
" 	},
" }

let g:mkdp_preview_options = {
    \ 'katex': {
		\ 'macros': {
			\ "\\R": "\\mathbb{R}",
			\ "\\E": "\\mathbb{E}",
			\ "\\Z": "\\mathbb{Z}",
			\ "\\norm": "\\lVert#1\\rVert",
        \ }
	\ },
\ }

"vim-markdown
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1

"loading telescope-fzf-native

lua << EOF

require('telescope').load_extension('fzf')

EOF

"setting up vimtex
let g:vimtex_view_method = 'zathura'
