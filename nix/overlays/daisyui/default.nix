self: super: {
  nodePackages = super.nodePackages // {
    daisyui = super.buildNpmPackage rec {
      pname = "daisyui";
      version = "4.11.1";

      src = super.fetchFromGitHub {
        owner = "saadeghi";
        repo = pname;
        rev = "v${version}";
        hash = "sha256-ZrlqLSXiaO4+FMR0OzD1QCFQHbfCdypMgHoD4jVTlRc=";
      };

      npmDepsHash = "sha256-IwJiuMrFkZlRqZ4Ie9UKt1oT+VXBQyMNoNceUb+XcNQ=";
      postPatch = ''
        cp ${./package-lock.json} ./package-lock.json
      '';

      npmPackFlags = [ "--ignore-scripts" ];
      NODE_OPTIONS = "--openssl-legacy-provider";

      meta = with super.lib; {
        description = "A free and open-source Tailwind CSS component library ";
        homepage = "https://daisyui.com/";
        license = licenses.mit;
      };
    };
  };
}
