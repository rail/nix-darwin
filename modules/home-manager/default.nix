{
  pkgs,
  username,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg: true;
  # This is required information for home-manager to do its job
  home = {
    inherit username;
    stateVersion = "23.11";
    homeDirectory = "/Users/${username}";
  };
  home.packages = with pkgs; [
    buildifier
    ctags
    # Go stuff
    delve
    cobra-cli
    gopls
    #
    fd
    gnugrep
    gnupatch
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
    gum
    mc
    mosh
    wget
    tfswitch
    # nix stuff
    alejandra
    deadnix
    statix
    cargo
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
  programs.java.enable = true;
  programs.java.package = pkgs.temurin-bin;

  # A hack to pretend bazelisk is bazel
  home.file."bin/bazel" = {
    source = "${pkgs.bazelisk}/bin/bazelisk";
    executable = true;
  };
  # home.file."bin/goroot".source = config.lib.file.mkOutOfStoreSymlink "${pkgs.go}/share/go";
  # Manage some configs
  home.file.".config" = {
    source = ./config;
    recursive = true;
  };
  imports = [./git.nix ./zsh.nix];
}
