{ pkgs }:

let
  lib = pkgs.lib;
  sources = lib.importJSON ./sources.json;
  reformDebianPackages = pkgs.fetchFromGitLab sources.reformDebianPackages;
in
map (lib.removePrefix "${reformDebianPackages}/") (
  lib.filesystem.listFilesRecursive "${reformDebianPackages}/linux/patches${lib.versions.majorMinor sources.modDirVersion}"
)
