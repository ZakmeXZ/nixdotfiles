{ pkgs, inputs, ... }:
{
    imports = [
        inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
        enable = true;
        settings = {
            shell = {
                clipboard_enabled = false;
                setup_wizard_enabled = false;
            };

            bar.default = {
                position = "left";
                radius = 0;
                margin_ends = 0;

                start = [ "clock" ];
                center = [ "workspaces" ];
                end = [ "media" "tray" "notifications" "network" "volume" "brightness" "battery" "control-center" ];
            };
            
            backdrop = {
                enabled = true;
            };
        };
    };
}
