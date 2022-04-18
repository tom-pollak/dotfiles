;;; config.el -*- lexical-binding: t; -*-

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*General config][General config:3]]
(setq user-full-name "Tom Pollak"
      user-mail-address "tompollak1000@gmail.com")
;; General config:3 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Simple settings][Simple settings:1]]
(setq-default
 delete-by-moving-to-trash t
 window-combination-resize t ; take new window space from all other windows (not just current)
 x-stretch-cursor t)         ; stretch cursor to glyph width

(setq max-lisp-eval-depth 10000)

(setq undo-limit 80000000
      evil-want-fine-undo t  ; by default while in insert all changes are one big blob. Be more granular
      auto-save-default t
      make-backup-files t
      truncate-string-ellipsis "…"
      password-cache-expiry nil
      ;; scroll-preserve-screen-position 'always
      scroll-margin 4
      display-line-numbers-type 'relative)
;; Simple settings:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Auth sources][Auth sources:1]]
(after! auth-source
  (setq auth-sources (nreverse auth-sources)))
;; Auth sources:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Frame sizing][Frame sizing:1]]
(add-to-list 'default-frame-alist '(height . 35))
(add-to-list 'default-frame-alist '(width . 110))
;; Frame sizing:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Splitting the window][Splitting the window:1]]
(setq evil-vsplit-window-right t
      evil-split-window-below t)
;; Splitting the window:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Splitting the window][Splitting the window:2]]
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))
;; Splitting the window:2 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Better mouse support][Better mouse support:1]]
;; Mouse buttons
(map! :n [mouse-8] #'better-jumper-jump-backward
      :n [mouse-9] #'better-jumper-jump-forward)
;; Better mouse support:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Set command complete shorter][Set command complete shorter:1]]
;; Python black formatting
(setq which-key-idle-delay 0.4)
;; Set command complete shorter:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Set command complete shorter][Set command complete shorter:2]]
(setq eros-eval-result-prefix "⟹ ")
;; Set command complete shorter:2 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Set autocomplete in text & markdown][Set autocomplete in text & markdown:1]]
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

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Twitter emojis][Twitter emojis:1]]
;; Twitter emojis 😀
(setq emojify-emoji-set "twemoji-v2")
;; Twitter emojis:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Twitter emojis][Twitter emojis:2]]
;; %s/.../.../g
(after! evil (setq evil-ex-substitute-global t))
;; Twitter emojis:2 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Twitter emojis][Twitter emojis:3]]
;; Nested snippets
(setq yas-triggers-in-field t)
;; Twitter emojis:3 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Mix in snippets with LSP completions][Mix in snippets with LSP completions:1]]
(setq +lsp-company-backends '(:separate company-yasnippet company-capf))
;; Mix in snippets with LSP completions:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*High contrast line number][High contrast line number:1]]
(custom-set-faces
    '(line-number ((t (:foreground "orange"))))
)
;; High contrast line number:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Default project paths][Default project paths:1]]
(setq projectile-project-search-path '("~/projects/"))
;; Default project paths:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Theme][Theme:1]]
(setq doom-theme 'doom-molokai)
;; Theme:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Theme][Theme:1]]
(remove-hook 'window-setup-hook #'doom-init-theme-h)
(add-hook 'after-init-hook #'doom-init-theme-h 'append)
(delq! t custom-theme-load-path)

;; Set red text to orange
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))
;; Theme:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*PDF Modeline][PDF Modeline:1]]
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

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Dashboard][Dashboard:1]]
 (let ((alternatives '(
                      "banner.png"
                      "cute-demon.png"
                      "emacs-logo-vim.png"
                      "i-am-doom.png"
                      "trancendent-gnu.png")))

    (setq fancy-splash-image (concat doom-private-dir "splash/"
                                    (nth (random (length alternatives)) alternatives))))
;; Dashboard:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*LSP mode][LSP mode:1]]
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "/Users/tom/Desktop/'")
  ;; or
  (add-to-list 'lsp-file-watch-ignored-files "[/\\\\]\\.my-files\\'"))
;; LSP mode:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Font face][Font face:1]]
(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 12)
      doom-big-font (font-spec :family "FiraCode Nerd Font Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 12)
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))
;; Font face:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Font face][Font face:3]]
  ;; No missing fonts detected
;; Font face:3 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Window default name][Window default name:1]]
(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")
;; Window default name:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Disabling some ligatures][Disabling some ligatures:1]]
(plist-put! +ligatures-extra-symbols
  :and           nil
  :or            nil
  :for           nil
  :not           nil
  :true          nil
  :false         nil
  :int           nil
  :float         nil
  :str           nil
  :bool          nil
  :list          nil
)

