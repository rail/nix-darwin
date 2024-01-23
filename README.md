# Rail's Darwin Nix setup

## How to install

1. Install Nix:

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Modify the files in this directory

3. Initial setup

```shell
nix run github:nix-community/home-manager -- switch --flake .
```

Done.

If you change the contents of this directory

```shell
git add .
home-manager switch --flake .
```

To update packages

```shell
nix flake update
git add .
home-manager switch --flake .
```
