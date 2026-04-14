## My dotfiles

### Requirements

#### iTerm2

https://iterm2.com/

iTerm2 is a replacement for Terminal and the successor to iTerm. It works on Macs with macOS 12.4 or newer. iTerm2 brings the terminal into the modern age with features you never knew you always wanted.

#### tmux

https://github.com/tmux/tmux/wiki

tmux is a terminal multiplexer.

[Download](https://iterm2.com/downloads/stable/latest)

```
brew install tmux
```

#### Noto Mono for Powerline

https://github.com/powerline/fonts/tree/master/NotoMono

Noto is a collection of high-quality fonts with multiple weights and widths in sans, serif, mono, and other styles. The Noto fonts are perfect for harmonious, aesthetic, and typographically correct global communication, in more than 1,000 languages and over 150 writing systems.

"Noto" means "I write, I mark, I note" in Latin. The name is also short for "no tofu", as the project aims to eliminate 'tofu': blank rectangles shown when no font is available for your text.

[Download](https://github.com/powerline/fonts/blob/master/NotoMono/Noto%20Mono%20for%20Powerline.ttf)

#### Hammerspoon

https://www.hammerspoon.org/

Hammerspoon is a tool for powerful automation of macOS. At its core, Hammerspoon is just a bridge between the operating system and a Lua scripting engine. I use it to automatically go back the my default keyboard layout after some typing inactivity or when focusing on selected Apps.

After installing, simply open the Hammerspoon app and set the preferences to Launch at login.

```
brew install hammerspoon --cask
```

### Setup

#### iTerm

To enable the desired `tmux` keybindings:

- Settings > Profile > Default > Keys > Left option key as Esc+, Right option key as Normal.

To display the Powerline chars, install _Noto Mono for Powerline_ and select it in:

- Settings > Profile > Default > Text > Font.

#### Symlinks

```
ln -s ~/dotfiles/hammerspoon ~/.hammerspoon
```

#### tmux

There is no need to install [TPM](https://github.com/tmux-plugins/tpm) and the `tmux` manually because my `.tmux.conf` includes [Automatic TPM installation](https://github.com/tmux-plugins/tpm/blob/master/docs/automatic_tpm_installation.md).
