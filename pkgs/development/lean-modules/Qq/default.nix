{
  lib,
  buildLakePackage,
  fetchFromGitHub,
}:

buildLakePackage {
  pname = "lean4-Qq";
  # nixpkgs-update: no auto update
  version = "4.32.0-unstable-2026-07-13";

  src = fetchFromGitHub {
    owner = "leanprover-community";
    repo = "quote4";
    rev = "38d591e778f100aec9762bb582f9c7f55f50e9dc";
    hash = "sha256-g9OILnuvtIYUIUWUbvf1BbIW4bhTuFAtJo2B/UwxqNk=";
  };

  leanPackageName = "Qq";

  meta = {
    description = "Lean 4 compile-time quote and antiquote macros for metaprogramming";
    homepage = "https://github.com/leanprover-community/quote4";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ nadja-y ];
  };
}
