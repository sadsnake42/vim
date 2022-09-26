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
opt.foldnestmax=10
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

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
      ["rust-analyzer"] = {}
    }
}
