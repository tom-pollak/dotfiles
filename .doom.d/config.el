;;; config.el -*- lexical-binding: t; -*-

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Personal Information][Personal Information:1]]
(setq user-full-name "Tom Pollak"
      user-mail-address "tompollak1000@gmail.com")
;; Personal Information:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Simple settings][Simple settings:1]]
(setq-default
 delete-by-moving-to-trash t
 window-combination-resize t ; take new window space from all other windows (not just current)
 x-stretch-cursor t)         ; stretch cursor to glyph width

(setq max-lisp-eval-depth 10000)

(setq undo-limit 80000000
      evil-want-fine-undo t  ; by default while in insert all changes are one big blob. Be more granular
      auto-save-default t
      truncate-string-ellipsis "…"
      password-cache-expiry nil
      ;; scroll-preserve-screen-position 'always
      scroll-margin 2
      display-line-numbers-type 'relative)

(global-subword-mode 1) ; Iterate through CamelCase words
;; Simple settings:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Frame sizing][Frame sizing:1]]
(add-to-list 'default-frame-alist '(height . 35))
(add-to-list 'default-frame-alist '(width . 110))
;; Frame sizing:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Auto-customisations][Auto-customisations:1]]
;; (setq-default custom-file (expand-file-name "config.el" doom-private-dir))
;; (when (file-exists-p custom-file)
;;   (load custom-file))
;; Auto-customisations:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Splitting the window][Splitting the window:1]]
(setq evil-vsplit-window-right t
      evil-split-window-below t)
;; Splitting the window:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Splitting the window][Splitting the window:2]]
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))
;; Splitting the window:2 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Better mouse support][Better mouse support:1]]
;; Mouse buttons
(map! :n [mouse-8] #'better-jumper-jump-backward
      :n [mouse-9] #'better-jumper-jump-forward)
;; Better mouse support:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Set command complete shorter][Set command complete shorter:1]]
;; Python black formatting
(setq which-key-idle-delay 0.4)
;; Set command complete shorter:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Set command complete shorter][Set command complete shorter:2]]
(setq eros-eval-result-prefix "⟹ ")
;; Set command complete shorter:2 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Set autocomplete in text & markdown][Set autocomplete in text & markdown:1]]
;; set autocomplete in text & markdown
(set-company-backend!
  '(text-mode
    markdown-mode
    gfm-mode)
  '(:seperate
    company-ispell
    company-files
    company-yasnippet))
