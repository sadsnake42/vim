local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options
local var = vim.api.nvim_set_var

-- g.langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
opt.backspace=indent,eol,start                 -- backspace removes all (indents, EOLs, start) What is start?
opt.conceallevel=1
opt.confirm=true
opt.expandtab=true                                  -- expand tabs into spaces
opt.exrc=true                                       -- enable usage of additional .vimrc files from working directory
opt.filetype="on"                                   -- required
opt.foldlevel=1
opt.foldmethod="indent"
opt.foldnestmax=0
opt.guifont="Fura Code Medium Nerd Font 20"
opt.hidden=true
opt.iminsert=0
opt.imsearch=0
opt.incsearch=true                                  -- incremental search
opt.laststatus=2
opt.linebreak=true
opt.number=true
opt.relativenumber=true                      -- show line numbers
opt.ruler=true
opt.scrolloff=50                               -- let 10 lines before/after cursor during scroll
opt.secure=true                                 -- prohibit .vimrc files to execute shell, create files, etc...
opt.shell="/bin/zsh"
opt.shiftwidth=4                               -- shift lines by 4 spaces
opt.showmatch=true                                  -- shows matching part of bracket pairs (), [], {}
opt.smarttab=true                                   -- set tabs for a shifttabs logic
opt.spell=true
opt.spelllang=en,ru
opt.tabstop=4                                  -- 4 whitespaces for tabs visual presentation
opt.timeoutlen=1000 ttimeoutlen=0
opt.ttyfast=true                                    -- terminal acceleration set autoindent                           -- indent when moving to the next line while writing code
opt.undofile=true

cmd([[
	set noswapfile
	set nobackup
	set nocompatible
	set nohlsearch
	set nolist
	set nowrap
	set t_Co=256
]])


vim.cmd([[colorscheme gruvbox]])
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})

exec([[
    hi clear CursorLine
    hi CursorLine gui=underline cterm=underline
    set cursorline

    highlight LineNr ctermfg=grey
    highlight lCursor guifg=NONE guibg=Cyan

    augroup CustomCursorLine
        au!
        au ColorScheme * :hi! CursorLine gui=underline cterm=underline
    augroup END
]], false)

var('neoterm_default_mod' ,'belowright')
var('neoterm_size', '20')

var('rustfmt_command',  "/home/q99/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rustfmt")

var('webdevicons_enable_nerdtree', '1')

var('LanguageClient_serverCommands', '{ \'rust\': [\'rust-analyzer\'] }')

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
      ["rust-analyzer"] = {}
    }
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

local servers = { 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

local luasnip = require 'luasnip'
local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- require("startup").setup({theme = "evil"})
require('hardline').setup {}
