;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Tom Pollak"
      user-mail-address "tompollak1000@gmail.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Default settings
(setq-default
 delete-by-moving-to-trash t
 window-combination-resize t ; take new window space from all other windows (not just current)
 x-stretch-cursor t)         ; stretch cursor to glyph width

(setq undo-limit 80000000
      evil-want-fine-undo t  ; by defualt while in insert all changes are one big blob. Be more granular
      auto-save-default t
      truncate-string-ellipsis "…"
      password-cache-expiry nil
      ;; scroll-preserve-screen-position 'always
      scroll-margin 2)

(global-subword-mode 1) ; Iterate through CamelCase words

;; Defualt frame sizing
(add-to-list 'default-frame-alist '(height . 96))
(add-to-list 'default-frame-alist '(width . 320))

;; Ask what buffer to show after a split
(setq evil-vsplit-window-right t
      evil-split-window-below t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))

;; Fonts
(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-big-font (font-spec :family "JetBrains Mono" :size 18)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 14)
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))

;; Font checking
(defvar required-fonts '("JetBrainsMono.*" "Overpass" "JuliaMono" "IBM Plex Mono" "Merriweather" "Alegreya"))

(defvar available-fonts
  (delete-dups (or (font-family-list)
                   (split-string (shell-command-to-string "fc-list : family")
                                 "[,\n]"))))

(defvar missing-fonts
  (delq nil (mapcar
             (lambda (font)
               (unless (delq nil (mapcar (lambda (f)
                                           (string-match-p (format "^%s$" font) f))
                                         available-fonts))
                 font))
             required-fonts)))

(if missing-fonts
    (pp-to-string
     `(unless noninteractive
        (add-hook! 'doom-init-ui-hook
          (run-at-time nil nil
                       (lambda ()
                         (message "%s missing the following fonts: %s"
                                  (propertize "Warning!" 'face '(bold warning))
                                  (mapconcat (lambda (font)
                                               (propertize font 'face 'font-lock-variable-name-face))
                                             ',missing-fonts
                                             ", "))
                         (sleep-for 0.5))))))
  ";; No missing fonts detected")

;; Modeline
(setq doom-theme 'doom-vibrant)
(remove-hook 'window-setup-hook #'doom-init-theme-h)
(add-hook 'after-init-hook #'doom-init-theme-h 'append)
(delq! t custom-theme-load-path)

;; Set red text to orange
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))


;; Default buffer names
(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")


;; Mouse buttons
(map! :n [mouse-8] #'better-jumper-jump-backward
      :n [mouse-9] #'better-jumper-jump-forward)

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; Python black formatting

(use-package! python-black
  :demand t
  :after python)
(add-hook! 'python-mode-hook #'python-black-on-save-mode)

(map! :leader :desc "Blacken Buffer" "m b b" #'python-black-buffer)

(setq +python-ipython-repl-args '("-i" "--simple-prompt" "--no-color-info"))
(setq +python-jupyter-repl-args '("--simple-prompt"))

(setq which-key-idle-delay 0.4)

(setq eros-eval-result-prefix "⟹ ")

(setq yas-triggers-in-field t)