;; Set autocomplete in text & markdown:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Twitter emojis][Twitter emojis:1]]
;; Twitter emojis 😀
(setq emojify-emoji-set "twemoji-v2")
;; Twitter emojis:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Twitter emojis][Twitter emojis:2]]
;; %s/.../.../g
(after! evil (setq evil-ex-substitute-global t))
;; Twitter emojis:2 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Twitter emojis][Twitter emojis:3]]
;; Nested snippets
(setq yas-triggers-in-field t)
;; Twitter emojis:3 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Mix in snippets with LSP completions][Mix in snippets with LSP completions:1]]
(setq +lsp-company-backends '(:separate company-yasnippet company-capf))
;; Mix in snippets with LSP completions:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*High contrast line number][High contrast line number:1]]
(custom-set-faces
    '(line-number ((t (:foreground "orange"))))
)
;; High contrast line number:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Theme][Theme:1]]
(setq doom-theme 'doom-molokai)
;; Theme:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Theme][Theme:1]]
(remove-hook 'window-setup-hook #'doom-init-theme-h)
(add-hook 'after-init-hook #'doom-init-theme-h 'append)
(delq! t custom-theme-load-path)

;; Set red text to orange
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))
;; Theme:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*PDF Modeline][PDF Modeline:1]]
(after! doom-modeline
  (doom-modeline-def-segment buffer-name
    "Display the current buffer's name, without any other information."
    (concat
     (doom-modeline-spc)
     (doom-modeline--buffer-name)))

  (doom-modeline-def-segment pdf-icon
    "PDF icon from all-the-icons."
    (concat
     (doom-modeline-spc)
     (doom-modeline-icon 'octicon "file-pdf" nil nil
                         :face (if (doom-modeline--active)
                                   'all-the-icons-red
                                 'mode-line-inactive)
                         :v-adjust 0.02)))

  (defun doom-modeline-update-pdf-pages ()
    "Update PDF pages."
    (setq doom-modeline--pdf-pages
          (let ((current-page-str (number-to-string (eval `(pdf-view-current-page))))
                (total-page-str (number-to-string (pdf-cache-number-of-pages))))
            (concat
             (propertize
              (concat (make-string (- (length total-page-str) (length current-page-str)) ? )
                      " P" current-page-str)
              'face 'mode-line)
             (propertize (concat "/" total-page-str) 'face 'doom-modeline-buffer-minor-mode)))))

  (doom-modeline-def-segment pdf-pages
    "Display PDF pages."
    (if (doom-modeline--active) doom-modeline--pdf-pages
      (propertize doom-modeline--pdf-pages 'face 'mode-line-inactive)))

  (doom-modeline-def-modeline 'pdf
    '(bar window-number pdf-pages pdf-icon buffer-name)
    '(misc-info matches major-mode process vcs)))
;; PDF Modeline:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Dashboard][Dashboard:1]]
(setq +doom-dashboard-banner-file (expand-file-name "banner.png" doom-private-dir))
;; Dashboard:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*LSP mode][LSP mode:1]]
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.Desktop\\'")
  ;; or
  (add-to-list 'lsp-file-watch-ignored-files "[/\\\\]\\.my-files\\'"))
;; LSP mode:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Font face][Font face:1]]
(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 14)
      doom-big-font (font-spec :family "FiraCode Nerd Font Mono" :size 18)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 14)
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))
;; Font face:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Font face][Font face:3]]
  (unless noninteractive
    (add-hook! 'doom-init-ui-hook
      (run-at-time nil nil
                   (lambda nil
                     (message "%s missing the following fonts: %s"
                              (propertize "Warning!" 'face
                                          '(bold warning))
                              (mapconcat
                               (lambda
                                 (font)
                                 (propertize font 'face 'font-lock-variable-name-face))
                               '("JuliaMono" "Merriweather" "Alegreya")
                               ", "))
                     (sleep-for 0.5)))))
;; Font face:3 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Window default name][Window default name:1]]
(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")
;; Window default name:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Treesitter][Treesitter:2]]
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
;; Treesitter:2 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Linting][Linting:2]]
(setq flycheck-python-pylint-executable "pylint")
(use-package! lsp-pyright
  :config
  (setq lsp-clients-python-command "pyright")
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))
;; Linting:2 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Formatting][Formatting:2]]
(use-package! python-black
  :demand t
  :after python)
(add-hook! 'python-mode-hook #'python-black-on-save-mode)

(map! :leader :desc "Blacken Buffer" "m b b" #'python-black-buffer)

(setq +python-ipython-repl-args '("-i" "--simple-prompt" "--no-color-info"))
(setq +python-jupyter-repl-args '("--simple-prompt"))
;; Formatting:2 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Elpy][Elpy:2]]
(use-package elpy
  :ensure t
  :init
  (elpy-enable))
;; Elpy:2 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Make manual pages look nice][Make manual pages look nice:2]]
(use-package! info-colors
  :commands (info-colors-fontify-node))

(add-hook 'Info-selection-hook 'info-colors-fontify-node)
;; Make manual pages look nice:2 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Auto activating snippets][Auto activating snippets:2]]
(use-package! aas
  :commands aas-mode)
;; Auto activating snippets:2 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Very large files][Very large files:2]]
;; (use-package! vlf-setup
;;   :defer-incrementally vlf-tune vlf-base vlf-write vlf-search vlf-occur vlf-follow vlf-ediff vlf)
;; Very large files:2 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Configuration][Configuration:1]]
(setq ispell-dictionary "en-custom")
;; Configuration:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Stylish][Stylish:1]]
(setq haskell-stylish-on-save t)
;; Stylish:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Parinfer][Parinfer:1]]
(use-package parinfer-rust-mode
  :hook emacs-lisp-mode
  :init)
(setq parinfer-rust-auto-download t)
;; Parinfer:1 ends here

;; [[file:../Desktop/projects/dotfiles/.doom.d/config.org::*Org][Org:1]]
(setq org-directory "~/org/") ; let's put files here
;; Org:1 ends here
