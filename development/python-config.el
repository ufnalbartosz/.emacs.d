;; PYTHON CONFIG: Eglot (built-in) + Pyright + Ruff
;;
;; System dependencies:
;;   brew install pyright
;;   pip install ruff

;; --- Eglot (built-in LSP client) ---
(use-package eglot
  :ensure nil
  :hook ((python-mode . eglot-ensure)
         (python-ts-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs
               '((python-mode python-ts-mode) . ("pyright-langserver" "--stdio"))))

;; --- Tree-sitter for Python ---
;; Remap python-mode to python-ts-mode when tree-sitter grammar is available
(when (treesit-language-available-p 'python)
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode)))

;; --- Apheleia (async formatting with ruff) ---
(use-package apheleia
  :hook ((python-mode . apheleia-mode)
         (python-ts-mode . apheleia-mode))
  :config
  (setf (alist-get 'ruff-format apheleia-formatters)
        '("ruff" "format" "--stdin-filename" filepath "-"))
  (setf (alist-get 'python-mode apheleia-mode-alist) 'ruff-format)
  (setf (alist-get 'python-ts-mode apheleia-mode-alist) 'ruff-format))

;; --- Rainbow delimiters ---
(use-package rainbow-delimiters
  :hook ((python-mode . rainbow-delimiters-mode)
         (python-ts-mode . rainbow-delimiters-mode)))

(provide 'python-config)
