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
  
  -- using bufferline
  use {'akinsho/bufferline.nvim', tag = "*",
  requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup{}
    end,
  }

end)
