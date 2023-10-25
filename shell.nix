{pkgs? import <nixpkgs>{},...}:
let 
pkgsPhp = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/4426104c8c900fbe048c33a0e6f68a006235ac50.tar.gz";
        }) {};
in 
pkgs.mkShell{
    MIPHP=pkgsPhp.php;
    name="php74devenv";
    packages=[
    pkgs.vim
    pkgsPhp.php74base
    pkgsPhp.openssl
    ];
    shellHook=''
       echo "Entorno de desarrollo listo" 
    '';
}
