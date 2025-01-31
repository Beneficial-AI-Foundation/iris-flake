# Iris kit with `nix` and `dune`

## Steps: just iris

### 1. Install nix

This is a way of doing _isolated_ builds,

### 2. Enable flakes

The way to do do nix is with flakes, even though they're technically an experimental feature.

Type `nix develop` to start building the environment (dependencies, `$PATH`, everything). 

### 3. Install direnv and hook it into your shell

This is a convenience layer that just automatically runs `nix develop` every time you `cd` into this directory, but it's critically important because emacs/vscode will rely on it to activate the environment. 

### 4. `direnv allow`

This just tells direnv to look at the `.envrc` file and activate the environment specified there. Again, this is **required** for emacs/vscode

### 5. Install direnv in emacs/vscode

Both emacs and vscode have direnv extensions, which you need to use so your editor talks to the right coq compiler. In vscode, you have to type `> direnv allow` in the search/command bar, but in emacs it just works. 

## Steps: refinedc

Not really attempting to nixify refinedc rn

``` sh
docker compose run --build refinedc
```

This is an interactive shell that will let you run refinedc commands.

The only thing in docker-compose.yml is that I hate writing "docker build -t" and "docker run -v"
