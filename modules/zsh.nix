{ ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;

        shellAliases = {
            update = "sudo nixos-rebuild switch --flake ~/dotfiles#nixos";
        };

        oh-my-zsh = {
            enable = true;
            theme = "agnoster";
            plugins = [ "git" ];
        };
    };
}
