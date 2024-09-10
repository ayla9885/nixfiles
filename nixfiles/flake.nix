{
  description = "basic nixos flake!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./thinkpad.nix
      ];
    };
    
    nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./pc.nix
      ];
    };
  };
}
