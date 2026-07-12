{ config, pkgs, ... }:

{
    stylix = {
        enable = true;
        image = builtins.toPath "/home/zakme/Pictures/Wallpapers/wallpaper.png";
        polarity = "dark";
    };
}
