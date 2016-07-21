;M-x `describe-key`: and type the key combination then Emacs will then show the command that key press is bound to.
;M-x `describe-bindings`: to see a list of ALL keybindings that's active for your current buffer

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/functions")

(require 'setup-helm)
(require 'setup-editing)
(require 'setup-faces-and-ui)
(require 'setup-files)

(windmove-default-keybindings)

;; Package: projejctile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'native)

;; Org-mode configure
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

; C-c a t to enter the global todo list
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/school.org"
                             "~/org/home.org"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; --- NEW PYTHON CONFIG --- ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; elpy (jedi-config:setup-keys seems not work with elpy-enable)
(elpy-enable)
(setq elpy-rpc-backend "jedi")

;(require 'jedi)
(defun jedi-config:setup-keys ()
  (local-set-key (kbd "M-.") 'jedi:goto-definition)
  (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)
  (local-set-key (kbd "M-?") 'jedi:show-doc)
  (local-set-key (kbd "M-/") 'jedi:get-in-function-call))

;(add-hook 'python-mode-hook 'jedi-config:setup-keys)
