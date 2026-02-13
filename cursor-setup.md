# Cursor/VS Code Setup

Configure Cursor to match this Emacs config as closely as possible.

## Extensions

```bash
cursor --install-extension igolskyi.vscode-zenburn-plus-theme
cursor --install-extension lfs.vscode-emacs-friendly
cursor --install-extension ms-python.python
cursor --install-extension ms-python.vscode-pylance
cursor --install-extension charliermarsh.ruff
cursor --install-extension leighmcculloch.vscode-emacs-expanded-region
```

## Settings

`Cmd+Shift+P` → "Open User Settings JSON":

```json
{
  // Theme (Zenburn)
  "workbench.colorTheme": "Zenburn+",

  // Font — match Emacs default on macOS
  "editor.fontFamily": "Menlo, monospace",
  "editor.fontSize": 13,

  // Minimal UI (like scroll-bar-mode -1, tool-bar-mode -1, menu-bar-mode -1)
  "editor.minimap.enabled": false,
  "editor.scrollbar.vertical": "hidden",
  "workbench.activityBar.location": "hidden",
  "workbench.statusBar.visible": true,
  "window.menuBarVisibility": "toggle",

  // Editing (matches setup-editing.el)
  "editor.tabSize": 4,
  "editor.insertSpaces": true,
  "editor.renderWhitespace": "trailing",
  "files.trimTrailingWhitespace": true,
  "files.insertFinalNewline": true,

  // Cursor — no blinking (blink-cursor-mode -1)
  "editor.cursorBlinking": "solid",

  // Bracket matching (smartparens)
  "editor.bracketPairColorization.enabled": true,
  "editor.autoClosingBrackets": "always",

  // Python (matches eglot+pyright+ruff)
  "python.languageServer": "Pylance",
  "[python]": {
    "editor.defaultFormatter": "charliermarsh.ruff",
    "editor.formatOnSave": true
  },

  // Terminal
  "terminal.integrated.defaultProfile.osx": "zsh",

  // Emacs keybindings
  "emacs-friendly.killRingMax": 5000,

  // No alarm bell (ring-bell-function 'ignore)
  "workbench.enableExperiments": false,

  // Exclude noise from search and file finder (like .gitignore for Cursor)
  "search.exclude": {
    "**/node_modules": true,
    "**/.git": true,
    "**/dist": true,
    "**/build": true,
    "**/__pycache__": true,
    "**/.venv": true,
    "**/venv": true,
    "**/*.egg-info": true,
    "**/htmlcov": true,
    "**/.mypy_cache": true,
    "**/.ruff_cache": true,
    "**/.pytest_cache": true
  },
  "files.exclude": {
    "**/__pycache__": true,
    "**/.DS_Store": true
  }
}
```

## Key Mapping Equivalents

| Emacs | Cursor |
|-------|--------|
| `C-x C-f` | `Cmd+P` (file finder) |
| `C-x b` | `Cmd+P` then type buffer name |
| `M-x` | `Cmd+Shift+P` (command palette) |
| `C-c g` (magit) | `Cmd+Shift+G` (source control) |
| `C-x p f` | `Cmd+P` (already project-scoped) |
| `C-c s` (ripgrep) | `Cmd+Shift+F` (search in files) |
| `C-c t` (vterm) | `` Ctrl+` `` (integrated terminal) |

The Emacs keymap extension gives you `C-a`, `C-e`, `C-k`, `C-y`, `C-w`, `M-w`, `C-/` etc. out of the box.
