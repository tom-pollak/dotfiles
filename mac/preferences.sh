# Hide Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 1000
defaults write com.apple.dock pinning -string start
defaults write com.apple.dock no-bouncing -bool true

# No drag between spaces
defaults write com.apple.dock workspaces-edge-delay -float 15

# Reduce animation between swiching spaces
defaults write com.apple.dock workspaces-swoosh-animation-off -bool true

# Speed up mission control animation
defaults write com.apple.dock expose-animation-duration -float 0.1

# No genie effect from dock
defaults write com.apple.dock mineffect -string scale

killall Dock
