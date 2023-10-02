vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true })  
vim.api.nvim_set_keymap('n', '<C-J>', ':bnext<CR>', { noremap = true })   
vim.api.nvim_set_keymap('n', '<C-K>', ':bprev<CR>', { noremap = true })   


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

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
-- ノーマルモードでimeをオフにする
vim.cmd([[
  autocmd InsertLeave * :call system('C:\Users\akashi-kaito.KEYWAREGROUP\AppData\Local\nvim\lua\zenhan.exe 0')
]])
