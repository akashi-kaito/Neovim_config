return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- LSP名取得
      local lsp_names = function()
        local clients = {}
        for _, client in ipairs(vim.lsp.get_active_clients { bufnr = 0 }) do
          if client.name == 'null ls' then
            local sources = {}
            for _, source in ipairs(require('null ls.sources').get_available(vim.bo.filetype)) do
              table.insert(sources, source.name)
            end
            table.insert(clients, 'null ls(' .. table.concat(sources, ', ') .. ')')
          else
            table.insert(clients, client.name)
          end
        end
        return ' ' .. table.concat(clients, ', ')
      end

      -- 表示する
      require('lualine').setup {
        sections = {
          lualine_c = {{ 'filename', path = 1 }},
          lualine_x = { lsp_names },
          lualine_y = { 'encoding', 'fileformat', 'filetype' },
          lualine_z = { 'progress', 'location' },
        },
        options = { theme = 'onedark' }
      }
    end
  }
}
