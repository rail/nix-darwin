# Rail's Darwin Nix setup

## How to install

1. Install Nix:

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Install nix-darwin

```shell
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A uninstaller
./result/bin/darwin-uninstaller
rm result
```

3. Modify the files in this directory

4. Initial setup

```shell
nix run nix-darwin -- switch --flake .
```

Done.

If you change the contents of this directory

```shell
git add .
nix run nix-darwin -- switch --flake .
```

To update packages

```shell
nix flake update
git add .
nix run nix-darwin -- switch --flake .
```

To remove old generations

```shell
nix-collect-garbage --delete-older-than 7
```
