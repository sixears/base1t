{
  description = "Prelude replacement, first-level local packages, incl. tests";

  inputs = {
    nixpkgs.url      = github:nixos/nixpkgs/be44bf67; # nixos-22.05 2022-10-15
    build-utils.url  = github:sixears/flake-build-utils/r1.0.0.13;

    base0t.url       = github:sixears/base0t/r0.0.1.14;
    base1.url        = github:sixears/base1/r0.0.9.34;
    tasty-plus.url   = github:sixears/tasty-plus/r1.5.2.24;
  };

  outputs = { self, nixpkgs, build-utils
            , base0t, base1, tasty-plus }:
    build-utils.lib.hOutputs self nixpkgs "base1t" {
      deps = {
        inherit base0t base1 tasty-plus;
      };
      ghc = p: p.ghc8107; # for tfmt
      callPackage = { mkDerivation, lib, mapPkg, system }:
        let
          pkg = build-utils.lib.flake-def-pkg system;
        in
          mkDerivation {
            pname = "base1t";
            version = "0.0.5.36";
            src = ./.;
            libraryHaskellDepends = mapPkg [ base0t base1 tasty-plus ];
            description = "Prelude replacement, first-level local packages, incl. tests";
            license = lib.licenses.mit;
          };
    };
}
