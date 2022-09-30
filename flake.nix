{
  description = "kuero dots";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
    nur.url = "github:nix-community/NUR";
    hyprland = { url = "github:hyprwm/Hyprland"; inputs.nixpkgs.follows = "nixpkgs"; };
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
