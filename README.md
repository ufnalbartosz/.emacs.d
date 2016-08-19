Install cask (works for Linux)

curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python

export PATH='$HOME/.cask/bin:$PATH' variable (or edit .bashrc or .profile)

Install pallet via emacs package manager
`M-x package-list-packages RET pallet`

Install packages via pallet
`M-x pallet-install`

install Inconsolata font on your OS

sudo apt-get install fonts-inconsolata

install elpy dependencies

pip install jedi rope importmagic autopep8 yapf

TODOs: (future hacks in elisp)

- after choosing project with helm-projectile (C-c p p) bind pyvenv-workon to project (if elpy-env nil)
- elpy should reindent correctly indented Python code (https://github.com/jorgenschaefer/elpy/issues/565)