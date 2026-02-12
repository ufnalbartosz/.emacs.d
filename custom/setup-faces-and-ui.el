(provide 'setup-faces-and-ui)

;; turn off UI chrome to save screen estate
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; the blinking cursor is nothing but an annoyance
(blink-cursor-mode -1)

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(defun my-disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizaontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my-disable-scroll-bars)

(size-indication-mode t)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " - " (:eval (if (buffer-file-name)
                                                    (abbreviate-file-name (buffer-file-name))
                                                  "%b"))))

;; --- Theme ---
(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

;; --- which-key (built-in Emacs 30) ---
(use-package which-key
  :ensure nil
  :init
  (which-key-mode)
  :config
  (setq which-key-idle-delay 0.5))

;; Cursor position information — display the column number
(column-number-mode 1)

;; completely turn off alarms
(setq ring-bell-function 'ignore)

;; rebind <home> and <end> keys for macOS
(global-set-key (kbd "<home>") 'prelude-move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)

;; change command to meta(alt) on macOS
(setq mac-command-modifier 'meta)

;; SHELL MODE UI — output and prompt read-only
(setq comint-prompt-read-only t)
(defun my-comint-preoutput-turn-buffer-read-only (text)
  (propertize text 'read-only t))
(add-hook 'comint-preoutput-filter-functions 'my-comint-preoutput-turn-buffer-read-only)
