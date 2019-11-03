;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Let's define some custom LaTeX classes
;; My report: level one org headings are chapters
;; My abstract: level one org headings are sections

(setq-default user-full-name "Guillaume Pagnoux"
              user-mail-address "guillaume.pagnoux@lse.epita.fr"

              doom-font (font-spec :family "Iosevka Nerd Font" :size 28)
              doom-big-font (font-spec :family "Iosevka Nerd Font" :size 50)
              c-default-style "linux")

(setq epa-pinentry-mode 'loopback
      magit-repository-directories '(("~/repo/" . 1))
      scroll-margin 4
      transient-values '((magit-commit "--signoff" "--allow-empty")
                         (magit-pull "--rebase")
                         (magit-rebase "--autosquash")))

(map! :ni "C-h" #'evil-window-left
      :ni "C-j" #'evil-window-down
      :ni "C-k" #'evil-window-up
      :ni "C-l" #'evil-window-right)

(load-theme 'doom-dracula t)

(use-package! exec-path-from-shell
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK"))

;; (load! "+debug")
(load! "+gnus")
(load! "+org")

(setq custom-file "~/.doom.d/custom.el")
