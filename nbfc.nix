{
    config,
    inputs,
    pkgs,
    ...
}: let
    myUser = "zakme";
    command = "bin/nbfc_service --config-file '/home/${myUser}/.config/nbfc.json'";
in {
    environment.systemPackages = with pkgs; [
        nbfc-linux
    ];
    systemd.services.nbfc_service = {
        enable = true;
        description = "NoteBook FanControl Service";
        serviceConfig.type = "simple";
        path = [pkgs.kmod];
        script = "${pkgs.nbfc-linux}/${command}";
        wantedBy = [ "multi-user.target" ];
    };
}

