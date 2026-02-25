return
{
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' }) -- Permet de chercher un fichier
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' }) -- Permet de chercher un mot
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' }) -- Permet de switch d'onglets dans tout ceux qui ont été ouverts
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end
}
