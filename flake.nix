{
  description = "kuero dots";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
    nur.url = "github:nix-community/NUR";
    hyprland = { url = "github:hyprwm/Hyprland"; inputs.nixpkgs.follows = "nixpkgs"; };
    emacs-overlay = { url = "github:nix-community/emacs-overlay"; flake = false; };
    nix-doom-emacs = { url = "github:nix-community/nix-doom-emacs"; inputs.nixpkgs.follows = "nixpkgs"; inputs.emacs-overlay.follows = "emacs-overlay"; };
  };
  outputs = { self, ... }@inputs:
    let
      system = "x86_64";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in {
      lib = import ./lib inputs;
      nixosConfigurations = import ./hosts inputs;
    };
}
