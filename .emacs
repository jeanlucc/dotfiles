;;; package --- .emacs
;;; Commentary:

;;; Code:
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (terraform-mode hcl-mode typescript-mode rust-mode go-mode vue-mode markdown-mode rjsx-mode json-mode yaml-mode helm web-mode use-package php-mode coffee-mode yaml-mode)))
 '(remote-shell-program "/usr/bin/bash"))

(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;;; Toujours bon
(add-to-list 'load-path "~/.emacs.d/lisp/")
;(prefer-coding-system 'utf-8) ;;; codage en utf-8
(setq make-backup-files nil) ;;; pas de fichier de sauvegarde permanent
(setq inhibit-startup-message t) ;;; pas de message d'accueil à la con
(delete-selection-mode 1)
;(add-hook 'text-mode-hook 'turn-on-auto-fill) ;;; retour à la ligne automatique
;(setq x-select-enable-clipboard t) ;;; utilise le clipboard (copie du système)
(require 'pbcopy) (turn-on-pbcopy) ;;; utilise le clipboard -nw
(show-paren-mode 1) ;;; affichage des couples de parenthèses
(require 'mouse) (defun track-mouse (e)) (xterm-mouse-mode t) ;;; active la souris
(setq-default indent-tabs-mode nil) ;;; fait l'indentation avec des espaces
(setq-default c-default-style "linux" ;;; ne sur-indente pas les accolades
              c-basic-offset 4) ;;; la taille de l'indentation est de 4 espaces
(setq column-number-mode t) ;;; affiche le numéro de la colonne
(setq-default show-trailing-whitespace t) ;;; affiche les espaces en fin de ligne
(menu-bar-mode -1)

;(require 'uniquify)
;(setq uniquify-buffer-name-style 'forward) ;;; use path to make buffer names uniq

;;;; Pas toujours automatique
;(set-face-foreground 'font-lock-comment-face "red") ;;; affiche l'ensemble de commentaire en rouge

;;;; Web
;(require 'less-css-mode)

;(require 'web-mode) ;;; load html/php mode
;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;(setq web-mode-markup-indent-offset 4)
;(setq web-mode-css-indent-offset 4)
;(setq web-mode-code-indent-offset 4)

;(setq web-mode-tag-auto-close-style 0)

;(set-face-attribute 'web-mode-doctype-face nil :foreground "cyan")
;(set-face-attribute 'web-mode-html-tag-face nil :foreground "blue" :weight 'bold)
;(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "blue" :inherit nil)
;(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "yellow")
;(set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "green" :weight 'bold)
;(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "green")

;(require 'js2-mode)
;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;(setq js2-basic-offset 2)

;; Angular
(require 'jade-mode)

;(require 'json-mode)
;(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))

;;; config
(require 'php-conf)
(require 'js-conf)
(require 'css-conf)
(require 'coffee-conf)
(require 'multi-occur-conf)
(require 'enable-conf)
(require 'mac-conf)
(require 'yaml-conf)
(require 'mmm-mode-conf)

(provide '.emacs)
;;; .emacs ends here
