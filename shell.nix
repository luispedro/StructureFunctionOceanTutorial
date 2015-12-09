with import <nixpkgs> {};
with pkgs.python27Packages;

buildPythonPackage { 
  name = "impurePythonEnv";
  buildInputs = [
     nix
     zsh
     git
     libxml2
     libxslt
     libzip
     python27Full
     python27Packages.virtualenv
     python27Packages.numpy
     python27Packages.matplotlib
     python27Packages.pandas
     python27Packages.notebook
     python27Packages.ipywidgets
     python27Packages.ipython
     python27Packages.seaborn
     python27Packages.scikitlearn
     python27Packages.pyqt4
     stdenv
     zlib ];
  src = null;
  # When used as `nix-shell --pure`
  shellHook = ''
  unset http_proxy
  export GIT_SSL_CAINFO=/etc/ssl/certs/ca-bundle.crt
  exec zsh
  '';
  # used when building environments
  extraCmds = ''
  unset http_proxy # otherwise downloads will fail ("nodtd.invalid")
  export GIT_SSL_CAINFO=/etc/ssl/certs/ca-bundle.crt
  '';

}
