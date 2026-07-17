{ config, inputs, ... }:

{
    imports = [
        inputs.nixvim.homeModules.nixvim
    ];

    programs.nixvim = {
        enable = true;
	
	opts = {
	    number = true;
	    relativenumber = true;
	    tabstop = 4;
	    shiftwidth = 4;
	    expandtab = true;
	    smarttab = true;
	    autoindent = true;
	};

	colorschemes.gruvbox = {
	    enable = true;
	    settings = {
		    terminal_colors = true;
		    undercurl = true;
	    };
	};

    plugins = {
        treesitter = {
            enable = true;
            settings = {
                ensure_installed = [ "c" "cpp" "make" ];
                highlight.enable = true;
            };
        };
        lsp = {
            enable = true;
            servers = {
                clangd.enable = true;
            };
            keymaps.lspBuf = {
                "gd" = "definition";
                "K" = "hover";
                "<leader>ca" = "code_action";
                "<leader>rn" = "rename";
            };
        };
        cmp = {
            enable = true;
            settings = {
                autoEnableSources = true;
                sources = [
                    { name = "nvim_lsp"; }
                    { name = "path"; }
                    { name = "buffer"; }
                ];
                mapping = {
                    "<Tab>" = "cmp.mapping.select_next_item()";
                    "<S-Tab>" = "cmp.mapping.select_prev_item()";
                    "<CR>" = "cmp.mapping.confirm({ select = true })";
                };
            };
        };
        nvim-autopairs.enable = true;
        lualine.enable = true;
        neo-tree = {
            enable = true;
            settings = {   
                enable_git_status = true;
            };
        };
    };

    keymaps = [
        {
            mode = "n";
            key = "<leader>e";
            action = ":Neotree toggle<CR>";
        }
    ];

	nixpkgs.source = inputs.nixpkgs;
    };
}

