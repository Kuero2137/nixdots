{ config, lib, headless, ... }:

{
  imports = [
    ./ssh.nix
    ./nix.nix
  ];
}
