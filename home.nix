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
        bat
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

    programs.emacs.enable = true;
    programs.gpg.enable = true;

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

    programs.home-manager.enable = true;

    services.redshift = {
        enable = true;
        latitude = "48.853";
        longitude = "2.35";
        temperature.night = 3000;
    };

    home.file.".config/i3/config".source = ./files/i3_config;
    home.file.".config/i3/bar".source = ./files/i3status_rs.toml;
    home.file.".config/i3/wallpaper".source = ./files/wallpaper.jpg;
    home.file.".config/alacritty/alacritty.yml".source = ./files/alacritty.yml;
    home.file.".editorconfig".source = ./files/editorconfig;
    home.file.".local/share/rofi/themes/base16-dracula.rasi".source = ./files/rofi_theme;
}
