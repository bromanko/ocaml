self: super: {
  ocamlPackages = super.ocamlPackages // rec {
    dream-pure = super.ocamlPackages.dream-pure.overrideAttrs (old: {
      version = "1.0.0-78c79e3328414768fa2ede0623d741f63ea5c4f1";
      src = super.fetchFromGitHub {
        owner = "aantron";
        repo = "dream";
        rev = "78c79e3328414768fa2ede0623d741f63ea5c4f1";
        hash = "sha256-mx0DAzu8L0jVCMrCvefVLPZX3E+C8SUv9wjcqZcG29Q=";
        fetchSubmodules = true;
        leaveDotGit = false;
        deepClone = false;
      };
    });

    dream = super.ocamlPackages.dream.overrideAttrs (old: {
      inherit (dream-pure) src version;

      propagatedBuildInputs = with self.ocamlPackages;
        old.propagatedBuildInputs ++ [ markup lambdasoup ];

      prePatch = "";
    });

    dream-html = super.ocamlPackages.dream-html.overrideAttrs
      (old: { propagatedBuildInputs = [ dream ]; });
  };
}
