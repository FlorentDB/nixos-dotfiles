return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function ()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
	    highlight = {
		enable = true,
	    },
	    indent = {
		enable = true,
	    },
	    autotage = {
		enable = true,
	    },
	    ensure_installed = {
		"json", "python", "rust",
		"yaml", "html", "css",
		"markdown", "markdown_inline",
		"bash", "lua", "vim", "vimdoc",
		"c", "dockerfile", "gitignore",
		},
	    auto_install = false,
	})
    end
}
