{ config, pkgs, ... }:

{
    home.username = "zakme";
    home.homeDirectory = "/home/zakme";
    home.stateVersion = "25.11";

    imports = [
        ./modules
    ];

    home.packages = with pkgs; [
        btop
        matugen
        fastfetch
        telegram-desktop
        spotify
        cava
        cmatrix
        wl-clipboard
        discord
        libreoffice-still
        lutris
        wowup-cf
    ];

    gtk = {
        enable = true;
        iconTheme = {
            name = "Adwaita";
            package = pkgs.adwaita-icon-theme;
        };
    };

    programs = {
        fuzzel.enable = true;
        swaylock.enable = true;
    };

    services = {
        mako.enable = true;
        swayidle.enable = true;
    };

    programs.home-manager.enable = true;
}

