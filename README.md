# New computer setup

All automated steps are in `prepare.sh`:

1. Install [**brew**](https://brew.sh/)
1. Install **CLI utilities**

    ```
    brew install \
    git \
    node \
    yarn \
    the_silver_searcher \
    tmux \
    python@2 \
    thefuck
    ```

1. Install **neovim**

    ```
    pip2 install neovim
    pip3 install neovim
    brew install neovim
    sudo gem install neovim
    gem environment
    yarn global add neovim
    ```

1. Install Apps

    ```
    brew cask install \
    iterm2 \
    firefox \
    firefox-nightly \
    firefox-developer-edition \
    slack

1. Create iTerm2 profiles

    Send text at start:

    ```
    tmux attach -t main || tmux new -s main
    ```

1. Create `/git` folder

    ```
    sudo mkdir /git
    chown jordinebot:staff /git
    ```
