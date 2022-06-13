# dotfiles

Personal setup for MacOS and WSL2 Ubuntu Dev Environments

## How to Run

- Run ./boostrap.sh
- Use brew CLI to install any packages or casks that fail
- Manual steps listed below

## MacOS

### Manual Imports

- BetterTouchTool - `Default.bttpreset`
- Iterm2
  - Import `iterm2/iterm2_profile.json`
  - Import `iterm2/monokai-pro-spectrum.itermcolors`
  - Import `iterm2/night-owl-light.itermcolors`
  - Follow steps here for light/dark theme switching: `https://gist.github.com/jamesmacfie/2061023e5365e8b6bfbbc20792ac90f8`
  - Theme : minimal
- Karabiner-Elements - Replace contents in `~/.config/karabiner` with contents of karabiner folder
- Rectangle - `RectangleConfig.json`

### Opinonated Personal Preferences

- Finder
  - Preferences -> General -> Uncheck Show On Deskop section
- System Preferences
  - Dock
    - Set Position on screen to left
    - Check `Automatically hide and show the Dock`
    - Uncheck `Show recent applications in Dock`
  - Keyboard
    - Modifier Keys -> Set Caps Lock to Escape
  - Mission Control
    - Uncheck Auto rearrange spaces
  - Mouse
    - Uncheck Scroll direction: Natural
  - Spotlight
    - Keyboard Shortcuts -> Uncheck Show Spotlight Search ⌘Space
    - Use Alfred instead
  - Accessibility -> Display -> Reduce Motion
    - faster transitions between spaces
- Terminal
  - `defaults write com.apple.dock no-bouncing -bool TRUE`
    - turns off dock bouncing

## Known Limitations

- WSL2 - Brewfile may fail to install some packages, a manual re-run with `brew install` or `brew reinstall` should fix it.
- MacOS - Some brew casks do not contain a sha256, so those applications will have to be installed outside of `brew bundle`.
