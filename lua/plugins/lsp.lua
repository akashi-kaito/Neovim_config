return{
  {
    "neovim/nvim-lspconfig",
    config=function()
      require("mason-lspconfig").setup()
    end
  },
  {
    "williamboman/mason.nvim" ,
     config=function()
       require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
          }
      end
      }
    end
  },
  {
     'hrsh7th/nvim-cmp',
     dependencies ={
       'hrsh7th/cmp-nvim-lsp',
       'hrsh7th/cmp-buffer',
       'hrsh7th/cmp-path',
       'hrsh7th/vim-vsnip',
       'hrsh7th/cmp-vsnip',
       'onsails/lspkind.nvim',
    },
    config = function()
      local lspkind = require('lspkind')
      local cmp = require('cmp')

      -- 補完
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = 'vsnip' },
        },
        experimental = {
          ghost_text = false,
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
          })
        }
      })

      -- バッファの補完
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- コマンドラインの補完
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "path" },
        },
      })

    end
  },
}

