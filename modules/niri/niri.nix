{ config, lib, pkgs, ... }:

{
    xdg.configFile."niri/config.kdl".source = config.lib.file/mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/niri/config.kdl";
    xdg.configFile."niri/config.kdl".force = true;
}

