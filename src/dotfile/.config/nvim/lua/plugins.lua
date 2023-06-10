vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    use {'github/copilot.vim'}
end)