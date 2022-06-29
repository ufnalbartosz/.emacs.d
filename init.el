;M-x `describe-key`: and type the key combination then Emacs will then show the command that key press is bound to.
;M-x `describe-bindings`: to see a list of ALL keybindings that's active for your current buffer

(defalias 'yes-or-no-p 'y-or-n-p)
(setq warning-minimum-level :emergency)

(require 'cask "~/.cask/cask.el")
(cask--initialize)

(require 'pallet)
(pallet-mode t)

;; garbage collector
(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/functions")
(add-to-list 'load-path "~/.emacs.d/development")
(add-to-list 'load-path "~/.emacs.d/modes")

(require 'setup-helm)
(require 'setup-editing)
(require 'setup-faces-and-ui)
(require 'setup-files)

(windmove-default-keybindings)

;; ;; exec-path-from-shell package:
;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))

;; Org-mode configure
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

; C-c a t to enter the global todo list
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/school.org"
                             "~/org/home.org"))

;; Package: projejctile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'native)

(require 'magit)
(global-set-key (kbd "C-c g") 'magit-status)

;; LOAD DEVELOPMENT CONFIGURATIONS
(require 'python-config)

;; custom
(defun my-disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizaontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my-disable-scroll-bars)

(require 'ttcn3)

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm)
  )
