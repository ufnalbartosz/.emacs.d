;; GROUP: Editing -> Editing Basics

(setq global-mark-ring-max 5000         ; increase mark ring to contains 5000 entries
      mark-ring-max 5000                ; increase kill ring to contains 5000 entries
      mode-require-final-newline t      ; add a newline to end of file
      tab-width 4                       ; default to 4 visible spaces to display a tab
      )

(add-hook 'sh-mode-hook (lambda ()
                         (setq tab-width 4)))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq-default indent-tabs-mode nil)
(delete-selection-mode)
(global-set-key (kbd "RET") 'newline-and-indent)

;; GROUP: Editing -> Killing
(setq kill-ring-max 5000 ; increase kill-ring capacity
      kill-whole-line t  ; if NIL, kill whole line and move the next line up
      )

;; show whitespace in diff-mode
(add-hook 'diff-mode-hook (lambda ()
                            (setq-local whitespace-style
                                        '(face
                                          tabs
                                          tab-mark
                                          spaces
                                          space-mark
                                          trailing
                                          indentation::space
                                          indentation::tab
                                          newline
                                          newline-mark))
                            (whitespace-mode 1)))

;; Package: volatile-highlights
(use-package volatile-highlights
  :config
  (volatile-highlights-mode t))

;; Package: clean-aindent-mode
(use-package clean-aindent-mode
  :hook (prog-mode . clean-aindent-mode))

;; PACKAGE: dtrt-indent
(use-package dtrt-indent
  :config
  (dtrt-indent-mode 1)
  (setq dtrt-indent-verbosity 0))

;; PACKAGE: ws-butler
(use-package ws-butler
  :hook ((prog-mode . ws-butler-mode)
         (text-mode . ws-butler-mode)
         (fundamental-mode . ws-butler-mode)))

;; Package: undo-tree
(use-package undo-tree
  :config
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo-tree-history")))
  (global-undo-tree-mode))

;; Package: yasnippet
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (setq yas-verbosity 1
        yas-wrap-around-region t)
  (add-hook 'term-mode-hook (lambda() (setq yas-dont-activate t))))

;; PACKAGE: smartparens
(use-package smartparens
  :config
  (require 'smartparens-config)
  (setq sp-base-key-bindings 'paredit)
  (setq sp-autoskip-closing-pair 'always)
  (setq sp-hybrid-kill-entire-symbol nil)
  (global-set-key (kbd "M-<right>") 'sp-forward-slurp-sexp)
  (global-set-key (kbd "M-<left>") 'sp-forward-barf-sexp)
  (show-smartparens-global-mode 1)
  (smartparens-global-mode 1))

;; PACKAGE: comment-dwim-2
(use-package comment-dwim-2
  :bind ("M-;" . comment-dwim-2))

;; PACKAGE: iedit
(use-package iedit
  :config
  (defun iedit-dwim (arg)
    "Starts iedit but uses \\[narrow-to-defun] to limit its scope."
    (interactive "P")
    (if arg
        (iedit-mode)
      (save-excursion
        (save-restriction
          (widen)
          (if iedit-mode
              (iedit-done)
            (narrow-to-defun)
            (iedit-start (current-word) (point-min) (point-max)))))))
  :bind (("C-c ;" . iedit-mode)))

;; bunch of useful editing functions
(require 'editing-functions)
(global-set-key (kbd "C-x <RET>") 'prelude-smart-open-line)
(global-set-key (kbd "C-a") 'prelude-move-beginning-of-line)
(global-set-key (kbd "C-c i") 'indent-region-or-buffer)

;; multiple-cursors configuration
(use-package multiple-cursors
  :bind ("C-S-c C-S-c" . mc/edit-lines))

;; movelines function
(require 'move-lines)
(global-set-key (kbd "M-S-p") 'move-lines-up)
(global-set-key (kbd "M-S-n") 'move-lines-down)

;; Package expand-region
(use-package expand-region
  :bind ("M-\\" . er/expand-region))

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unnecessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; enable line numbers in programming modes (replaces linum-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; kill the currently active buffer
(defun kill-default-buffer ()
  "Kill the currently active buffer -- set to C-x k so that users are not asked which buffer they want to kill."
  (interactive)
  (let (kill-buffer-query-functions) (kill-buffer)))

(global-set-key (kbd "C-x k") 'kill-default-buffer)

;; Package zygospore
(use-package zygospore
  :bind ("C-x 1" . zygospore-toggle-delete-other-windows))


(provide 'setup-editing)
