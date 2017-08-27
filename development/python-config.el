;; PYTHON CUSTOM CONFIG:
;; elpy setup
(elpy-enable)
(setq elpy-rpc-backend "jedi")

;; jedi-direx (code browser)
(eval-after-load "python"
  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
(add-hook 'jedi-mode-hook 'jedi-direx:setup)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; pyvnenv-workon setup, add export $WORKON_HOME=/path/to/env/dir to .profile or .bash_profile or .bashrc file
(setenv "WORKON_HOME" (shell-command-to-string "$SHELL --login -c 'echo -n $WORKON_HOME'"))
;; setup default virtualenv at emacs startup to tensorflow2.7
(let ((virtualenv-workon-starts-python nil))
  (pyvenv-activate (concat (getenv "WORKON_HOME") "/tensorflow2.7")))

;; displays parameters scattered on multiple lines
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(semantic-mode 1)
(require 'stickyfunc-enhance)

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
