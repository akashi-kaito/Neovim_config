vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true })  
vim.api.nvim_set_keymap('n', '<C-J>', ':bnext<CR>', { noremap = true })   
vim.api.nvim_set_keymap('n', '<C-K>', ':bprev<CR>', { noremap = true })   

-- telescopeのキーマップ
vim.api.nvim_set_keymap(
  'n',
  '<space>ff',
  ":Telescope find_files<CR>",
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

--ターミナルをインサートモードで開く
vim.cmd([[
  command! -nargs=* Vter split | wincmd j | resize 20 | terminal
]])
-- ターミナル起動時はESCでコマンドモードへ移行する
vim.cmd([[
  autocmd TermOpen * startinsert
]])
