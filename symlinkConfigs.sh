SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

# i3blocks config
ln -s $SCRIPT_DIR/etc/i3blocks.conf /etc/i3blocks.conf

# bash configs
ln -s $SCRIPT_DIR/home/.bash_aliases ~/.bash_aliases
ln -s $SCRIPT_DIR/home/.bashrc ~/.bashrc
ln -s $SCRIPT_DIR/home/.profile ~/.profile

# vim configs
ln -s $SCRIPT_DIR/home/.vimrc ~/.vimrc

# alacritty configs
ln -s $SCRIPT_DIR/home/.config/alacritty ~/.config/alacritty

# doom configs
ln -s $SCRIPT_DIR/home/.config/doom ~/.config/doom

# i3 configs
ln -s $SCRIPT_DIR/home/.config/i3 ~/.config/i3

# i3 block impls
ln -s $SCRIPT_DIR/i3blocks/mediaplayer /usr/share/i3blocks/mediaplayer
ln -s $SCRIPT_DIR/i3blocks/calendar /usr/share/i3blocks/calendar
ln -s $SCRIPT_DIR/i3blocks/bluetooth /usr/share/i3blocks/bluetooth