(let ((ligatures-to-disable '(:true :false :int :float :str :bool :list :and :or :for :not)))
  (dolist (sym ligatures-to-disable)
    (plist-put! +ligatures-extra-symbols sym nil)))
;; Disabling some ligatures:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Treesitter][Treesitter:2]]
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
;; Treesitter:2 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Formatting][Formatting:2]]
(use-package! python-black
  :demand t
  :after python)
(add-hook! 'python-mode-hook #'python-black-on-save-mode)

(map! :leader :desc "Blacken Buffer" "m b b" #'python-black-buffer)

(setq +python-ipython-repl-args '("-i" "--simple-prompt" "--no-color-info"))
(setq +python-jupyter-repl-args '("--simple-prompt"))
;; Formatting:2 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Melpa][Melpa:1]]
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
;; Melpa:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Make manual pages look nice][Make manual pages look nice:2]]
(use-package! info-colors
  :commands (info-colors-fontify-node))

(add-hook 'Info-selection-hook 'info-colors-fontify-node)
;; Make manual pages look nice:2 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Very large files][Very large files:2]]
;; (use-package! vlf-setup
;;   :defer-incrementally vlf-tune vlf-base vlf-write vlf-search vlf-occur vlf-follow vlf-ediff vlf)
;; Very large files:2 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Stylish][Stylish:1]]
(setq haskell-stylish-on-save t)
(setq haskell-mode-stylish-haskell-path "brittany")
;; Stylish:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Undo tree][Undo tree:1]]
(use-package! undo-tree
  :init
  (setq undo-tree-visualizer-timestamps t
        undo-tree-visualizer-diff t)
  :config
  ;; stolen from layers/+spacemacs/spacemacs-editing/package.el
  (progn
    ;; restore diff window after quit.  TODO fix upstream
    (defun my/undo-tree-restore-default ()
      (setq undo-tree-visualizer-diff t))
    (advice-add 'undo-tree-visualizer-quit :after #'my/undo-tree-restore-default))
  (global-undo-tree-mode 1))
;; Undo tree:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Flycheck][Flycheck:1]]
;; (setq flycheck-standard-error-navigation nil)
(defun flycheck-or-norm-next-error (&optional n reset)
  (interactive "P")
  (if flycheck-mode
      (flycheck-next-error n reset)
    (next-error n reset)))
(defun flycheck-or-norm-previous-error (&optional n)
  (interactive "P")
  (if flycheck-mode
      (flycheck-previous-error n)
    (previous-error n)))

(define-key evil-normal-state-map "ge" 'flycheck-or-norm-next-error)
(define-key evil-normal-state-map "gE" 'flycheck-or-norm-previous-error)

;; Optional: ensure flycheck cycles, both when going backward and forward.
;; Tries to handle arguments correctly.
;; Since flycheck-previous-error is written in terms of flycheck-next-error,
;; advising the latter is enough.
(defun flycheck-next-error-loop-advice (orig-fun &optional n reset)
  ; (message "flycheck-next-error called with args %S %S" n reset)
  (condition-case err
      (apply orig-fun (list n reset))
    ((user-error)
     (let ((error-count (length flycheck-current-errors)))
       (if (and
            (> error-count 0)                   ; There are errors so we can cycle.
            (equal (error-message-string err) "No more Flycheck errors"))
           ;; We need to cycle.
           (let* ((req-n (if (numberp n) n 1)) ; Requested displacement.
                  ; An universal argument is taken as reset, so shouldn't fail.
                  (curr-pos (if (> req-n 0) (- error-count 1) 0)) ; 0-indexed.
                  (next-pos (mod (+ curr-pos req-n) error-count))) ; next-pos must be 1-indexed
             ; (message "error-count %S; req-n %S; curr-pos %S; next-pos %S" error-count req-n curr-pos next-pos)
             ; orig-fun is flycheck-next-error (but without advise)
             ; Argument to flycheck-next-error must be 1-based.
             (apply orig-fun (list (+ 1 next-pos) 'reset)))
         (signal (car err) (cdr err)))))))

(advice-add 'flycheck-next-error :around #'flycheck-next-error-loop-advice)


;; The following might be needed to ensure flycheck is loaded.
;; Hooking is required if flycheck is installed as an ELPA package (from any repo).
;; If you use ELPA, you might want to merge this with any existing hook you might have.
(add-hook 'after-init-hook
          #'(lambda ()
              (after-packages-loaded-hook)))

(defun after-packages-loaded-hook ()
  (require 'flycheck))
;; Flycheck:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Esup][Esup:1]]
(use-package esup
  :ensure t
  :pin melpa-stable)
;; Esup:1 ends here

;; [[file:../projects/dotfiles/doom/doom.d/config.org::*Org][Org:1]]
(setq org-directory "~/org/") ; let's put files here
;; Org:1 ends here
