{ config, pkgs, ... }:

{
    stylix = {
        enable = true;
        image = ./wallpapers/wallpaper.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
        polarity = "dark";
        fonts = {
            monospace = {
                package = pkgs.nerd-fonts.jetbrains-mono;
                name = "JetBrainsMono Nerd Font";
            };
            sansSerif = {
                package = pkgs.inter;
                name = "Inter";
            };
            serif = {
                package = pkgs.inter;
                name = "Inter";
            };
            sizes = {
                applications = 11;
                terminal = 12;
                desktop = 11;
            };
        };
        targets.ghostty.enable = false;
    };
}
