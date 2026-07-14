{ config, inputs, ... }:

{
    imports = [
        inputs.nixvim.homeModules.nixvim
    ];

    programs.nixvim = {
        enable = true;
	
	settings = {
	    terminal_colors = true;
	    undercurl = true;
	};

	opts = {
	    number = true;
	    relativenumber = true;
	    tabstop = 4;
	    shiftwidth = 4;
	    expandtab = true;
	    smarttab = true;
	    autoindent = true;
	};

	nixpkgs.source = inputs.nixpkgs;
    };
}

