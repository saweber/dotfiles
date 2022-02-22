# dotfiles

## MacOS

- Run ./boostrap.sh

### Prerequisites

- Install XCode

### iterm2 theme switcher

- cp -r ./iterm2-scripts/theme/ ~/Library/Application Support/iTerm2/Scripts/AutoLaunch/

### Manual Imports

- BetterTouchTool - `Default.bttpreset`
- Iterm2 - `iterm2_profile.json`

### Recommended MacOS Settings changes

- `defaults write com.apple.dock no-bouncing -bool TRUE`
  - turns off dock bouncing
- Dock
  - Check `Automatically hide and show the Dock`
  - Uncheck `Show recent applications in Dock`
- Mission Control
  - Uncheck Auto rearrange spaces
- Spotlight
  - Keyboard Shortcuts -> Uncheck Show Spotlight Search ⌘Space
  - Use Alfred instead
- Accessibility -> Display -> Reduce Motion
  - faster transitions between spaces

## WSL2 Ubuntu

- Run ./boostrap.sh

## Issues

- Brewfile may fail to install some packages, a manual re-run with `brew install` or `brew reinstall` should fix it.

