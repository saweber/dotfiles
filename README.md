# dotfiles

Personal setup for MacOS and Linux Development Environments

## How to Run

- Run ./boostrap.sh
- Use brew CLI to install any packages or casks that fail
- Manual steps listed below

## MacOS

### Manual Steps

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
- k9s - dump skin.yml in config directory from `k9s info`
- Ice
- iStat Menus

### Opinionated MacOS Personal Preferences (that are not scripted)

- System Preferences
  - Keyboard
    - Modifier Keys -> Set Caps Lock to Escape
    - Shortcuts - go through and disable unused shortcuts - reduce conflicts with IntelliJ and VS Code
  - Spotlight
    - Keyboard Shortcuts -> Uncheck Show Spotlight Search ⌘Space
    - Use Alfred instead
  - Desktop and Dock
    - Windows -> Tiled Windows have margins -> Off

## Fedora

- enable coprs
- install dnf packages

## Credits

- <https://sal.dev/macos/macos-screenshotting-tips-and-tricks/>
- <https://macos-defaults.com/>
- <https://gist.github.com/jamesmacfie/2061023e5365e8b6bfbbc20792ac90f8>
- <https://gist.github.com/subfuzion/db7f57fff2fb6998a16c>
- <https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/>
- <https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be>
- <https://apas.gr/2018/11/dark-mode-macos-safari-iterm-vim/>
