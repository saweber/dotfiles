# dotfiles

Personal setup for MacOS and Linux Development Environments

## How to Run

- Run ./boostrap.sh
- Use brew CLI to install any packages or casks that fail
- Manual steps listed below

## MacOS

### Install from Mac App Store

- Bitwarden
- Dark Reader
- Overcast
- Vimari
- ZSA Keymapp

### Manual Steps

- go pseudo-monorepos - `go work init`
- neovim
  - `pip3 install pynvim`
  - `npx npm i -g neovim`
- fisher
  - fisher install evanlucas/fish-kubectl-completions
  - fisher install lgathy/google-cloud-sdk-fish-completion
- fish
  - `sudo vim /etc/shells`
  - add fish
  - `chsh -s $(which fish)`
- better touch tool import settings

### Maybe not needed anymore?

- tmux italics
  - `/usr/bin/tic -x -o $HOME/.local/share/terminfo tmux-256color.src`
  - edit pairs value in `tmux-256color.src` to `pairs#32767` on macOS
  - `/opt/homebrew/Cellar/ncurses/6.4/bin/infocmp -x tmux-256color > ~/tmux-256color.src`
- k9s - dump skin.yml in config directory from `k9s info`

### Opinionated MacOS Personal Preferences (that are not scripted)

- System Preferences
  - Keyboard
    - Modifier Keys -> Set Caps Lock to Escape
    - Check `Use F1, F2, etc. keys as Function Keys`
    - Shortcuts - go through and disable unused shortcuts - reduce conflicts with IntelliJ and VS Code
  - Mouse
    - Uncheck Scroll direction: Natural
  - Spotlight
    - Keyboard Shortcuts -> Uncheck Show Spotlight Search ⌘Space
    - Use Alfred instead
- Desktop
  - Put Screenshots folder in dock

## Fedora

- enable coprs
- install dnf packages
- run manual and go installs if arm64, otherwise strip down brewfile

## Credits

- <https://sal.dev/macos/macos-screenshotting-tips-and-tricks/>
- <https://macos-defaults.com/>
- <https://gist.github.com/jamesmacfie/2061023e5365e8b6bfbbc20792ac90f8>
- <https://gist.github.com/subfuzion/db7f57fff2fb6998a16c>
- <https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/>
- <https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be>
- <https://apas.gr/2018/11/dark-mode-macos-safari-iterm-vim/>
