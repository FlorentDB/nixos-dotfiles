{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    hypr = "hypr";
    waybar = "waybar";
    wofi = "wofi";
    kitty = "kitty";
    qtile = "qtile";
    nvim = "nvim";
    fastfetch = "fastfetch";

  };
in
{
  home.username = "florent";
  home.homeDirectory = "/home/florent";
  home.stateVersion = "25.05";

  # Cursor
  home.pointerCursor = {
    name = "volantes_cursors";
    package = pkgs.volantes-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  programs.zsh = {
  enable = true;

  shellAliases = {
    pipi = "echo le caca il a fait pipi";
    nrs = "nixos-rebuild switch";
    snrs = "sudo nixos-rebuild switch";   
    snrsf = "sudo nixos-rebuild switch --flake .#";
    vim = "nvim";
    hms = "home-manager switch"; 
    };

  oh-my-zsh = {
    enable = true;
    theme = "daveverwer";
    plugins = [ "git" "sudo" "z" ];
  };

  initExtra = ''
    #  customisations zsh  
    export EDITOR="nvim"
    export PATH="$HOME/.local/bin:$PATH"
    '';

  # Equivalent du profileExtra bash → lancé au login
  loginExtra = ''
    if uwsm check may-start; then
      exec uwsm start hyprland.desktop
    fi
  '';
};

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
      font.normal = {
        family = "JetBrains Mono";
        style = "Regular";
      };
      font.size = 10;
    };
  };

  services.hypridle.enable = true;
  services.hyprsunset.enable = true;
  services.blueman-applet.enable = true;
  services.network-manager-applet.enable = true;

  home.file.".config/bat/config".text = ''
    --theme="Nord"
    --style="numbers,changes,grid"
    --paging=auto
  '';

  home.packages = with pkgs; [
    bat
    hyprlock
    neovim
    (writeShellScriptBin "screenshot" ''
      FILE=~/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png
      mkdir -p ~/Pictures/Screenshots
      grim -g "$(slurp)" "$FILE" && wl-copy < "$FILE" && notify-send "Screenshot" "Copié dans le presse-papier"
    '')
  ];

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;
}
