require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'one_monokai',
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        --component_separators = { left = "", right = "" },
        --section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 1
            }
        },
    },
    tabline = {
        lualine_a = {
            {
                'tabs',
                use_mode_colors = true,
                mode = 2,
                max_length = vim.o.columns --/ 2
            }
        },
    }
})
