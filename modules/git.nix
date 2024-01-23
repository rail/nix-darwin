{ pkgs, ... }: {
  programs.gh.enable = true;
  programs.git.enable = true;
  programs.git.delta.enable = true;
  programs.git.package = pkgs.gitAndTools.gitFull;
  programs.git.ignores = [
    "*.pem"
    ".idea/"
    ".idea"
    ".vscode/"
  ];
  programs.git.aliases = {
    addall = "add -A";
    ci = "commit -v";
    br = "branch";
    st = "status";
    co = "checkout";
    di = "diff -U8 --patch-with-stat --binary";
    du = "diff -U8 --patch-with-stat --binary @{u}...";
    defbranch = "!f() { test -n \"$1\" && r=\"$1\" || r=origin; basename \"$(git rev-parse --abbrev-ref \"$r\"/HEAD)\"; }; f";
    nb = "!f() { git switch -c \"$1\" \"origin/$(git defbranch)\"; }; f";
    nw = "!f() { git worktree add --track -b \"$1\" \"../$1\" \"origin/$(git defbranch)\"; }; f";
    lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
    ll = "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --numstat --date=relative";
    dc = "diff --cached";
    unstage = "reset HEAD --";
    wip = "for-each-ref --sort='authordate:iso8601' --format=' %(color:green)%(authordate:relative)%09%(color:white)%(refname:short)' refs/heads";
  };
  programs.git.extraConfig = {
    user = {
      name = "Rail Aliiev";
      email = "rail@iqchoice.com";
      signingKey = "F5382AFF7359EA23096B8397FA2FD0E389893249";
    };
    rerere = {
	    enabled = true;
    };
    pull = {
      rebase = true;
    };
    github = {
      user = "rail";
    };
    gc = {
      auto = "0";
    };
    core = {
      sshCommand = "/usr/bin/ssh";
    };
    url = {
      "git@github.com:cockroachlabs" = {
        insteadOf = "https://github.com/cockroachlabs";
      };
    };
  };
}
