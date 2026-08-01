{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nbfc.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernel.sysctl."vm.swappiness" = 100;

#  boot.extraModulePackages = [ config.boot.kernelPackages.wireguard ];

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;

  services.power-profiles-daemon.enable = true;

  services.upower.enable = true;

  time.timeZone = "Europe/Dublin";

  zramSwap = {
    enable = true;
    priority = 999;
    algorithm  = "zstd";
    memoryPercent = 50;
  };

  swapDevices = [
    {
      device = "/dev/nvme0n1p2";
      priority = 1;
    }
  ];

  services.greetd = {
	enable = true;
	settings = {
		default_session = {
			command = "${config.programs.niri.package}/bin/niri-session";
			user = "zakme";
		};
	};
  };

  systemd.user.services.niri.enableDefaultPath = false;
	
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "ru_RU.UTF-8/UTF-8"
  ];

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  services.pipewire = {
     enable = true;
     audio.enable = true;
     pulse.enable = true;
     alsa = {
         enable = true;
         support32Bit = true;
     };
     jack = {
         enable = true;
     };
  };

  services.libinput.enable = true;

  users.users.zakme = {
     isNormalUser = true;
     extraGroups = [ "wheel" "input" ]; # Enable ‘sudo’ for the user.
     shell = pkgs.zsh;
     packages = with pkgs; [
       tree
     ];
  };

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
	enable = true;
	enable32Bit = true;
  };

  hardware.nvidia = {
	modesetting.enable = true;	
	powerManagement.enable = false;
	open = false;
	nvidiaSettings = true;
	prime = {
		offload = {
			enable = true;
			enableOffloadCmd = true;	
		};
		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:1:0:0";
	};	
	package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  environment.sessionVariables = {
	WLR_NO_HARDWARE_CURSORS = "1";
	NIXOS_OZONE_WL = "1";
	LIBVA_DRIVER_NAME = "nvidia";
	GBM_BACKEND = "nvidia-drm";
	__GLX_VENDOR_LIBRARY_NAME = "nvidia";
	XDG_SESSION_TYPE = "wayland";
	WLR_RENDER = "vulkan";
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = {};

  programs.firefox.enable = true;

  programs.steam = {
	enable = true;
	remotePlay.openFirewall = true;
	dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [
        proton-ge-bin
    ];
  };

  programs.niri.enable = true;

  programs.zsh.enable = true;

  services.flatpak.enable = true;

  xdg.portal = {
        enable = true;
        extraPortals = [
            pkgs.xdg-desktop-portal-gnome
            pkgs.xdg-desktop-portal-gtk
        ];
        config.common.default = "*";
  };

  environment.systemPackages = with pkgs; [
     wget
     easyeffects
     pavucontrol
     xwayland-satellite
  ];

  fonts.packages = with pkgs; [
     nerd-fonts.jetbrains-mono	
  ];

  boot.kernelParams = [ "ec_sys.write.support=1" "nvidia-drm.fbdev=1" ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

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

  system.stateVersion = "25.11"; # Did you read the comment?

}

