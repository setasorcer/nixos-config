{ pkgs, username, ... }:

{
  # Keyd
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings.main = {
        capslock = "overload(control,esc)";
	esc = "capslock";
	pause = "esc";
	sysrq = "overload(meta,sysrq)";
      };
    };
  };
  # Fcitx5
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [ fcitx5-mozc fcitx5-gtk ];
    };
  };
}
