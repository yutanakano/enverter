local Terminal = require('toggleterm.terminal').Terminal

-- ターミナルの設定
local term = Terminal:new({
    cmd = vim.o.shell, -- ターミナルで使用するシェルを設定します
    direction = 'horizontal', -- ターミナルウィンドウを水平方向に表示します
    float_opts = {
        border = 'single', -- ターミナルウィンドウに枠線を表示します
        width = 100,
        height = 30,
    }  ,
})  

-- ショートカットキーを割り当てます
vim.api.nvim_set_keymap('n', '<Space>tm', '<cmd>lua term:toggle()<CR>', { noremap = true, silent = true })

-- ターミナルを起動する関数
function ToggleTerminal()
    term:toggle()
end

-- ショートカットキーに関数を割り当てます
vim.api.nvim_set_keymap('n', '<Space>tm', '<cmd>lua ToggleTerminal()<CR>', { noremap = true, silent = true })
