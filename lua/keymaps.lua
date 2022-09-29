local map = vim.api.nvim_set_keymap
local vim_map = vim.keymap.set
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

vim_map('n', '[d', vim.diagnostic.goto_prev, default_opts)
vim_map('n', '<space>e', vim.diagnostic.open_float, default_opts)
vim_map('n', ']d', vim.diagnostic.goto_next, default_opts)
vim_map('n', '<space>q', vim.diagnostic.setloclist, default_opts)

local lsp_flags = {
  debounce_text_changes = 150,
}
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim_map('n', 'gd', vim.lsp.buf.definition, bufopts)
vim_map('n', 'K', vim.lsp.buf.hover, bufopts)
vim_map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
vim_map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
vim_map('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
vim_map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
vim_map('n', '<space>rn', vim.lsp.buf.rename, bufopts)
vim_map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
vim_map('n', 'gr', vim.lsp.buf.references, bufopts)
vim_map('n', '<space>f', vim.lsp.buf.formatting, bufopts)

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
      ["rust-analyzer"] = {}
    }
}

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
