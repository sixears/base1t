{
  description = "Prelude replacement, first-level local packages, incl. tests";

  inputs = {
    nixpkgs.url      = "github:nixos/nixpkgs/be44bf67"; # nixos-22.05 2022-10-15
    build-utils.url  = "github:sixears/flake-build-utils/r1.0.0.4";

    base0t.url       = "github:sixears/base0t/r0.0.1.1";
    base1.url        = "github:sixears/base1/r0.0.9.5";
    tasty-plus.url   = "github:sixears/tasty-plus/r1.5.2.5";
  };

  outputs = { self, nixpkgs, flake-utils, build-utils
            , base0t, base1, tasty-plus }:
    build-utils.lib.hOutputs self nixpkgs "base1t" {
      deps = {
        inherit base0t base1 tasty-plus;
      };
      ghc = p: p.ghc8107; # for tfmt
    };
}
