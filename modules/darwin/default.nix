{
  pkgs,
  username,
  system,
  lib,
  ...
}: {
  users.users.${username}.home = "/Users/${username}";
  nixpkgs.hostPlatform = system;
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.trusted-users = [username];
  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 7d";
  };
  # Disable auto-optimise-store because of this issue:
  #   https://github.com/NixOS/nix/issues/7273
  # "error: cannot link '/nix/store/.tmp-link-xxxxx-xxxxx' to '/nix/store/.links/xxxx': File exists"
  nix.settings = {
    auto-optimise-store = false;
  };

  # enable touch id for shell sudo \o/
  security.pam.enableSudoTouchIdAuth = true;

  # environment.systemPackages =
  #   [ pkgs.neovim
  #   ];
  environment.systemPackages = with pkgs; [
    neovim
  ];
  environment.variables.EDITOR = "nvim";

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
}
