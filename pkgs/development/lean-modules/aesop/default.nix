{
  lib,
  buildLakePackage,
  fetchFromGitHub,
  batteries,
}:

buildLakePackage {
  pname = "lean4-aesop";
  # nixpkgs-update: no auto update
  version = "4.32.0-unstable-2026-07-13";

  src = fetchFromGitHub {
    owner = "leanprover-community";
    repo = "aesop";
    rev = "a7dbf0c63b694e47f425f3dcddbc0e178bb432d3";
    hash = "sha256-s47lvEGgs4rFoDhw7bM7TH0q72mmyb84OIrxKoFeJEY=";
  };

  leanPackageName = "aesop";
  leanDeps = [ batteries ];

  meta = {
    description = "White-box automation for Lean 4";
    homepage = "https://github.com/leanprover-community/aesop";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ nadja-y ];
  };
}
