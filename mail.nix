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
        create = "maildir";
      };
      passwordCommand = "gpg -q --decrypt ~/.mail/gmail.gpg";

      msmtp = {
        enable = true;
      };
    };
  };

  home.file.".mail/gmail.gpg".source = ./files/pass/gmail.gpg;
}
