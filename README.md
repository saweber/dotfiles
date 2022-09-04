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
- Karabiner-Elements - Replace contents in `~/.config/karabiner` with contents of ./karabiner folder
- Rectangle - import `RectangleConfig.json`

### Opinonated MacOS Personal Preferences (that are not scripted)

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
- Firefox
  - Set fixed-width font to 'JetBrains Mono'
  - [Arial font kerning fix](https://bugzilla.mozilla.org/show_bug.cgi?id=1366880)

## Known Limitations

- WSL2 - Brewfile may fail to install some packages, a manual re-run with `brew install` or `brew reinstall` should fix it.
- MacOS - Some brew casks do not contain a sha256, so those applications will have to be installed outside of `brew bundle`.

## Credits

- <https://sal.dev/macos/macos-screenshotting-tips-and-tricks/>
- <https://macos-defaults.com/>
