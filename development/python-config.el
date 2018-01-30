;; PYTHON CUSTOM CONFIG:
;; elpy setup
(elpy-enable)

;; disable ac
(defadvice auto-complete-mode (around disable-auto-complete-for-python)
    (unless (eq major-mode 'python-mode) ad-do-it))

(ad-activate 'auto-complete-mode)

(add-hook 'elpy-mode-hook 'global-company-mode)

(setq elpy-rpc-backend "jedi")
(setq elpy-rpc-timeout nil)
(setq elpy-rpc-ignored-buffer-size 262144)

;; F5 compile tests elpy
(global-set-key (kbd "<f5>") 'elpy-test)


(add-hook 'elpy-mode-hook (company-quickhelp-mode 1))

;; make window appear on the left side
(require 'popwin)
(popwin-mode 1)
(push '(direx:direx-mode :position left :width 35 :dedicated t)
      popwin:special-display-config)

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; pyvnenv-workon setup, add export $WORKON_HOME=/path/to/env/dir to .profile or .bash_profile or .bashrc file
(setenv "WORKON_HOME" (shell-command-to-string "$SHELL --login -c 'echo -n $WORKON_HOME'"))
;; setup default virtualenv at emacs startup to tensorflow2.7

;; displays parameters scattered on multiple lines
;; (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;; (semantic-mode 1)
;; (require 'stickyfunc-enhance)

;; change default keybinding for go-back-from-definition
(defun setup-keys-elpy:pop-tag-mark ()
  (global-set-key (kbd "M-,") 'pop-tag-mark)
  (global-unset-key (kbd "M-*"))
  )
(add-hook 'python-mode-hook 'setup-keys-elpy:pop-tag-mark)

;; highlights parentheses according to their depth
(require 'rainbow-delimiters)
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)


(provide 'python-config)
