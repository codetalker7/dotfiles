"loa ./lua/plugins.lua
lua require('plugins')

"setup nvim-cmp
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

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
EOF

"setup Shade.nvim
lua <<EOF
  require'shade'.setup({
    overlay_opacity = 50,
    opacity_step = 1,
    keys = {
      brightness_up    = '<C-Up>',
      brightness_down  = '<C-Down>',
      toggle           = '<Leader>s',
    }
  }) 
EOF

"setup dracula theme
let starry_bold = v:true  "set to false to disable bold globally
let starry_italic = v:true "set to false to disable italic globally
let starry_italic_comments = v:true
let starry_italic_string = v:false
let starry_italic_keywords = v:false
let starry_italic_functions = v:false
let starry_italic_variables = v:false
let starry_contrast = v:true
let starry_borders = v:false
let starry_disable_background = v:false  "set to true to disable background and allow transparent background
let starry_style_fix=v:true  "disable random loading
let starry_style="moonlight"  "load moonlight everytime or
let starry_darker_contrast=v:true  "darker background
let starry_deep_black=v:false       "OLED deep black
let starry_italic_keywords=v:false
let starry_italic_functions=v:false
let starry_set_hl=v:false " Note: enable for nvim 0.6+, it is faster (loading time down to 4~6s from 7~11s), but it does
" not overwrite old values and may has some side effects
let starry_daylight_switch=v:false  "this allow using brighter color
" other themes: dracula, oceanic, dracula_blood, 'deep ocean', darker, palenight, monokai, mariana, emerald, middlenight_blue 
colorscheme dracula
