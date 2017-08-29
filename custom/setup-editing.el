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
;; GROUP: Editing -> Volatile Highlights
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; Package: clean-aindent-mode
;; GROUP: Editing -> Indent -> Clean Aindent
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; PACKAGE: dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode 1)
(setq dtrt-indent-verbosity 0)

;; PACKAGE: ws-butler
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)
(add-hook 'text-mode 'ws-butler-mode)
(add-hook 'fundamental-mode 'ws-butler-mode)

;; Package: undo-tree
;; GROUP: Editing -> Undo -> Undo Tree
(require 'undo-tree)
(global-undo-tree-mode)

;; Package: yasnippet
;; GROUP: Editing -> Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; PACKAGE: smartparens
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)

;; TODO: bindings doesnt work since elpy override them after it's init in
;; python mode, those starts at the program init, maybe initialiation in
;; python-mode would fix this
(global-set-key (kbd "M-<right>") 'sp-forward-slurp-sexp)
(global-set-key (kbd "M-<left>") 'sp-forward-barf-sexp)

(show-smartparens-global-mode 1)
(smartparens-global-mode 1)

;; PACKAGE: comment-dwim-2
(global-set-key (kbd "M-;") 'comment-dwim-2)

;; Jump to end of snippet definition
;(define-key yas-keymap (kbd "<return>") 'yas/exit-all-snippets)  ;; no idea what it does

;; Inter-field navigation
(defun yas/goto-end-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas--snippets-at-point)))
         (position (yas--field-end (yas--snippet-active-field snippet))))
    (if (= (point) position)
        (move-end-of-line 1)
      (goto-char position))))

(defun yas/goto-start-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas--snippets-at-point)))
         (position (yas--field-start (yas--snippet-active-field snippet))))
    (if (= (point) position)
        (move-beginning-of-line 1)
      (goto-char position))))

;(define-key yas-keymap (kbd "C-e") 'yas/goto-end-of-active-field)
;(define-key yas-keymap (kbd "C-a") 'yas/goto-start-of-active-field)
;; (define-key yas-minor-mode-map [(tab)] nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)
;; (define-key yas-minor-mode-map (kbd "C-<tab>") 'yas-expand)
;; No dropdowns please, yas
(setq yas-prompt-functions '(yas/ido-prompt yas/completing-prompt))

;; No need to be so verbose
(setq yas-verbosity 1)

;; Wrap around region
(setq yas-wrap-around-region t)

(add-hook 'term-mode-hook (lambda() (setq yas-dont-activate t)))

;; PACKAGE: anzu
;; GROUP: Editing -> Matching -> Isearch -> Anzu
(require 'anzu)
(global-anzu-mode)
(global-set-key (kbd "C-c r") 'anzu-query-replace)
(global-set-key (kbd "C-c C-r") 'anzu-query-replace-regexp)

;; PACKAGE: iedit

;; iedit narrow to funcion
(require 'iedit)

(defun iedit-dwim (arg)
  "Starts iedit but uses \\[narrow-to-defun] to limit its scope."
  (interactive "P")
  (if arg
      (iedit-mode)
    (save-excursion
      (save-restriction
        (widen)
        ;; this function determines the scope of `iedit-start'.
        (if iedit-mode
            (iedit-done)
          ;; `current-word' can of course be replaced by other
          ;; functions.
          (narrow-to-defun)
          (iedit-start (current-word) (point-min) (point-max)))))))

(global-set-key (kbd "C-;") 'iedit-dwim) ; narrow to function
(global-set-key (kbd "C-c ;") 'iedit-mode) ; global

;(setq iedit-toggle-key-default nil) ;; what is it for?

;; bunch of useful editing functions
(require 'editing-functions) ; ("~/.emacs/functions")
(global-set-key (kbd "C-x <RET>") 'prelude-smart-open-line)
(global-set-key (kbd "C-a") 'prelude-move-beginning-of-line)
(global-set-key (kbd "C-c i") 'indent-region-or-buffer)

;; multiple-cursors configuration
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; movelines function ("~/.emacs.d/functions")
(require 'move-lines)
(global-set-key (kbd "M-S-p") 'move-lines-up)
(global-set-key (kbd "M-S-n") 'move-lines-down)

;; Package expand-region
(require 'expand-region)
(global-set-key (kbd "M-\\") 'er/expand-region)

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; enable linum only in programming modes (line number on the left margin)
(add-hook 'prog-mode-hook 'linum-mode)

;; kill the currently active buffer so that users are not asked which buffer they want to kill.
(defun kill-default-buffer ()
  "Kill the currently active buffer -- set to C-x k so that users are not asked which buffer they want to kill."
  (interactive)
  (let (kill-buffer-query-functions) (kill-buffer)))

(global-set-key (kbd "C-x k") 'kill-default-buffer)

;; Package zygospore
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)


(provide 'setup-editing)
