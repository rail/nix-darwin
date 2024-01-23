{ pkgs, ... }: {
  nixpkgs.config.allowUnfreePredicate = (pkg: true);
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "23.11";
    username = "rail";
    homeDirectory = "/Users/rail";
    packages = with pkgs; [
      mosh
      skopeo
      fd
      wget
      buildifier
      google-cloud-sdk
      bazelisk
      temurin-bin
      ctags
      gnupatch
      gnugrep
      gum
      # terraform
    ];
  };
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.eza = {
    enable = true;
    enableAliases = true;
    git = true;
    icons = true;
  };
  programs.awscli.enable = true;
  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.go.enable = true;
  programs.jq.enable = true;
  programs.neovim.enable = true;
  programs.neovim.viAlias = true;
  programs.neovim.vimAlias = true;
  programs.ripgrep.enable = true;

  home.file."bin/bazel" = {
    source = "${pkgs.bazelisk}/bin/bazelisk";
    executable = true;
  };
  imports = [ ./modules ];
}
