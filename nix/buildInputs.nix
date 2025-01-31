{ inputs, pkgs, system }:
let
  inherit (inputs.opam-nix.lib.${system}) buildOpamProject makeOpamRepo listRepo;
  ocaml-base-compiler = "5.2.1"; # from nixos unstable jan 2025
  localPackagesQuery = path: builtins.mapAttrs (_: pkgs.lib.last) (listRepo (makeOpamRepo path));
  base = with pkgs; [ dune_3 ocaml mpfr ];
  coq = with pkgs.coqPackages_8_20; [ coq coq-lsp ];
  devPackagesQuery = {};
  query = { inherit ocaml-base-compiler; };
  overlay = final: prev: {};
  opamMap = { iris-dev = inputs.iris-dev; cerberus = inputs.cerberus; cerberus-lib = inputs.cerberus-lib; };
  buildPackage = name: src:
    let
      repo = makeOpamRepo src;
      localPackages = builtins.attrNames (builtins.mapAttrs (_: pkgs.lib.last) (listRepo repo));
      scope = buildOpamProject {} name src query;
      scope' = scope.overrideScope overlay;
    in pkgs.lib.getAttrs localPackages scope';

  # packages_deps = builtins.attrValues (pkgs.lib.mapAttrs buildPackage opamMap);
  packages_refinedc = builtins.attrValues (pkgs.lib.mapAttrs buildPackage { refinedc = inputs.refinedc; });
in (builtins.concatLists [ base coq ]) ++ packages_refinedc
