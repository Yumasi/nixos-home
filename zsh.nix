{ config, lib, pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        autocd = true;
        dotDir = ".config/zsh";
        enableAutosuggestions = true;
        enableCompletion = true;
        shellAliases = {
            ls = "exa";
            l = "exa -l";
            la = "exa -la";
        };

        initExtra = ''
bindkey '^ ' autosuggest-accept
                        '';

        plugins = with pkgs; [
            {
                name = "spaceship-prompt";
                src = fetchFromGitHub {
                    owner = "denysdovhan";
                    repo = "spaceship-prompt";
                    rev = "v3.11.2";
                    sha256 = "1q7m9mmg82n4fddfz01y95d5n34xnzhrnn1lli0vih39sgmzim9b";
                };
                file = "spaceship.zsh";
            }
        ];
    };

    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
    };
}
