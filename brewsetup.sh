#!/bin/sh

while true; do
    read -p "Install homebrew first? (y/n)" yn
    case $yn in
        [Yy]* ) ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"; break;;
        [Nn]* ) break;;
        * ) echo "y or n";;
    esac
done

brew tap phinze/cask

brew install brew-cask
brew install ffmpeg
brew install figlet
brew install gist
brew install gource
brew install hub
brew install imagemagick
brew install mariadb
brew install mongodb
brew install node
brew install tree
brew install wget

# quicklook plugins, these can go to the default cask install dir in /opt
brew cask install betterzipql
brew cask install ipaql
brew cask install qlcolorcode
brew cask install qlprettypatch
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install suspicious-package
brew cask install webp-quicklook

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew cask install adium
brew cask install alfred
brew cask install anki
brew cask install appcleaner
brew cask install arduino
brew cask install atom
brew cask install audacity
brew cask install bartender
brew cask install bettertouchtool
brew cask install caffeine
brew cask install cakebrew
brew cask install cloudup
brew cask install coconutbattery
brew cask install controlplane
brew cask install daisydisk
brew cask install deluge
brew cask install dropbox
brew cask install electrum
brew cask install evernote
brew cask install gitter
brew cask install google-chrome
brew cask install google-drive
brew cask install gpgtools
brew cask install handbrake
brew cask install intellij-idea-ce
brew cask install iterm2
brew cask install keyboardcleantool
brew cask install libreoffice
brew cask install macdown
brew cask install mactex
brew cask install minecraft
brew cask install nvalt
brew cask install onepassword
brew cask install seil
brew cask install sequel-pro
brew cask install sketch
brew cask install skim
brew cask install skype
brew cask install smoothmouse
brew cask install sourcetree
brew cask install spotify
brew cask install steam
brew cask install sublime-text
brew cask install torbrowser
brew cask install transmission
brew cask install transmit
brew cask install virtualbox
brew cask install viscosity
brew cask install vlc
brew cask install xld
brew cask install xmind

brew cask alfred link
brew cask cleanup

# reminders for other stuff not available through brew cask
echo "Don't forget the following:"
echo "Adobe Creative Suite"
echo "Aperture -> MAS"
echo "Day One -> MAS"
echo "Hydra"
echo "iWork -> MAS"
echo "OutBank -> MAS"
echo "Pixelmator -> MAS"
echo "Postman -> Chrome Packaged App"
echo "Reeder -> MAS"
echo "ScreenFlow"
echo "Sunrise Calendar -> MAS"
echo "TexPad -> MAS"
echo "Tweetbot -> MAS"
echo "Vox -> MAS"
echo "Winclone"
echo "Xcode"
