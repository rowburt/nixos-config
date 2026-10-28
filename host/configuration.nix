{ pkgs, inputs, ... }:

{
  imports = [
    # Include results of the hardware scan
    ./hardware-configuration.nix

    # Include disko disk configuration
    inputs.disko.nixosModules.disko
    ./disk-config.nix

    # Include system modules
    ./modules
  ];

  # Enable bootloader, disko manages boot and encrypted partitions
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "btrfs" ];

    loader = {
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;
        editor = false;
        memtest86.enable = true;
      };
    };
  };

  # Set user timezone from https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  time.timeZone = "Europe/Amsterdam";

  nixpkgs.config.allowUnfree = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "nl_NL.UTF-8";
      LC_IDENTIFICATION = "nl_NL.UTF-8";
      LC_MEASUREMENT = "nl_NL.UTF-8";
      LC_MONETARY = "nl_NL.UTF-8";
      LC_NAME = "nl_NL.UTF-8";
      LC_NUMERIC = "nl_NL.UTF-8";
      LC_PAPER = "nl_NL.UTF-8";
      LC_TELEPHONE = "nl_NL.UTF-8";
      LC_TIME = "nl_NL.UTF-8";
    };
  };

  networking = {
    networkmanager.enable = true;
    hostName = "sakura";
  };

  hardware = {
    amdgpu.opencl.enable = true;
    graphics.enable = true;

    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General.Experimental = true;
    };
  };

  security = {
    apparmor.enable = true;
    polkit.enable = true;
    rtkit.enable = true;
  };

  nix.settings = {
    cores = 2;

    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  users.users.robert = {
    description = "Robert";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];

    ignoreShellProgramCheck = true;
    shell = pkgs.zsh;
  };

  environment = {
    shells = [ pkgs.zsh ];
    sessionVariables.XDG_CONFIG_HOME = "$HOME/.config";
  };

  # Automatically add flathub repo to flatpak
  # https://nixos.wiki/wiki/Flatpak
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # Configure useful services
  services = {
    power-profiles-daemon.enable = false;
    flatpak.enable = true;

    # TODO: Look into and maybe disable to reduce disk wear
    btrfs.autoScrub = {
      enable = true;
      fileSystems = [ "/" ];
      interval = "weekly";
    };

    displayManager.autoLogin = {
      enable = true;
      user = "robert";
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
    };

    # TODO: Configure TLP & thermald https://wiki.nixos.org/wiki/Laptop
    thermald.enable = true;
    tlp = import ./modules/tlp.nix;
  };

  # Version of NixOS used for installation
  system.stateVersion = "24.05";
}
