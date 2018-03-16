;M-x `describe-key`: and type the key combination then Emacs will then show the command that key press is bound to.
;M-x `describe-bindings`: to see a list of ALL keybindings that's active for your current buffer

(defalias 'yes-or-no-p 'y-or-n-p)
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
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
(require 'ttcn3)
