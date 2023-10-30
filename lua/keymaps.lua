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

au("Filetype", { pattern = "rust", callback = function()
    local crates = require('crates')
    local opts = { noremap = true, silent = true }

    vim_map('n', '<leader>ct', crates.toggle,                  opts)
    vim_map('n', '<leader>cr', crates.reload,                  opts)
    vim_map('n', '<leader>cv', crates.show_versions_popup,     opts)
    vim_map('n', '<leader>cf', crates.show_features_popup,     opts)
    vim_map('n', '<leader>cd', crates.show_dependencies_popup, opts)
    vim_map('n', '<leader>cu', crates.update_crate,            opts)
    vim_map('v', '<leader>cu', crates.update_crates,           opts)
    vim_map('n', '<leader>ca', crates.update_all_crates,       opts)
    vim_map('n', '<leader>cU', crates.upgrade_crate,           opts)
    vim_map('v', '<leader>cU', crates.upgrade_crates,          opts)
    vim_map('n', '<leader>cA', crates.upgrade_all_crates,      opts)
    vim_map('n', '<leader>cH', crates.open_homepage,           opts)
    vim_map('n', '<leader>cR', crates.open_repository,         opts)
    vim_map('n', '<leader>cD', crates.open_documentation,      opts)
    vim_map('n', '<leader>cC', crates.open_crates_io,          opts)
    vim_map('n', 'K',          crates.show_popup,              opts)

    map('n', '<F1>',  ':RustFmt<CR>',                                              default_opts)
    map('n', '<F13>', ':AbortDispatch<CR>',                                        default_opts)
    map('n', '<F4>',  ':Dispatch cargo clippy --workspace --tests --examples<CR>', default_opts)
    map('n', '<F7>',  ':Dispatch cargo build --workspace<CR>',                     default_opts)
    map('n', '<F8>',  ':Dispatch cargo nextest run --workspace<CR>',               default_opts)
    map('n', '<F9>',  ':Dispatch cargo run<CR>',                                   default_opts)
end })



au("FileType", { 
    pattern = "toml",
    callback = function()
        map('n', '<F1>',  ':RustFmt<CR>',                                              default_opts)
        map('n', '<F13>', ':AbortDispatch<CR>',                                        default_opts)
        map('n', '<F4>',  ':Dispatch cargo clippy --workspace --tests --examples<CR>', default_opts)
        map('n', '<F7>',  ':Dispatch cargo build --workspace<CR>',                     default_opts)
        map('n', '<F8>',  ':Dispatch cargo nextest run --workspace<CR>',                           default_opts)
        map('n', '<F9>',  ':Dispatch cargo run<CR>',                                   default_opts)
end })

map('n', ';', '<Plug>(clever-f-repeat-forward)',  default_opts)
map('n', ',', '<Plug>(clever-f-repeat-back)',     default_opts)

map('n', '/',         '<Plug>(easymotion-sn)',    default_opts)
map('o', '/',         '<Plug>(easymotion-tn)',    default_opts)
map('n', 'n',         '<Plug>(easymotion-next)',  default_opts)
map('n', 'N',         '<Plug>(easymotion-prev)',  default_opts)
map('n', '<Leader>n', '<Plug>(easymotion-bd-jk)', default_opts)
map('n', '<Leader>w', '<Plug>(easymotion-bd-w)',  default_opts)

local telescope_builtin = require('telescope.builtin')
vim_map('n', '<Leader>f',  telescope_builtin.git_files, {})
vim_map('n', '<Leader>F',  telescope_builtin.find_files, {})
vim_map('n', '<Leader>;',  telescope_builtin.buffers, {})
vim_map('n', '<Leader>\'', telescope_builtin.marks, {})
vim_map('n', '<Leader>T',  telescope_builtin.tags, {})
vim_map('n', '<Leader>h',  telescope_builtin.oldfiles, {})
vim_map('n', '<Leader>l',  telescope_builtin.current_buffer_fuzzy_find, {})
vim_map('n', '<Leader>r',  telescope_builtin.registers, {})
vim_map('n', '<Leader>b',  telescope_builtin.git_branches, {})

map('n', '<Leader>i', ":Octo issue list<CR>", {})
map('n', '<Leader>p', ":Octo pr list<CR>", {})

map('n', '<Leader>t',  ':BTags<CR>',   default_opts)
--map('n', '<Leader>/',  ':Rg<Space>',   default_opts)
vim_map('n', '<Leader>/', telescope_builtin.live_grep, {})

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

