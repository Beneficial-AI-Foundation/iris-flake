{ inputs, ... }: {
  perSystem = { pkgs, system, ... }:
    let
      buildInputs = import ./buildInputs.nix {
        inherit inputs pkgs system;
      };
      name = "iris";
      greeting = "Hello, ${name}";
      shellHook = "echo ${greeting}";
    in {
      devShells.default = pkgs.mkShell { inherit name buildInputs shellHook; };
    };
}
