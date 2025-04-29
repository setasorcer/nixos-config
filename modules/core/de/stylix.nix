{ pkgs, inputs, ... }:

{
  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix = {
    enable = true;
    autoEnable = false;
    targets = {
      console.enable = true;
      fish.enable = true;
      gtk.enable = true;
      plymouth.enable = true;
    };
    # maigo theme by anokyo
    # Inspired by gruvbox, precious-light, and everforest
    base16Scheme = {
      base00 = "151516";
      base01 = "202020";
      base02 = "303030";
      base03 = "505050";
      base04 = "B0B0B0";
      base05 = "D0D0D0";
      base06 = "E0E0E0";
      base07 = "F5F5F5";
      base08 = "AC4142";
      base09 = "D28445";
      base0A = "F4BF75";
      base0B = "90A959";
      base0C = "75B5AA";
      base0D = "6A9FB5";
      base0E = "AA759F";
      base0F = "8F5536";
      scheme = "maigo";
      author = "anokyo";
    };
    image = ./../../../papes/pape.jpg;
    polarity = "dark";
    # Waybar
    opacity.desktop = 0.7;
    # Swaync, avizo, rofi
    opacity.popups = 0.9;
    opacity.terminal = 0.9;
    opacity.applications = 0.8;
    fonts.monospace = {
      package = pkgs.nerd-fonts.inconsolata;
      name = "Inconsolata Nerd Font Mono";
    };
    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePineDawn-Linux";
      size = 28;
    };
  };
}
