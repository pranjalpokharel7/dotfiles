#!/bin/bash
# Reapply GNOME keybindings for flameshot (Print/Shift+Print/Alt+Print).
# Disables GNOME's built-in screenshot shortcuts and binds them to flameshot instead.

set -e

# Disable GNOME's built-in screenshot keybindings
gsettings set org.gnome.shell.keybindings screenshot "[]"
gsettings set org.gnome.shell.keybindings screenshot-window "[]"
gsettings set org.gnome.shell.keybindings show-screenshot-ui "[]"

# Custom keybindings for flameshot
BASE=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
  "['$BASE/custom0/', '$BASE/custom1/', '$BASE/custom2/']"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$BASE/custom0/ name 'Flameshot GUI (region)'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$BASE/custom0/ command 'flameshot gui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$BASE/custom0/ binding 'Print'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$BASE/custom1/ name 'Flameshot Full Screen'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$BASE/custom1/ command 'flameshot gui -d 0'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$BASE/custom1/ binding '<Shift>Print'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$BASE/custom2/ name 'Flameshot Window'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$BASE/custom2/ command 'flameshot gui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$BASE/custom2/ binding '<Alt>Print'

echo "Flameshot keybindings applied."
