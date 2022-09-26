local map = vim.api.nvim_set_keymap
local au = vim.api.nvim_create_autocmd
local default_opts = {noremap = true, silent = true}

map('n',  '<F6>',  ':Ttoggle<CR>', { noremap = true,  silent = false })
map('t',  '<F6>',  '<C-\\><C-n>' , { noremap = true,  silent = true })

map('n',  '<Right>', '<C-W>l', { noremap = true,  silent = true })
map('n',  '<Left>',  '<C-W>h', { noremap = true,  silent = true })
map('n',  '<Up>',    '<C-W>k', { noremap = true,  silent = true })
map('n',  '<Down>',  '<C-W>j', { noremap = true,  silent = true })

map('n', 'H', '^', { noremap = true, silent = true })

map('n', '<A-l>', '<C-i>', default_opts)
map('n', '<A-h>', '<C-o>', default_opts)

map('n', 'Q', '@@', default_opts)


au({"FileType rust", "Filetype toml"}, { callback = function()
    map('n', '<F1>',  ':RustFmt<CR>',                                              default_opts)
    map('n', '<F13>', ':AbortDispatch<CR>',                                        default_opts)
    map('n', '<F4>',  ':Dispatch cargo clippy --workspace --tests --examples<CR>', default_opts)
    map('n', '<F7>',  ':Dispatch cargo build --workspace<CR>',                     default_opts)
    map('n', '<F8>',  ':Dispatch cargo test --workspace<CR>',                      default_opts)
end })

map('n', ';', '<Plug>(clever-f-repeat-forward)', default_opts)
map('n', ',', '<Plug>(clever-f-repeat-back)',    default_opts)

map('n', '/',         '<Plug>(easymotion-sn)',  default_opts)
map('o', '/',         '<Plug>(easymotion-tn)',  default_opts)
map('n', 'n',         '<Plug>(easymotion-next)', default_opts)
map('n', 'N',         '<Plug>(easymotion-prev)', default_opts)
map('n', '<Leader>n', '<Plug>(easymotion-bd-jk)',default_opts)
map('n', '<Leader>w', '<Plug>(easymotion-bd-w)', default_opts)

map('n', '<Leader>\'', ':Marks<CR>',   default_opts)
map('n', '<Leader>;',  ':Buffers<CR>', default_opts)
map('n', '<Leader>F',  ':Files<CR>',   default_opts)
map('n', '<Leader>f',  ':GFiles<CR>',  default_opts)

map('n', '<Leader>L',  ':Lines<CR>',   default_opts)
map('n', '<Leader>l',  ':BLines<CR>',  default_opts)

map('n', '<Leader>T',  ':Tags<CR>',    default_opts)
map('n', '<Leader>c',  ':BCommits<CR>',default_opts)
map('n', '<Leader>h',  ':History<CR>', default_opts)

map('n', '<Leader>t',  ':BTags<CR>',   default_opts)
map('n', '<Leader>/',  ':Rg<Space>',   default_opts)

map('n', '<A-1>', ':NERDTreeFind<CR>', default_opts)
map('n', '<A-2>', ':TagbarToggle<CR>', default_opts)

