{ stdenv, lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec { pname = "noriskclient-launcher"; version = "0.5.6";

  src = fetchFromGitHub {
    owner = "NoRiskClient";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-qyFuspRcBNyf8eBPlNc9hHMSrJ7G1vQwI0CJP9eFQKY=";
  };

  vendorHash = null;

  doCheck = false;

  meta = with lib; {
    description = "No Risk Client";
    homepage = "https://github.com/github-owner/${pname}";
    license = licenses.gpl3;
    platforms = platforms.unix;
  };
}
