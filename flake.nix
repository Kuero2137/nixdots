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
  };

  outputs = { nixpkgs, home-manager, nur, neovim-nightly-overlay, ...}:
    let
      system = "x86_64-linux";
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
            users.kuero = import ./home;
          };
	      nixpkgs.overlays = [
		nur.overlay neovim-nightly-overlay.overlay
	      ];
	    }
	  ];
	};
      };
    };
  }
