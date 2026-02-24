-- Activer les plugins et l'indentation par type de fichier
vim.cmd([[
  filetype plugin indent on
]])

-- Options générales
vim.opt.expandtab = true      -- Utiliser des espaces au lieu de tabulations
vim.opt.shiftwidth = 4        -- Nombre d'espaces pour l'indentation automatique
vim.opt.softtabstop = 4        -- Nombre d'espaces que <Tab> compte pour dans le mode insertion
vim.opt.tabstop = 4            -- Nombre d'espaces qu'une tabulation affiche
vim.opt.number = true          -- Afficher les numéros de ligne
vim.opt.relativenumber = true  -- Afficher les numéros de ligne relatifs
vim.opt.smartindent = true     -- Indentation intelligente
vim.opt.showmatch = true       -- Montrer la parenthèse correspondante
vim.opt.backspace = { "indent", "eol", "start" } -- Comportement de la touche backspace
vim.opt.syntax = "on"          -- Activer la coloration syntaxique

