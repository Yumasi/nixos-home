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
AGKOZAK_COLORS_PROMPT_CHAR='magenta'
AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' )
AGKOZAK_MULTILINE=0
AGKOZAK_PROMPT_CHAR=( ❯ ❯ ❮ )
eval $(thefuck --alias)
                        '';

        plugins = with pkgs; [
            {
                name = "agkozak-zsh-prompt";
                src = fetchFromGitHub {
                    owner = "agkozak";
                    repo = "agkozak-zsh-prompt";
                    rev = "v3.3.0";
                    sha256 = "0f8v1ih4205lgghcssbvb3clpymjj2f134cab5vrggdaapcs10xq";
                };
                file = "agkozak-zsh-prompt.plugin.zsh";
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
            {
                name = "zsh-syntax-highlighting";
                src = fetchFromGitHub {
                    owner = "zsh-users";
                    repo = "zsh-syntax-highlighting";
                    rev = "0.6.0";
                    sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
                };
                file = "zsh-syntax-highlighting.zsh";
            }
            {
                name = "zsh-abbrev-alias";
                src = fetchFromGitHub {
                    owner = "momo-lab";
                    repo = "zsh-abbrev-alias";
                    rev = "637f0b2dda6d392bf710190ee472a48a20766c07";
                    sha256 = "16saanmwpp634yc8jfdxig0ivm1gvcgpif937gbdxf0csc6vh47k";
                };
                file = "abbrev-alias.plugin.zsh";
            }
        ];
    };

    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
    };
}
