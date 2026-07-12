{ ... }:
{
    programs.ghostty = {
        enable = true;
        settings = {
            gtk-titlebar = false;
            confirm-close-surface = false;
            right-click-action = "ignore";
        };
    };
}

