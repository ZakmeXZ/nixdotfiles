{ config, inputs, ... }:

{
    imports = [
        <nixvim>.homeModules.nixvim
    ];

    programs.nixvim = {
        enable = true;
    };
}

