# dotfiles

Personal setup for MacOS and Linux Development Environments

## How to Run

- Run ./boostrap.sh
- Use brew CLI to install any packages or casks that fail
- Manual steps listed below

## MacOS

### Install from Mac App Store

- Overcast
- HotKey

### Manual Imports

- Iterm2
  - Import `iterm2/iterm2_profile.json`
  - Import `iterm2/monokai-pro-spectrum.itermcolors`
  - Import `iterm2/night-owl-light.itermcolors`
  - [light/dark theme switching](https://gist.github.com/jamesmacfie/2061023e5365e8b6bfbbc20792ac90f8)
  - Theme : minimal
  - Profiles -> Keys -> Left + Right Option -> Set to `Esc+`
- `kubectl krew completion zsh >> ~/.zsh/_krew`
- pprof - `go install github.com/google/pprof@latest`
- go pseudo-monorepos - `go work init`
- neovim
  - [packer.nvim](https://github.com/wbthomason/packer.nvim)
  - `pip3 install pynvim`
  - `npx npm i -g neovim`
- tmux italics
  - `/usr/bin/tic -x -o $HOME/.local/share/terminfo tmux-256color.src`
  - edit pairs value in `tmux-256color.src` to `pairs#32767` on macOS
  - `/opt/homebrew/Cellar/ncurses/6.4/bin/infocmp -x tmux-256color > ~/tmux-256color.src`
  - [skhd/yabai - fix slow response](https://github.com/koekeishiya/skhd/issues/150)

### Opinionated MacOS Personal Preferences (that are not scripted)

- System Preferences
  - Keyboard
    - Modifier Keys -> Set Caps Lock to Escape
    - Check `Use F1, F2, etc. keys as Function Keys`
    - Shortcuts - go through and disable unused shortcuts - reduce conflicts with IntelliJ and VS Code
    - Mission Control - Switch to Desktop {n} - Ctrl Alt Shift {n}
  - Mouse
    - Uncheck Scroll direction: Natural
  - Spotlight
    - Keyboard Shortcuts -> Uncheck Show Spotlight Search ⌘Space
    - Use Alfred instead
- Desktop
  - Put Screenshots folder in dock
- Firefox
  - Set fixed-width font to 'JetBrains Mono'
  - [Arial font kerning fix](https://bugzilla.mozilla.org/show_bug.cgi?id=1366880)
- Amethyst

## Known Limitations

- Linux - Brewfile may fail to install some packages, a manual re-run with `brew install` or `brew reinstall` should fix it.

## Credits

- <https://sal.dev/macos/macos-screenshotting-tips-and-tricks/>
- <https://macos-defaults.com/>
- <https://gist.github.com/jamesmacfie/2061023e5365e8b6bfbbc20792ac90f8>
- <https://gist.github.com/subfuzion/db7f57fff2fb6998a16c>
- <https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/>
- <https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be>
- <https://apas.gr/2018/11/dark-mode-macos-safari-iterm-vim/>
