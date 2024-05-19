return {
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function(_)
      require('nvim-treesitter.configs').setup({
        auto_install = true,
        highlight = { endable = true }

      })
      local bufferline = require('bufferline')
      bufferline.setup{
        options = {
          numbers=function(opts)
            return string.format('%s', opts.id)
          end,
        },
      }
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      "nvim-telescope/telescope-file-browser.nvim",
    },
   config = function(_, opts)
      require("telescope").setup{
        extensions = {
           file_browser = {
             theme = "ivy",
             -- disables netrw and use telescope-file-browser in its place
             hijack_netrw = true,
           },
         },
      }
      require("telescope").load_extension "file_browser"
    end,
  },
}
