{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./app-config.nix
      ./regionalization.nix
    ];

# Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;


# features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

# Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "paula"; # Define your hostname.


# Enable networking
  networking.networkmanager.enable = true;


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };


  # Enable touchpad support (enabled default in most desktopManager).
services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.paula = {
    isNormalUser = true;
    description = "teo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      vim
      firefox
      neovim
      kdePackages.kate
    #  thunderbird
    ];
  };
# Programs
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
  # apps
    obsidian
    spotify
  # tools
    gparted
    ventoy-full
  # services
    git
    vim
    zip
    unzip
    tlp
  ];

  powerManagement.powertop.enable = true;
  services.thermald.enable = true;

  system.stateVersion = "24.11";

}
