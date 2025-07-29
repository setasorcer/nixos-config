{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  #environment.systemPackages = with pkgs; [
  #];

  programs = {
    # Enable fish here for autocompletion
    fish.enable = true;
    # Fuck nano
    nano.enable = false;
    niri.enable = true;
    nix-ld = {
      enable = true;
      libraries = [(pkgs.runCommand "steamrun-lib" {}
  "mkdir $out; ln -s ${pkgs.steam-run.fhsenv}/usr/lib64 $out/lib")];
    };
  };
  # Fuck xterm
  services.xserver.excludePackages = [ pkgs.xterm ];

  # OpenGL
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd # OpenCL (fixes Davinci)
    ];
  };
}
