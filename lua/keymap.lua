vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', ':bprev<CR>', { noremap = true })

-- 下半分にターミナルを開く
vim.cmd([[
  command! -nargs=* Vter split | wincmd j | resize 20 | terminal
]])
--ターミナルをインサートモードで開く
vim.cmd([[
  autocmd TermOpen * startinsert
]])
-- telescopeのキーマップ
vim.api.nvim_set_keymap(
  'n',
  '<space>ff',
  ":Telescope find_files hidden=true<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<space>fg',
  ":Telescope live_grep<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<space>fb',
  ":Telescope buffers<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<space>fb',
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)


-- LSP起動時のキーマップ
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local set = vim.keymap.set
    -- LSP共通の設定
    set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = true })
    set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = true })
    set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = true })
    set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = true })
    set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { buffer = true })
    set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = true })
    set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = true })
    set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = true })
    set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { buffer = true })
    set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", { buffer = true })
    set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", { buffer = true })
    set("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", { buffer = true })
    set("n", "<space>;f", "<cmd>lua vim.lsp.buf.formatting()<CR>", { buffer = true })

    -- 言語ごとの設定
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- java
    if client and 'jdtls' == client.name then

      local bufopts = { noremap=true, silent=true, buffer = args.buf}
      -- set("n", "<space>;i", [[<cmd>lua require('lspconfig').jdtls.organize_imports()<CR>]], bufopts)

    end

  end
})

-- 補完のキーマップ
local cmp = require("cmp")
cmp.mapping = cmp.mapping.preset.insert({
  ["<C-p>"] = cmp.mapping.select_prev_item(),
  ["<C-n>"] = cmp.mapping.select_next_item(),
  ['<C-l>'] = cmp.mapping.complete(),
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ['<C-e>'] = cmp.mapping.close(),
  ["<CR>"] = cmp.mapping.confirm { select = false },
})

