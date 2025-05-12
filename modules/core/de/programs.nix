{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    (discord.override {
      withOpenASAR = true;
      withVencord = true; # can do this here too
    })
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
  ];
  environment.variables = {
    GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0/";
  };

  programs = {
    # Enable fish here for autocompletion
    fish.enable = true;
    # Fuck nano
    nano.enable = false;
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
