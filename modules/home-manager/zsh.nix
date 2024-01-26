{ pkgs, ... }: {

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      tree = "eza --tree";
    };
    localVariables = {
      COMPLETION_WAITING_DOTS = "true";
    };
    initExtra = ''
      export PATH=~/bin:~/go/bin:$PATH
      # See https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
      export USE_GKE_GCLOUD_AUTH_PLUGIN=True

      if [ -f ~/.cockroach.lic ]; then
        export COCKROACH_DEV_LICENSE="$(cat ~/.cockroach.lic)"
      fi

      function cla() {
        gh api \
          --method POST \
          -H "Accept: application/vnd.github+json" \
          -H "X-GitHub-Api-Version: 2022-11-28" \
          -f state='success' \
          -f description='CLA status forced by CLI' \
          -f context='license/cla' \
          /repos/cockroachdb/cockroach/statuses/$1
      }

      function ci() {
        local branch=$(git rev-parse --abbrev-ref HEAD)
        local user=$(whoami)
        git push -f git@github.com:cockroachdb/cockroach.git HEAD:refs/ci/$user/$branch
        echo "Visit the following URL in a minute or two: https://teamcity.cockroachdb.com/buildConfiguration/Cockroach_UnitTests?branch=$user%2F$branch"
      }

      function br_cleanup(){
        git branch --list  | cut -c 3- | gum choose --no-limit | xargs git branch -D
      }
    '';
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = ["zoxide"];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableTransience = true;
    settings = {
      aws.disabled = true;
      gcloud.disabled = true;
      golang.disabled = true;
      docker_context.disabled = true;
      git_branch.format = "[$symbol$branch(:$remote_branch)]($style)";
      directory.truncate_to_repo = false;
      directory.truncation_symbol = "…/";
    };
  };
}

