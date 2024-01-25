{ pkgs, ... }: {
  nixpkgs.config.allowUnfreePredicate = (pkg: true);
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "23.11";
    username = "rail";
    homeDirectory = "/Users/rail";
  };
  home.packages = with pkgs; [
    buildifier
    ctags
    fd
    gnugrep
    gnupatch
    google-cloud-sdk
    gum
    mc
    mosh
    packer
    skopeo
    temurin-bin
    wget
    # terraform
  ];

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
  programs.fzf.enableZshIntegration = true;
  programs.go.enable = true;
  programs.jq.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  programs.ripgrep.enable = true;

  # A hack to pretend bazelisk is bazel
  home.file."bin/bazel" = {
    source = "${pkgs.bazelisk}/bin/bazelisk";
    executable = true;
  };
  imports = [ ./modules ];
}
