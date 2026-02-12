# Emacs Config

Personal Emacs configuration targeting **Emacs 30+** on macOS. Uses built-in `use-package` for package management — no Cask or external bootstrap needed.

## Prerequisites

- macOS
- [Homebrew](https://brew.sh)

## Installation

### 1. Install Emacs 30

```bash
brew install --cask emacs
```

### 2. Clone this repo

```bash
git clone https://github.com/<your-user>/.emacs.d.git ~/.emacs.d
```

### 3. Install system dependencies (for Python development)

```bash
brew install pyright
uv tool install ruff
```

### 4. Launch Emacs

All packages auto-install on first launch via `use-package` with `use-package-always-ensure t`.

## Python Setup

The Python IDE is built on:

- **Eglot** (built-in) — LSP client connected to Pyright
- **Pyright** — type checker / language server
- **Ruff** — linter + formatter (via Apheleia for format-on-save)
- **Flymake** (built-in) — diagnostics display from Pyright/Ruff
- **Tree-sitter** — syntax highlighting (auto-enabled when grammar is available)

To install the Python tree-sitter grammar from within Emacs:

```
M-x treesit-install-language-grammar RET python RET
```

## Key Packages

| Package | Purpose |
|---------|---------|
| Vertico + Orderless | Minibuffer completion with flexible matching |
| Marginalia | Rich annotations in minibuffer |
| Consult | Search, navigation, buffer switching |
| Embark | Contextual actions on candidates |
| Corfu + Cape | In-buffer completion popup |
| Eglot | LSP client (built-in) |
| Magit | Git interface (`C-c g`) |
| Smartparens | Structured editing of paired delimiters |
| Yasnippet | Snippet expansion |
| Undo-tree | Visual undo history |
| Multiple-cursors | Multi-cursor editing |
| Expand-region | Incremental selection (`M-\`) |
| which-key | Key binding discovery (built-in Emacs 30) |
| project.el | Project management (built-in, `C-x p` prefix) |
| Zenburn | Color theme |

## Key Bindings

| Binding | Command |
|---------|---------|
| `M-x` | Execute command (Vertico-enhanced) |
| `C-x b` | Switch buffer (Consult) |
| `C-x C-f` | Find file (Vertico-enhanced) |
| `C-x p f` | Find file in project |
| `C-x p p` | Switch project |
| `C-c g` | Magit status |
| `C-c h o` | Search lines in buffer (Consult) |
| `C-c s` | Ripgrep search (Consult) |
| `C-.` | Embark act |
| `C-c a` | Org agenda |
| `C-c l` | Org store link |

## Shell Wrappers

Two shell scripts are included for launching from the terminal:

- `emacs.sh` — launch Emacs GUI
- `emacsclient.sh` — connect to a running Emacs daemon

Add to your shell config:

```bash
alias emacs="~/.emacs.d/emacs.sh"
alias ec="~/.emacs.d/emacsclient.sh"
```

## TTCN-3

Includes a bundled `ttcn3.el` mode for TTCN-3 core language files (in `modes/`).

## Theme

[Zenburn](https://github.com/bbatsov/zenburn-emacs) — a low-contrast color theme.
