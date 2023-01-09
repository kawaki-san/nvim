function set_colourscheme(colour)
    colour = colour or "everforest"

    -- configure theme options
    everforest_opts()

    vim.cmd.colorscheme(colour)
    if colour == 'everforest' then
        vim.api.nvim_set_hl(0, 'StatusLine', { bg = transparent })
    end
end

function everforest_opts()
    vim.g.everforest_transparent_background = 1
    vim.g.everforest_diagnostic_text_highlight = 1
    vim.g.everforest_background = 'hard'
    vim.g.everforest_enable_italic = 1
end

set_colourscheme()
