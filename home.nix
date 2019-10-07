{ config, pkgs, ... }:
{
        imports = [
                ./mail.nix
                ./zsh.nix
        ];

        home.packages = with pkgs; [
                # ACU
                fira
                fira-code
                fira-mono
                texlive.combined.scheme-full

                # WM tools
                alacritty
                rofi

                # Fonts
                nerdfonts

                # dev tools
                (lib.hiPrio gcc)
                (lib.lowPrio clang)
                bear
                cmake
                ctags
                gdb
                gnumake
                rustup

                # i3
                acpi
                i3lock-fancy
                i3status-rust

                # Python
                python3

                # CLI tools
                exa
                fd
                file
                fzf
                gitAndTools.tig
                htop
                iftop
                iotop
                ldns
                ltrace
                manpages
                nixops
                nox
                ripgrep
                tree
                unzip
                xclip
                zip

                # desktop
                arandr
                chromium
                discord
                evince
                feh
                libnotify
                pavucontrol
                slack
                spotify
                virtmanager
                wpa_supplicant_gui

                # Emacs dependencies
                ccls
                editorconfig-core-c
                shellcheck

                # Presentations tools
                screenkey
        ];

        programs.bat = {
                enable = true;
                config = {
                        tabs = "8";
                        theme = "TwoDark";
                };
        };

        programs.direnv = {
                enable = true;
        };

        programs.emacs.enable = true;

        programs.git = {
                enable = true;
                package = pkgs.gitAndTools.gitFull;
                userEmail = "guillaume.pagnoux@epita.fr";
                userName = "Guillaume Pagnoux";
                ignores = [
                        "*~"
                        "*.swp"
                        ".ccls-cache"
                        "*.pdf"
                        "compile_commands.json"
                        "shell.nix"
                ];
        };

        programs.gpg.enable = true;
        programs.home-manager.enable = true;

        programs.ssh = {
                enable = true;
                compression = true;
                forwardAgent = true;

                matchBlocks = {
                        "aiur" = {
                                hostname = "163.5.55.18";
                                port = 43092;
                        };

                        "build" = {
                                hostname = "build";
                                user = "pagnoux";
                        };
                };
        };

        services.dunst = {
                enable = true;
                settings = {
                        global = {
                                allow_markup = true;
                                alignment = "left";
                                bounce_freq = 0;
                                font = "Iosevka Nerd Font 10";
                                format = "<b>%s</b>\\n%p %b";
                                frame_width = 2;
                                geometry = "300x5-30+50";
                                horizontal_padding = 4;
                                idle_threshold = 20;
                                ignore_newline = false;
                                indicate_hidden = true;
                                padding = 4;
                                separator_color = "auto";
                                separator_height = 2;
                                show_age_threshold = 60;
                                sort = true;
                                word_wrap = true;
                        };

                        urgency_low = {
                                background = "#1a1a1a";
                                foreground = "#b8b8b8";
                                frame_color = "#3d99ba";
                                timeout = 10;
                        };

                        urgency_normal = {
                                background = "#1a1a1a";
                                foreground = "#b8b8b8";
                                frame_color = "#015b82";
                                timeout = 10;
                        };

                        urgency_critical = {
                                background = "#1a1a1a";
                                foreground = "#b8b8b8";
                                frame_color = "#9e0000";
                                timeout = 0;
                        };
                };
        };

        services.gpg-agent = {
                enable = true;
                enableSshSupport = true;
        };

        services.redshift = {
                enable = true;
                latitude = "48.853";
                longitude = "2.35";
                temperature.night = 3000;
        };

        services.unclutter.enable = true;

        home.file.".config/i3/config".source = ./files/i3_config;
        home.file.".config/i3/bar".source = ./files/i3status_rs.toml;
        home.file.".config/i3/wallpaper".source = ./files/wallpaper.jpg;
        home.file.".config/alacritty/alacritty.yml".source = ./files/alacritty.yml;
        home.file.".editorconfig".source = ./files/editorconfig;
        home.file.".local/share/rofi/themes/base16-dracula.rasi".source = ./files/rofi_theme;
}
