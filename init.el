;; M-x `describe-key`: and type the key combination then Emacs will then show the command that key press is bound to.
;; M-x `describe-bindings`: to see a list of ALL keybindings that's active for your current buffer

;; Emacs 30+ required
(when (< emacs-major-version 30)
  (error "This config requires Emacs 30 or newer"))

(defalias 'yes-or-no-p 'y-or-n-p)
(setq warning-minimum-level :emergency)

;; --- Package management (replaces Cask/Pallet) ---
(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

;; --- GC & startup ---
(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

;; --- Load paths ---
(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/functions")
(add-to-list 'load-path "~/.emacs.d/development")
(add-to-list 'load-path "~/.emacs.d/modes")

;; --- Custom subsystem configs ---
(require 'setup-completion)
(require 'setup-editing)
(require 'setup-faces-and-ui)
(require 'setup-files)

(windmove-default-keybindings)

;; --- In-buffer completion: Corfu + Cape ---
(use-package corfu
  :init
  (global-corfu-mode)
  :config
  (setq corfu-auto t
        corfu-auto-delay 0.2
        corfu-auto-prefix 2
        corfu-cycle t
        corfu-preselect 'prompt))

(use-package cape
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file))

;; --- Project management (built-in project.el, C-x p prefix) ---
;; No extra package needed — project.el is built-in to Emacs 30.
;; C-x p f  — find file in project
;; C-x p p  — switch project
;; C-x p b  — switch buffer in project

;; --- Org-mode ---
(use-package org
  :ensure nil
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda))
  :config
  (setq org-log-done t)
  (setq org-agenda-files (list "~/org/work.org"
                               "~/org/school.org"
                               "~/org/home.org")))

;; --- Magit ---
(use-package magit
  :bind ("C-c g" . magit-status))

;; --- Python ---
(require 'python-config)

;; --- Scroll bars ---
(defun my-disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizaontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my-disable-scroll-bars)

;; --- TTCN-3 ---
(require 'ttcn3)

;; --- Misc ---
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))
