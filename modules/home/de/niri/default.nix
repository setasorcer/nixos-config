{ pkgs, config, lib, ... }:

{
  home.packages = with pkgs; [ xwayland-satellite ];
  xdg.configFile."niri/config.kdl".text = ''

    spawn-at-startup "waybar"
    spawn-at-startup "swww-daemon"
    spawn-at-startup "xwayland-satellite"

    environment {
    	DISPLAY ":0"
    }

    input {
        keyboard {
    	repeat-delay 300
    	repeat-rate 50
        }
    
        touchpad {
            tap
            natural-scroll
            accel-profile "adaptive"
            scroll-method "two-finger"
            tap-button-map "left-right-middle"
            click-method "clickfinger"
        }
    
        mouse {
            accel-profile "flat"
        }

        warp-mouse-to-focus
        focus-follows-mouse max-scroll-amount="0%"
    }
    
    cursor {
        hide-after-inactive-ms 3000
    }

    // No shortcut overlay
    hotkey-overlay {
        skip-at-startup
    }
    
    // Only modify laptop display as main, docked display is fine
    output "eDP-1" {
        variable-refresh-rate
    
        scale 1.5
        transform "normal"

        position x=1280 y=0
    }
    
    layout {
        gaps 16
        center-focused-column "on-overflow"
    
        preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
        }
    
        default-column-width { proportion 0.5; }

        focus-ring {
            width 4
    
            active-color "#${config.stylix.base16Scheme.base0E}"
            inactive-color "#${config.stylix.base16Scheme.base00}"
        }
    
        shadow {
            on

            softness 30
            spread 5
            offset x=0 y=0
            color "#0007"
        }
    
        struts {
            left 32
            right 32
            top 32
            bottom 32
        }
    }
    
    //xwayland-satellite {
    //    path "${pkgs.xwayland-satellite}/bin/xwayland-satellite"
    //} 
    
    // Disable client-side decorations
    prefer-no-csd
    
    screenshot-path "~/pix/snaps/%Y-%m-%d-%H%M%S_niri.png"

    window-rule {
        geometry-corner-radius 8
        clip-to-geometry true
    }
    
    window-rule {
        match app-id=r#"zen-beta$"# title="^Picture-in-Picture$"
        open-floating true
    }
    
    binds {
        Mod+Shift+Slash { show-hotkey-overlay; }
    
        Mod+Return hotkey-overlay-title="Open a Terminal: foot" repeat=false { spawn "foot"; }
        Mod+R hotkey-overlay-title="Open a Terminal: yazi" repeat=false { spawn "foot" "yazi"; }
        Mod+Space hotkey-overlay-title="Run an Application: rofi" repeat=false { spawn "rofi" "-show" "drun" "-show-icons"; }
        Mod+BackSpace hotkey-overlay-title="Run an Application: powermenu" repeat=false { spawn "rofi" "-show" "power-menu" "-modi" "power-menu:rofi-power-menu"; }
        Mod+Shift+Space hotkey-overlay-title="Run an Application: passmenu" repeat=false { spawn "tessen"; }
        Mod+Alt+L hotkey-overlay-title="Lock the Screen: swaylock" repeat=false { spawn "loginctl" "lock-session"; }
        Mod+N hotkey-overlay-title="Run an Application: swaync" repeat=false { spawn "swaync-client" "-t" "-sw"; }
    
        XF86AudioRaiseVolume allow-when-locked=true { spawn "volumectl" "raise"; }
        XF86AudioLowerVolume allow-when-locked=true { spawn "volumectl" "lower"; }
        XF86AudioMute        allow-when-locked=true { spawn "volumectl" "toggle-mute"; }
        XF86AudioMicMute     allow-when-locked=true { spawn "volumectl" "-m" "set-mute"; }
        XF86MonBrightnessUp allow-when-locked=true { spawn "lightctl" "up"; }
        XF86MonBrightnessDown allow-when-locked=true { spawn "lightctl" "down"; }
        XF86AudioPlay { spawn "mpc" "toggle"; }
        XF86AudioStop { spawn "mpc" "stop"; }
        XF86AudioPrev { spawn "mpc" "prev"; }
        XF86AudioNext { spawn "mpc" "next"; }
        Mod+Down { spawn "mpc" "toggle"; }
        Mod+Up { spawn "mpc" "stop"; }
        Mod+Left { spawn "mpc" "prev"; }
        Mod+Right { spawn "mpc" "next"; }

        Mod+O repeat=false { toggle-overview; }
    
        Mod+Q { close-window; }
    
        Mod+H     { focus-column-left; }
        Mod+J     { focus-window-or-workspace-down; }
        Mod+K     { focus-window-or-workspace-up; }
        Mod+L     { focus-column-right; }
    
        Mod+Shift+H     { move-column-left; }
        Mod+Shift+J     { move-window-down-or-to-workspace-down; }
        Mod+Shift+K     { move-window-up-or-to-workspace-up; }
        Mod+Shift+L     { move-column-right; }
    
        Mod+I { focus-column-first; }
        Mod+A { focus-column-last; }
        Mod+Shift+I { move-column-to-first; }
        Mod+Shift+A { move-column-to-last; }
    
        Mod+Ctrl+J         { move-workspace-down; }
        Mod+Ctrl+K         { move-workspace-up; }

        Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
        Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
        Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }
        Mod+WheelScrollRight      { focus-column-right; }
        Mod+WheelScrollLeft       { focus-column-left; }
        Mod+Ctrl+WheelScrollRight { move-column-right; }
        Mod+Ctrl+WheelScrollLeft  { move-column-left; }
        Mod+Shift+WheelScrollDown      { focus-column-right; }
        Mod+Shift+WheelScrollUp        { focus-column-left; }
        Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
        Mod+Ctrl+Shift+WheelScrollUp   { move-column-left; }
    
        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+Shift+1 { move-column-to-workspace 1; }
        Mod+Shift+2 { move-column-to-workspace 2; }
        Mod+Shift+3 { move-column-to-workspace 3; }
        Mod+Shift+4 { move-column-to-workspace 4; }
        Mod+Shift+5 { move-column-to-workspace 5; }
        Mod+Shift+6 { move-column-to-workspace 6; }
        Mod+Shift+7 { move-column-to-workspace 7; }
        Mod+Shift+8 { move-column-to-workspace 8; }
        Mod+Shift+9 { move-column-to-workspace 9; }
    
        // The following binds move the focused window in and out of a column.
        // If the window is alone, they will consume it into the nearby column to the side.
        // If the window is already in a column, they will expel it out.
        Mod+BracketLeft  { consume-or-expel-window-left; }
        Mod+BracketRight { consume-or-expel-window-right; }
        // Consume one window from the right to the bottom of the focused column.
        Mod+Comma  { consume-window-into-column; }
        // Expel the bottom window from the focused column to the right.
        Mod+Period { expel-window-from-column; }
    
        Mod+Semicolon { switch-preset-column-width; }
        Mod+Apostrophe { switch-preset-window-height; }
        Mod+Shift+Apostrophe { reset-window-height; }
        Mod+F { maximize-column; }
        Mod+Shift+F { fullscreen-window; }
    
        // Expand the focused column to space not taken up by other fully visible columns.
        // Makes the column "fill the rest of the space".
        Mod+Ctrl+F { expand-column-to-available-width; }
    
        Mod+C { center-column; }
        Mod+Ctrl+C { center-visible-columns; }
    
        Mod+V       { toggle-window-floating; }
        Mod+Shift+V { switch-focus-between-floating-and-tiling; }
    
        Mod+W { toggle-column-tabbed-display; }
    
        Shift+Print { screenshot; }
        Print { screenshot-screen; }
        Mod+Print { screenshot-window; }
    
        Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }
    
        XF86AudioMedia { power-off-monitors; }
        Shift+F12 { power-off-monitors; }
    }
  '';
}
