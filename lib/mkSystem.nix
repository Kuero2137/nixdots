{ self, ... } @ inputs:

{ hostname, system, home-manager ? false, extraHomeModules ? [ ] }:

inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit inputs self; };
  modules = [
    inputs.hyprland.nixosModules.default
    { programs.hyprland.enable = true; }
    "${self}/hosts/${hostname}"
    "${self}/modules"
  ] ++ inputs.nixpkgs.lib.optionals home-manager [
    inputs.home-manager.nixosModule
    "${self}/home"
    "${self}/hosts/${hostname}/home"
    {
      home-manager = {
        useGlobalPkgs = true;
        extraSpecialArgs = { inherit inputs self; };
        sharedModules = extraHomeModules;
      };
      nixpkgs.overlays = [
        (final: prev: {
          catppuccin-cursors =
            prev.callPackage "${self}/overlays/catppuccin-cursors.nix" { };
        })
      ];
    }
  ];
}
