require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cmake", "zig" },
    sync_install = true,
    auto_install = true
}

local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
ts_update()
