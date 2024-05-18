local opt = vim.opt
opt.guifont='Hack Nerd Font Mono:h11'
opt.number = true                                             
opt.autoindent = true  
opt.tabstop=2          
opt.shiftwidth=2       
opt.expandtab=true     
opt.splitright= true  
opt.ignorecase = true
opt.clipboard:append({clipboard=unnamedplus}) opt.hls=true     
opt.encoding='utf-8'  
opt.fileencodings='utf-8','sjis','iso-2022-jp','euc-jp' 
opt.fileformats='dos','unix','mac' 
opt.hidden=true        
opt.termguicolors=true
vim.opt.swapfile = false
