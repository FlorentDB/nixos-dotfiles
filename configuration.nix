# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

# Bluetooth 
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; # optional, powers up on boot
  services.blueman.enable = true; # optional GUI manager

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Flakes enabling
  nix.settings.experimental-features = [ "nix-command" "flakes"];	

  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";


  programs.hyprland = {
    enable= true;
    xwayland.enable = true;
    withUWSM = true;
    };

  security.pam.services.hyprlock = {};

  programs.zsh.enable = true;

console.keyMap = "fr";
services.xserver.enable = true;
services.xserver.xkb.layout = "fr";

services.displayManager.sddm = {
  enable = true;
  wayland.enable = true;
};

# Enable sound.
 #services.pulseaudio.enable = true;
  # OR
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

# Sleep when close screen
services.logind = {
  lidSwitch = "suspend";
  lidSwitchExternalPower = "suspend"; # ou "ignore" si branché
};

# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.florent = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "input" "docker"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  programs.nix-ld.enable = true;
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    wget
    zip
    unzip 
    alacritty
    btop
    pcmanfm
    git
    fastfetch
    foot
    kitty
    discord
    
    swayosd
    # Applications pour Hyprland (Wayland)
    kdePackages.dolphin
    waybar      # Barre de statut pour Wayland
    hyprpaper  # Gestion du fond d'écran pour Hyprland
    wofi        # Lanceur d'applications pour Wayland (équivalent de rofi)
    dunst       # Daemon de notifications
    grim        # Outil de capture d'écran pour Wayland
    slurp       # Sélection de zone d'écran pour Wayland
    wl-clipboard # Presse-papier pour Wayland
  ];

fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  
  virtualisation.docker.enable = true;

  services.tailscale.enable = true;
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}

