TODOs:

* after choosing project with helm-projectile (C-c p p) bind pyvenv-workon to project (if elpy-env nil)

* elpy-pop-marker, bo "M-." (go-to-definition) works
  - pop-tag-mark "M-*",
  - bind to "M-," (but with elisp function, which make hook only to elpy-mode)

* Elpy 'No definition found'
  - `pip install rope-py3k`
  - (setq elpy-rcp-backend "rope")
  - https://github.com/jorgenschaefer/elpy/issues/74 (issue tips)

* install 'ropemacs which depends on 'rope & 'pymacs (README's links)
  - https://github.com/python-rope/ropemacs
  - https://github.com/python-rope/rope/
  - https://github.com/pinard/Pymacs

* enable autocomplete in emacs python interpreter


Installation guide:
1. Install Emacs:
 - `brew cask install emacs`

2. Install Cask:
 - `brew install cask`

3. Install pallet:
  - `M-x package-list-packages RET pallet`

4. Install packages via pallet
  - `M-x pallet-mode`
  - `M-x pallet-install`

5. Install Inconsolata font
  - `brew tap homebrew/cask-fonts`
  - `brew cask install font-inconsolata`

6. Install elpy dependencies:
  - `pip install jedi importmagic autopep8 yapf flake8 epc virtualenvwrapper`
  - `M-x jedi:install-server`

Usefull links:
  - https://ebzzry.github.io/emacs-pairs.html#configuration (smartparens)
  - https://realpython.com/blog/python/emacs-the-best-python-editor/ (guide)
  - https://www.emacswiki.org/emacs/PythonProgrammingInEmacs#toc1 (wiki)
  - https://github.com/jorgenschaefer/elpy (elpy)
  - https://elpy.readthedocs.io/en/latest/index.html (elpy)
  - http://docs.pytest.org/en/latest/ (pytest)
  - http://tuhdo.github.io/helm-intro.html (helm)
  - http://tuhdo.github.io/helm-projectile.html (helm-projectile)
  - https://github.com/proofit404/anaconda-mode (anaconda-mode)

