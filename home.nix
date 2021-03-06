{ config, pkgs, ... }:
let
  settings = import ./config;
  editor = "vim";
in {
  imports = [ ./mail.nix ./vim.nix ./zsh.nix ];

  home.packages = with pkgs; [
    texlive.combined.scheme-full

    # WM tools
    alacritty
    rofi

    # Fonts
    iosevka-nerd

    # CTF Tools
    ghidra-bin
    python3Packages.binwalk-full
    wireshark-qt

    # dev tools
    (lib.hiPrio gcc)
    (lib.lowPrio clang)
    bear
    binutils
    clang-tools
    cmake
    ctags
    gdb
    gitAndTools.tig
    git-quick-stats
    gnumake
    meson
    ninja
    patchelf
    rr
    rustup
    vagrant
    valgrind

    # i3
    acpi
    i3lock-fancy
    i3status-rust

    # Lisp
    sbcl
    #lispPackages.quicklisp

    # Python
    pipenv
    python3
    python3Packages.black
    python3Packages.ipython
    python3Packages.nose
    python3Packages.pyflakes
    python3Packages.pygments
    python3Packages.pyls-black
    python3Packages.pyls-isort
    python3Packages.pyls-mypy
    python3Packages.pytest
    python3Packages.python-language-server

    # CLI tools
    _1password
    exa
    fd
    file
    fzf
    htop
    gotop
    iftop
    iotop
    ldns
    ltrace
    loc
    manpages
    megasync
    nix-index
    nixops
    nox
    ripgrep
    scrot
    sshfs
    thefuck
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
    tdesktop
    virtmanager
    vlc
    networkmanagerapplet

    # Testing
    packer

    # Emacs dependencies
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.fr
    ccls
    editorconfig-core-c
    nixfmt
    shellcheck

    # Presentations tools
    screenkey

    # Reverse
    radare2
  ];

  programs.bat = {
    enable = true;
    config = { tabs = "8"; };
  };

  programs.direnv = { enable = true; };

  programs.emacs.enable = true;

  programs.firefox = {
    enable = true;
    profiles."bite" = {
      userChrome = ''
        #TabsToolbar {
          visibility: collapse;
        }
        #sidebar-header {
          visibility: collapse !important;
        }
      '';
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };

  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userEmail = "guillaume.pagnoux@lse.epita.fr";
    userName = "Guillaume Pagnoux";
    signing.key = "EC5065899AEAAF4C";
    signing.signByDefault = true;

    extraConfig = {
      core = { whitespace = "trailing-space,space-before-tab"; };
      color = { ui = "auto"; };
      merge = { ff = "only"; };
      rerere = { enabled = "true"; };
      rebase = { autoSquash = "true"; };
      github = { user = "Yumasi"; };
    };

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
        port = 43186;
        forwardX11 = true;
      };

      "multun" = { hostname = "multun.net"; };

      "build" = { hostname = "build"; };
    };

    extraConfig = "AddKeysToAgent yes";
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

    defaultCacheTtl = 86400;
    defaultCacheTtlSsh = 86400;
    maxCacheTtl = 86400;
    maxCacheTtlSsh = 86400;
    enableSshSupport = true;
    extraConfig = ''
      pinentry-program ${pkgs.pinentry-qt}/bin/pinentry
    '' + ''
      allow-loopback-pinentry
    '';
  };

  services.redshift = {
    enable = true;
    latitude = "48.853";
    longitude = "2.35";
    temperature.night = 3000;
    temperature.day = 5000;
  };

  services.screen-locker = {
    enable = true;
    lockCmd = "\${pkgs.i3lock-fancy}/bin/i3lock-fancy";
  };

  services.unclutter.enable = true;

  home.file.".authinfo.gpg".source = ./files/pass/authinfo.gpg;
  home.file.".config/i3/config".source = ./files/i3_config;
  home.file.".config/i3/bar".source = ./files/i3status_rs
    + ".${settings.flavour}.toml";
  home.file.".config/i3/wallpaper".source = ./files/wallpaper.jpg;
  home.file.".config/alacritty/alacritty.yml".source = ./files/alacritty.yml;
  home.file.".editorconfig".source = ./files/editorconfig;
  home.file.".local/share/rofi/themes/base16-dracula.rasi".source =
    ./files/rofi_theme;

  # Doom config files
  home.file.".doom.d/+debug.el".source = ./files/doom/+debug.el;
  home.file.".doom.d/+gnus.el".source = ./files/doom/+gnus.el;
  home.file.".doom.d/+org.el".source = ./files/doom/+org.el;
  home.file.".doom.d/config.el".source = ./files/doom/config
    + ".${settings.flavour}.el";
  home.file.".doom.d/init.el".source = ./files/doom/init.el;
  home.file.".doom.d/packages.el".source = ./files/doom/packages.el;
  home.file.".emacs".source = ./files/chemacs/.emacs;
  home.file.".emacs-profiles.el".source = ./files/emacs-profiles.el;
  home.file.".spacemacs".source = ./files/spacemacs;

  home.sessionVariables = {
    EDITOR = "${editor}";
    PATH =
      "$HOME/.config/zsh/scripts:$HOME/.emacs.d/bin:$HOME/.cargo/bin:$PATH";
  };
}
