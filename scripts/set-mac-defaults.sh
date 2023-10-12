#!/bin/sh
echo "Setting macOS defaults..."
echo

# Close any open System Preferences panes, to prevent them from overriding
# settings we're about to change
osascript -e 'tell application "System Preferences" to quit'

# Always open everything in Finder's list view
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder
chflags nohidden ~/Library

# Set highlight color to pink
defaults write NSGlobalDomain AppleHighlightColor -string "1.000000 0.749020 0.823529"

# Set dark mode
defaults write NSGlobalDomain AppleInterfaceStyle Dark

# Set sidebar icon size to medium
defaults write com.apple.dock tilesize -int 64

# Autohide dock
defaults write com.apple.dock autohide -bool true

# Delete all apps from dock, so we can add our own
defaults write com.apple.dock persistent-apps -array

# Save screenshots to a Screenshots folder
mkdir -p ${HOME}/Documents/Screenshots
defaults write com.apple.screencapture location -string "${HOME}/Documents/Screenshots"

# Don't display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Minimize windows into their application's icon
defaults write com.apple.dock minimize-to-application -bool true

# Disable smart quotes and smart dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Finished setting macOS defaults."
echo
