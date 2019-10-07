{ config, lib, pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        autocd = true;
        dotDir = ".config/zsh";
        enableAutosuggestions = true;
        enableCompletion = true;
        shellAliases = {
            sl = "exa";
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
            {
                name = "formarks";
                src = fetchFromGitHub {
                    owner = "wfxr";
                    repo = "formarks";
                    rev = "8abce138218a8e6acd3c8ad2dd52550198625944";
                    sha256 = "1wr4ypv2b6a2w9qsia29mb36xf98zjzhp3bq4ix6r3cmra3xij90";
                };
                file = "formarks.plugin.zsh";
            }
        ];
    };

    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
    };
}
