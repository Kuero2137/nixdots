{
  description = "Kuero flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    picom-ibhagwan = {
      url = "github:ibhagwan/picom";
      flake = false;
    };
    eww.url = "github:elkowar/eww";
    discord-overlay = {
      url = "github:InternetUnexplorer/discord-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nur, neovim-nightly-overlay, picom-ibhagwan, discord-overlay, eww, ...}:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;

      overlays = [
        (final: prev: {
          picom =
            prev.picom.overrideAttrs (o: { src = picom-ibhagwan; });
          })
          (final: prev: {
            catppuccin-gtk =
              prev.callPackage ./overlays/catppuccin-gtk.nix { };
              catppuccin-cursors =
                prev.callPackage ./overlays/catppuccin-cursors.nix { };
                catppuccin-grub =
                  prev.callPackage ./overlays/catppuccin-grub.nix { };
                  fetch = prev.callPackage ./overlays/fetch.nix { };
                })
                nur.overlay
                discord-overlay.overlay
                neovim-nightly-overlay.overlay
              ];
    in {
      nixosConfigurations = {
	JD-PC = nixpkgs.lib.nixosSystem {
	  inherit system;
	  modules = [
	    ./configuration.nix
	    ./hosts/JD-PC.nix
	    ./home/packages.nix
	    { nix.registry.nixpkgs.flake = nixpkgs; }
	    home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs;
              theme = import ./theme;
            };
            users.kuero = import ./home;
          };
	      nixpkgs.overlays = overlays;
	    }
	  ];
	};
      };
    };
  }
