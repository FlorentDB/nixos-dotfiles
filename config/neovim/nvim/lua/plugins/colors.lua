require("gruvbox").setup({
    terminal_colors = true,
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    contrast = "hard",       -- "hard", "soft" ou "" pour le défaut
    transparent_mode = true, -- fond transparent comme tu avais avant
    inverse = true,
    dim_inactive = false,
    overrides = {
        -- tu peux customiser des groupes spécifiques ici
        -- exemple : rendre les commentaires moins fades
        Comment = { fg = "#928374", italic = true },
        -- exemple : fond de la ligne courante
        CursorLine = { bg = "#3c3836" },
    },
})

vim.o.background = "dark" -- ou "light" pour le thème clair
vim.cmd("colorscheme gruvbox")
