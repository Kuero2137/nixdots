{ pkgs, inputs, ... }:
                      
{
  xdg.configFile."nvim/init.lua" = {
    source = inputs.nvchad + "/init.lua";
    recursive = true;
  };

  xdg.configFile."nvim/lua/core" = {
    source = inputs.nvchad + "/lua/core";
    recursive = true;
  };

  xdg.configFile."nvim/lua/plugins" = {
    source = inputs.nvchad + "/lua/plugins";
    recursive = true;
  };

#  xdg.configFile."nvim/lua/custom" = {
#    source = ./custom;
#    recursive = true;
#  };

  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      gcc
      unzip
      tree-sitter
      nodejs
      nodePackages.bash-language-server
      sumneko-lua-language-server
      rnix-lsp
      nixpkgs-fmt
      statix
      pyright
      black
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      bat
      ripgrep
      fd
    ];

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };
}