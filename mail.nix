{ config, lib, pkgs, ... }:

{
  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.notmuch.enable = true;

  accounts.email.accounts = {
    "gmail" = {
      address = "gpagnoux@gmail.com";
      realName = "Guillaume Pagnoux";
      primary = true;
      flavor = "gmail.com";
      notmuch.enable = true;

      mbsync = {
        enable = true;
        create = "both";
        expunge = "both";
        remove = "both";

        patterns = [
          "*"
          "![Gmail]*"
        ];
      };
      passwordCommand = "gpg -q --decrypt ~/.mail/gmail.gpg";

      msmtp = {
        enable = true;
      };
    };

    "lse" = {
      address = "guillaume.pagnoux@lse.epita.fr";
      realName = "Guillaume Pagnoux";
      userName = "pagnou_g";

      msmtp.enable = true;
      msmtp.extraConfig = { auth = "plain"; };
      smtp = {
        host = "mail.cri.epita.fr";
        port = 587;
        tls.useStartTls = true;
      };
      passwordCommand = "gpg -q --decrypt ~/.mail/lse.gpg";
    };
  };

  home.file.".mail/gmail.gpg".source = ./files/pass/gmail.gpg;
  home.file.".mail/lse.gpg".source = ./files/pass/lse.gpg;
}
