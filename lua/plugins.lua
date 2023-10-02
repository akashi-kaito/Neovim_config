vim.cmd[[packadd packer.nvim]]

-- 使用するプラグインを以下に記載していく
return require('packer').startup(function(use)
  -- Packer manage itself
  use 'wbthomason/packer.nvim'

  -- using telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { 
      {'nvim-lua/plenary.nvim'},
      {'nvim-treesitter/nvim-treesitter'}
    }
  }
  
  -- ファイラープラグイン 
  use {
      "nvim-telescope/telescope-file-browser.nvim",
      config = function()
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
  }

  -- using bufferline
  use {'akinsho/bufferline.nvim', tag = "*",
  requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup{}
    end,
  }

end)
