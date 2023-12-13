echo "Beginning zsh bootstrap..."
# Make sure prezto is installed and up to date
if [[ -d "${ZDOTDIR:-$HOME}/.zprezto" ]]
then
    echo "Prezto already installed. skipping..."
else
    echo "Installing Prezto..."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    echo "Done. Linking dotfiles..."
fi

# Link all our dotfiles
ln -s "${HOME}/dotfiles/.bash_aliases" "${HOME}/.zaliases"
ln -s "${HOME}/dotfiles/.zshrc" "${HOME}/.zshrc"
ln -s "${HOME}/dotfiles/.gitconfig" "${HOME}/.gitconfig"
ln -s "${HOME}/dotfiles/.psqlrc" "${HOME}/.psqlrc"
ln -s "${HOME}/dotfiles/.tmux/.tmux.conf" "${HOME}/.tmux.conf"

echo "zsh bootstrap complete."
