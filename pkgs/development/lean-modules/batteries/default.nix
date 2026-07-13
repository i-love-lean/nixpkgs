{
  lib,
  buildLakePackage,
  fetchFromGitHub,
}:

buildLakePackage {
  pname = "lean4-batteries";
  # nixpkgs-update: no auto update
  version = "4.32.0-unstable-2026-07-13";

  src = fetchFromGitHub {
    owner = "leanprover-community";
    repo = "batteries";
    rev = "023ce7d62a0531e22a5331e20b587817a80d49ff";
    hash = "sha256-P7InNTYiYE3v0Ag7RdIubfhMWYNGSIeDfpugxiThwvA=";
  };

  leanPackageName = "batteries";

  # Pre-build static library for downstream executables.
  # TODO: upstream this to batteries
  postPatch = ''
    substituteInPlace lakefile.toml \
      --replace-fail '[[lean_lib]]
    name = "Batteries"' '[[lean_lib]]
    name = "Batteries"
    defaultFacets = ["static"]'
  '';

  meta = {
    description = "The batteries-included extended library for Lean 4";
    homepage = "https://github.com/leanprover-community/batteries";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ nadja-y ];
  };
}
