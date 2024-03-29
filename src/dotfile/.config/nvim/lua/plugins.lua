vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    use {'github/copilot.vim'}
    use {'neoclide/coc.nvim'}
    use {'akinsho/toggleterm.nvim'}
end)