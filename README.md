

    git clone git@github.com:jeanlucc/dotfiles.git ~/.dotfiles #Clone the project
    mkdir -p ~/.emacs.d #Ensure .emacs.d exists
    ln -s ~/.dotfiles/.emacs ~/.emacs
    ln -s ~/.dotfiles/lisp  ~/.emacs.d/lisp #Create symlinks
    ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global
