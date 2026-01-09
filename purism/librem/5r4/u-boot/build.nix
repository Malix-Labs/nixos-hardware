{ pkgs }:

import ./default.nix {
  inherit (pkgs) stdenv gcc11Stdenv buildUBoot fetchurl fetchFromGitLab lib bison;
}
