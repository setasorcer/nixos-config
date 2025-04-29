{ username, ... }:

{
  # Doas (replace sudo)
  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [{
      users = ["${username}"];
      keepEnv = true;
      persist = true;
    }];
  };
}
