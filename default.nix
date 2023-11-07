{ pkgs ? import <nixpkgs> {} }: let
  inherit (pkgs.stdenv) mkDerivation;
  inherit (pkgs) fetchFromGitHub;
in mkDerivation {
  name = "sl";
  # src = fetchFromGitHub {
  #   owner = "pinktrink";
  #   repo = "sl";
  #   rev = "6153cab03ea9d2145262f0a64ab10ad34dcc9dd9";
  #   sha256 = "sha256-BOliSypkcvNTzOHwZSA62zJpdEoO8ZAZWq940YBC8fU=";
  # };
  src = ./.;
  buildInputs = [ pkgs.ncurses ];
  installPhase = ''
    runHook preInstall
    install -Dm755 -t $out/bin sl
    install -Dm644 -t $out/share/man/man1 sl.1{,.ja}
    runHook postInstall
  '';
}
