{ config, inputs, ... }:

{
    imports = [
        inputs.nixvim.homeModules.nixvim
    ];

    programs.nixvim = {
        enable = true;
	colorscheme = "Gruvbox Dark";

	nixpkgs.source = inputs.nixpkgs;
    };
}

