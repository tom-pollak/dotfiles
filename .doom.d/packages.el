;; [[file:../projects/dotfiles/.doom.d/config.org::*Treesitter][Treesitter:1]]
(package! tree-sitter)
(package! tree-sitter-langs)
;; Treesitter:1 ends here

;; [[file:../projects/dotfiles/.doom.d/config.org::*Python formatting][Python formatting:1]]
(package! python-black)
;; Python formatting:1 ends here

;; [[file:../projects/dotfiles/.doom.d/config.org::*Make manual pages look nice][Make manual pages look nice:1]]
(package! info-colors :pin "47ee73cc19b1049eef32c9f3e264ea7ef2aaf8a5")
;; Make manual pages look nice:1 ends here

;; [[file:../projects/dotfiles/.doom.d/config.org::*Auto activating snippets][Auto activating snippets:1]]
(package! aas :recipe (:host github :repo "ymarco/auto-activating-snippets")
  :pin "1699bec4d244a1f62af29fe4eb8b79b6d2fccf7d")
;; Auto activating snippets:1 ends here

;; [[file:../projects/dotfiles/.doom.d/config.org::*Very large files][Very large files:1]]
;; (package! vlf :recipe (:host github :repo "m00natic/vlfi" :files ("*.el"))
;;   :pin "cc02f2533782d6b9b628cec7e2dcf25b2d05a27c" :disable t)
;; Very large files:1 ends here
