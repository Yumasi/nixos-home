{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # WM tools
    alacritty
    rofi

    # CLI tools
    bat
    exa
    file
    fzf
    htop
    manpages
    ripgrep
    tree
    unzip
    zip

    # desktop
    chromium
  ];

  programs.git = {
    enable = true;
    package = gitAndTools.gitFull;
    userEmail = "guillaume.pagnoux@lse.epita.fr";
    userName = "Guillaume Pagnoux";
  };

  programs.home-manager.enable = true;

  services.redshift = {
    enable = true;
    latitude = "48.853";
    longitude = "2.35";
  };
}
