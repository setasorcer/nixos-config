{ config, lib, ... }:

with config.lib.stylix.colors;
{
  programs.waybar.style = lib.mkForce ''
    @define-color base00 #${base00}; @define-color base01 #${base01}; @define-color base02 #${base02}; @define-color base03 #${base03};
    @define-color base04 #${base04}; @define-color base05 #${base05}; @define-color base06 #${base06}; @define-color base07 #${base07};
    
    @define-color base08 #${base08}; @define-color base09 #${base09}; @define-color base0A #${base0A}; @define-color base0B #${base0B};
    @define-color base0C #${base0C}; @define-color base0D #${base0D}; @define-color base0E #${base0E}; @define-color base0F #${base0F};

    * {
      font-family: Inconsolata Nerd Font Propo, Noto Sans Mono CJK JP;
      font-weight: bold;
      font-size: 11pt;
    }
    /* main window */
    window#waybar {
      background: alpha(@base01, ${toString config.stylix.opacity.desktop});
    }
    window#waybar > box {
      margin: 0.375em;
    }
    /* TOOLTIP */
    tooltip {
      background: @base01;
      color: @base0F;
      /* GTK4 like shadow */
      box-shadow: 0px 0px 2px 0px rgba(${base07-rgb-r}, ${base07-rgb-g}, ${base07-rgb-r}, 0.5);
      border: none;
      border-radius: 0.475rem;
      text-shadow: none;
    }
    tooltip label {
      color: @base05;
    }
    /* LEFT MODULE */
    #custom-power,
    #custom-notification,
    /*#clock.1,
    #clock.2,*/
    #window {
      padding: 0 8px;
    }

    #custom-power {
      padding: 0 10px 0 20px;
      background: @base01;
      border-radius: 0.475rem 0 0 0.475rem;
    }
    #custom-power:hover {
      background: linear-gradient(to right, @base02, @base01);
      transition-duration: 500ms;
    }
    #custom-notification:hover {
      background: linear-gradient(to right, @base01, @base02);
      transition-duration: 500ms;
    }
    #custom-clockicon,
    #clock.2 {
      background: @base01;
    }
    #custom-clockicon {
      padding: 0 4px 0 8px;
    }
    #clock.2 {
      padding: 0 8px 0 4px;
    }
    #custom-notification {
      padding: 0 20px 0 10px;
      background: @base01;
      border-radius: 0 0.475rem 0.475rem 0;
    }

    /* RIGHT MODULE */
    #custom-media,
    #memory,
    #cpu,
    #temperature,
    #battery.1,
    #battery.2,
    #wireplumber,
    #network,
    #tray {
      padding: 0 8px;
    }

    #memory {
      padding: 0 10px 0 20px;
      background: @base01;
      border-radius: 0.475rem 0 0 0.475rem;
    }
    #cpu,
    #temperature,
    #battery.1,
    #battery.2,
    #wireplumber,
    #network {
      background: @base01;
    }
    #tray {
      padding: 0 20px 0 10px;
      background: @base01;
      border-radius: 0 0.475rem 0.475rem 0;
    }

    /* CENTER MODULE */
    #workspaces button {
      background: @base01;
      padding: 0px 20px;
      border-radius: 0.25rem;
      margin: 0px 2px;
    }
    #workspaces button:hover {
      background: @base02;
    }
    #workspaces button.active {
      /*background: linear-gradient(to right, @base0F, @base04);*/
      background: @base0E;
      color: @base00;
      padding: 0px 40px;
      /*margin: 0;*/
    }
    #workspaces button.special {
      padding: 0px 10px;
    }
    #workspaces button.urgent {
      background: @base08;
      color: @base00;
    }
  '';
}