vim_map('n', '<A-d>', vim.lsp.buf.type_definition, bufopts)
vim_map('n', '<A-r>', vim.lsp.buf.rename, bufopts)
vim_map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)

-- vim_map('n', '<space>f', vim.lsp.buf.formatting, bufopts)
vim_map('n', 'gr', telescope_builtin.lsp_references, {})

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
      ["rust-analyzer"] = {}
    }
}

local dap = require('dap')
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
dap.adapters.codelldb = {
  type = 'server',
  port = "13000",
  executable = {
    command = '/bin/codelldb',
    args = {"--port", "13000"},
  }
}

local rt = require("rust-tools")
rt.setup({
    tools = {
        executor = require("rust-tools/executors").termopen,
        on_initialized = nil,

        reload_workspace_from_cargo_toml = true,

        inlay_hints = {
          auto = true,

          only_current_line = false,
          show_parameter_hints = true,
          parameter_hints_prefix = "<- ",
          other_hints_prefix = "=> ",
          max_len_align = false,
          max_len_align_padding = 1,

          -- padding from the right if right_align is true
          right_align_padding = 7,

          -- The color of the hints
          highlight = "Comment",
        },

        -- options same as lsp hover / vim.lsp.util.open_floating_preview()
        hover_actions = {

          -- the border that is used for the hover window
          -- see vim.api.nvim_open_win()
          border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
          },

          -- whether the hover action window gets automatically focused
          -- default: false
          auto_focus = false,
        },

        -- settings for showing the crate graph based on graphviz and the dot
        -- command
        crate_graph = {
          -- Backend used for displaying the graph
          -- see: https://graphviz.org/docs/outputs/
          -- default: x11
          backend = "x11",
          -- where to store the output, nil for no output stored (relative
          -- path from pwd)
          -- default: nil
          output = nil,
          -- true for all crates.io and external crates, false only the local
          -- crates
          -- default: true
          full = true,

          -- List of backends found on: https://graphviz.org/docs/outputs/
          -- Is used for input validation and autocompletion
          -- Last updated: 2021-08-26
          enabled_graphviz_backends = {
            "bmp",
            "cgimage",
            "canon",
            "dot",
            "gv",
            "xdot",
            "xdot1.2",
            "xdot1.4",
            "eps",
            "exr",
            "fig",
            "gd",
            "gd2",
            "gif",
            "gtk",
            "ico",
            "cmap",
            "ismap",
            "imap",
            "cmapx",
            "imap_np",
            "cmapx_np",
            "jpg",
            "jpeg",
            "jpe",
            "jp2",
            "json",
            "json0",
            "dot_json",
            "xdot_json",
            "pdf",
            "pic",
            "pct",
            "pict",
            "plain",
            "plain-ext",
            "png",
            "pov",
            "ps",
            "ps2",
            "psd",
            "sgi",
            "svg",
            "svgz",
            "tga",
            "tiff",
            "tif",
            "tk",
            "vml",
            "vmlz",
            "wbmp",
            "webp",
            "xlib",
            "x11",
          },
        },
  },
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<A-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<A-a>", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter('/bin/codelldb', '/usr/lib/liblldb.so'),
      },
})

local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")

local delta_bcommits = previewers.new_termopen_previewer({
	get_command = function(entry)
		return {
			"git",
			"-c",
			"core.pager=delta",
			"-c",
			"delta.side-by-side=false",
			"diff",
			entry.value .. "^!",
			"--",
			entry.current_file,
		}
	end,
})

local delta = previewers.new_termopen_previewer({
	get_command = function(entry)
		return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value .. "^!" }
	end,
})

Delta_git_commits = function(opts)
	opts = opts or {}
	opts.previewer = {
		delta,
		previewers.git_commit_message.new(opts),
		previewers.git_commit_diff_as_was.new(opts),
	}
	builtin.git_commits(opts)
end

Delta_git_bcommits = function(opts)
	opts = opts or {}
	opts.previewer = {
		delta_bcommits,
		previewers.git_commit_message.new(opts),
		previewers.git_commit_diff_as_was.new(opts),
	}
	builtin.git_bcommits(opts)
end

vim_map("n", '<Leader>c', "<cmd>lua Delta_git_bcommits()<CR>", default_opts)
-- vim_map('n', '<Leader>c',  telescope_builtin.git_bcommits, {})
