;; --- Minibuffer completion: Vertico + Orderless + Marginalia + Consult + Embark ---

;; Vertico — vertical minibuffer completion UI
(use-package vertico
  :init
  (vertico-mode)
  :config
  (setq vertico-cycle t
        vertico-count 15))

;; Orderless — flexible matching (space-separated terms, regex, etc.)
(use-package orderless
  :config
  (setq completion-styles '(orderless basic)
        completion-category-overrides '((file (styles basic partial-completion)))))

;; Marginalia — rich annotations in the minibuffer
(use-package marginalia
  :init
  (marginalia-mode))

;; Consult — search, navigation, buffer switching
(use-package consult
  :bind (("M-x"     . execute-extended-command)  ; keep default, vertico enhances it
         ("M-y"     . consult-yank-pop)
         ("C-x b"   . consult-buffer)
         ("C-x C-f" . find-file)                 ; keep default, vertico enhances it
         ("C-c h o" . consult-line)               ; replaces helm-swoop
         ("C-c s"   . consult-ripgrep)            ; replaces helm-multi-swoop-all
         ("C-h SPC" . consult-mark)               ; replaces helm-all-mark-rings
         ("C-c h x" . consult-register))
  :config
  (setq consult-narrow-key "<"))

;; Embark — contextual actions on minibuffer candidates
(use-package embark
  :bind (("C-."   . embark-act)
         ("C-;"   . embark-dwim)
         ("C-h B" . embark-bindings))
  :config
  (setq prefix-help-command #'embark-prefix-help-command))

;; Embark-Consult integration
(use-package embark-consult
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(provide 'setup-completion)
