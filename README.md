# :desktop_computer: Scripts to quickly setup a new system

## :gear: Install 
1. run `./quickAptGet.sh` 
1. run `./symlinkConfigs.sh`

---

## :framed_picture: Screenshots
### neofetch
![neofetch](https://github.com/EvanKirsch/dotfiles/blob/master/screenshots/neofetch.jpg)

### Bashrc Highlights
```bash
# fortune piped into cowsay for a cool, smart cow
fortune | cowsay
```

```bash
# PS1 with xterm-256 colors
'\[\033[38;5;244m\][\T]\[\033[32;32m\]$(__git_ps1 " (%s)") ${debian_chroot:+($debian_chroot)}\[\033[38;5;69m\]\u\[\033[00m\]@\[\033[38;5;204m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[38;5;46m\]\$\[\033[00m\] '
```

![bashrc](https://github.com/EvanKirsch/dotfiles/blob/master/screenshots/bash_profile.jpg)

### dmenu fork
Installed Patches ([EvanKirsch/demenu](https://github.com/EvanKirsch/dmenu))
- center
- boarder
- alpha

![demenu](https://github.com/EvanKirsch/dotfiles/blob/master/screenshots/dmenu.jpg)
