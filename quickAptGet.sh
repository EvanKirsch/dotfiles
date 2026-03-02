apt update

# VCS
apt install -y git

# Utils
apt install -y dpkg \
    curl \
    ssh \
    software-properties-common \
    fortune \
    cowsay \
    neofetch \
    feh \
    make \
    autoconf \
    yad \
    build-essential

# Text Editor and Fonts
apt install -y vim \
    fonts-noto

# WM
apt install -y i3 \
    dmenu \
    i3blocks \
    playerctl


# Spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | apt-key add -
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
apt update
apt install -y spotify-client

# Add non free and conrtib repos
sed -r -i 's/^deb(.*)$/deb\1 contrib/g' /etc/apt/sources.list
apt-add-repository non-free
dpkg --add-architecture i386
apt update

# Steam
apt install -y steam

# Bluetooth
apt install -y blueman \
    libspa-0.2-bluetooth

# Nvidia Drivers
apt install -y nvidia-detect \
    nvidia-driver
