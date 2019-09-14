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
      passwordCommand = "gpg -q --decrypt ~/Maildir/gmail/pass.gpg";

      msmtp = {
        enable = true;
      };
    };
  };
}
