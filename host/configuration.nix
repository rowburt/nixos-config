{ pkgs, ... }:

{
  imports = [
    # Include results of the hardware scan
    ./hardware-configuration.nix

    # Include disko disk configuration
    ./disk-config.nix

    # Include system modules
    ./modules
  ];

  # Enable bootloader, disko will manage our boot and encrypted partitions for us
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

  # Set locale values
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

  # Configure networking
  networking = {
    networkmanager.enable = true;
    hostName = "envy";
  };

  # Configure hardware
  hardware = {
    graphics.enable = true;

    # Enable OpenCL support on AMD hardware
    graphics.extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];

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

  # Automatically clean up nix and enable experimental features
  nix = {
    optimise.automatic = true;

    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 21d";
    };
  };

  # Configure user account
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

  environment.shells = [ pkgs.zsh ];

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
    flatpak.enable = true;
    # Disable because we are using auto-cpufreq
    power-profiles-daemon.enable = false;

    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "ondemand";
          turbo = "off";
        };

        charger = {
          governor = "ondemand";
          turbo = "auto";
        };
      };
    };

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

    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];

      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  # Version of NixOS used for installation
  system.stateVersion = "24.05";
}
