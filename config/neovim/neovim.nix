{
    config,
    pkgs,
    lib,
    ...
}:

let
  nvimPath = "${config.home.homeDirectory}/nixos-dotfiles/config/neovim/nvim";
in
{
  options = {
    neovim.enable = lib.mkEnableOption "enables Neovim";
  };

  config = lib.mkIf config.neovim.enable {
    home.sessionVariables = {
      EDITOR = "nvim";
      AIDER_EDITOR = "nvim";
    };
    home.packages = with pkgs; [
      ## LSPs

      # Python LSP
      python312Packages.mypy
      python312Packages.python-lsp-ruff
      python312Packages.rope
      python312Packages.yapf
      python312Packages.python-lsp-server
      pyright
      ruff

      # Lua LSP
      lua-language-server

      # YAML LSP
      yaml-language-server

      # Nix LSP
      nil
      nixfmt-rfc-style

      # Rust
      rust-analyzer
      rustfmt

      ];
    xdg.configFile."nvim/lua".source = config.lib.file.mkOutOfStoreSymlink "${nvimPath}/lua";
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraLuaConfig = ''
        ${builtins.readFile ./nvim/init.lua}
      '';
      plugins = with pkgs.vimPlugins; [
        # Telescope
        telescope-nvim
        telescope-fzf-native-nvim

        # Highlighting
        nvim-treesitter
        nvim-treesitter.withAllGrammars

        # Folder structure pane
        nvim-tree-lua
        nvim-web-devicons
	
	 # Snippets
        luasnip
        friendly-snippets

	# Comments
        comment-nvim
        todo-comments-nvim

        # Language Server Protocol (LSP)
        nvim-lspconfig

        # Markdown preview
        markdown-preview-nvim # :MarkdownPreviewToggle

        # Code completion
        nvim-cmp # main plugin for completion
        cmp_luasnip # source for snippet completion
        cmp-nvim-lsp # source for lsp completion
        cmp-buffer # source for buffer words completion
        cmp-path # source for path completion
        cmp-cmdline # source for vim's cmdline

	# Formatting
        conform-nvim

	# colorscheme
        oxocarbon-nvim

	 ];
    };
  };
}
