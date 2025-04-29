{ config, lib, pkgs, ... }:

{
  imports = [ ./ncmpcpp.nix ];
  # Utilities for music
  home.packages = with pkgs; [
    mpc # mpd CLI
    rsgain # ReplayGain
    kid3-qt # Metatag editor
    nicotine-plus # Hehehe
    ffmpeg
  ];
  services = {
    mpd = {
      enable = true;
      # Pipewire support
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
        replaygain "album"
      '';
    };
    # MPRIS support
    mpd-mpris.enable = true;
  };
}
