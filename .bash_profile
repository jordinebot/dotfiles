PROJECT_DIR=/git

for DOTFILE in `find ~/.dotfiles`
do
  [ -f “$DOTFILE” && "$DOTFILE" == ^. ] && source “$DOTFILE”
done
