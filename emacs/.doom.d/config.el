;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ivan Lomakin"
      user-mail-address "shplender77@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Hack NF" :size 20 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Hack NF" :size 20)
      doom-unicode-font doom-font)
;; doom-unicode-font (font-spec :family "Hack" :size 20 :weight 'regular)
(custom-set-faces!
  '(fixed-pitch-serif :family "Hack NF" :size 18 :bold t :foreground "#00f5ff")
  '(font-lock-comment-face :foreground "dark gray" :slant italic)
  '(hl-line (t :background "#000000"))
  '(show-paren-match :foreground "green" :slant italic))
(setq org-hide-emphasis-markers t)


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Work"
      org-agenda-files (directory-files-recursively "~/Work" "\\.org$"))

;; To filter sertain directory from lookup by adding a array filter.
;; Example, filtering out all org files in xxxx/xxx/daily/ directory:

;; (setq org-agenda-files
;;       (seq-filter (lambda(x) (not (string-match "/daily/"(file-name-directory x))))
;;        (directory-files-recursively "~/Notes/roam" "\\.org$")
;;        ))



;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; emacs maximized.

(add-to-list 'initial-frame-alist '(fullscreen . maximized)
             'default-frame-alist '(fullscreen . maximized))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; ==== beacon settings {{{ ====
;; (use-package beacon)
;; (beacon-mode t)
;; (setq beacon-color "#ff8c00")
;; (setq beacon-size 50)
;; (setq beacon-blink-delay 0.3)
;; (setq beacon-blink-when-focused t)
;; (setq beacon-blink-when-point-moves-horizontally 30)
;; (setq beacon-blink-when-point-moves-vertically 10)
;; (setq beacon-blink-when-buffer-changes t)
;; (setq beacon-blink-duration 0.3)
;; ==== end beacon settings }}} ====


;; ==== Transparency ====
;; (set-frame-parameter (selected-frame) 'alpha  90)
;; (add-to-list 'default-frame-alist '(alpha . (92 . 90)))

;; ==== Evil googles ==== not working yet/ didn't figure it out yet.
;; (after! evil-goggles
;;   (setq evil-goggles-pulse t)
;;   '(evil-goggles-default-face ((t (:inherit 'popup-menu-mouse-face)))))
;;
;;==== Encryption ====
(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance '("crypt"))

(setq org-crypt-key nil)
;; GPG key to use for encryption
;; Either the Key ID or set to nil to use symmetric encryption.

;; (setq auto-save-default nil)
;; Auto-saving does not cooperate with org-crypt.el: so you need to
;; turn it off if you plan to use org-crypt.el quite often.  Otherwise,
;; you'll get an (annoying) message each time you start Org.

;; To turn it off only locally, you can insert this:
;;
;; # -*- buffer-auto-save-file-name: nil; -*-
(setq python-shell-completion-native-disabled-interpreters '("python3"))

;; HACK: fix python f-strings + smartparens
(after! smartparens
  (sp-local-pair '(python-mode) "f\"" "\"")
  (sp-local-pair '(python-mode) "f'" "'"))


(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
