{ inputs, ... }: {
  perSystem = { pkgs, system, ... }:
    let
      buildInputs = with pkgs.coqPackages_8_20; [
        coq
        coq-lsp
        iris
        pkgs.dune_3
        pkgs.ocaml
      ];
      greeting = "Hello, Iris";
      shellHook = "echo ${greeting}";
      name = "iris";
    in {
      devShells.default = pkgs.mkShell { inherit name buildInputs shellHook; };
    };
}
