{
  description = "An Iris development environment";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    parts.url = "github:hercules-ci/flake-parts";
    fmt.url = "github:numtide/treefmt-nix";
    opam-nix.url = "github:tweag/opam-nix";
    iris-dev = {
      url = "git+https://gitlab.mpi-sws.org/iris/opam.git";
      flake = false;
    };
    cerberus = {
      url = "github:rems-project/cerberus/57c0e80af140651aad72e3514133229425aeb102";
      flake = false;
    };
    cerberus-lib = {
      url = "github:rems-project/cerberus-lib/57c0e80af140651aad72e3514133229425aeb102";
      flake = false;
    };
    refinedc = {
      url = "git+https://gitlab.mpi-sws.org/iris/refinedc.git";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, parts, fmt, opam-nix, iris-dev, cerberus, cerberus-lib, refinedc }@inputs:
    parts.lib.mkFlake { inherit inputs; } {
      imports = [ ./nix/shell.nix ];
      systems =
        [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
    };
}
