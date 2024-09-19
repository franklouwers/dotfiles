#!/usr/bin/env bash
#
# inspiration from https://github.com/SixArm/macos-defaults/blob/main/macos-defaults
# and https://macos-defaults.com/#🙋-what-s-a-defaults-command
# and https://github.com/Lissy93/dotfiles/tree/master/scripts/macos-setup
#
COMPUTER_NAME=tembo

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

############### Finder
#
## Finder

# Show all files.
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Empty the trash securely by default (commented out because it's slow).
#defaults write com.apple.finder EmptyTrashSecurely -bool true

# Disable the warning when changing a file extension.
#defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Always open everything in Finder's list view
# Unless folder has a custom setting!
# clmv: column view
# Nlsv: list view
# glyv: Gallery view
# icnv: icon view (default)
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Allow selection of text in quicklook windows.
defaults write com.apple.finder QLEnableTextSelection -bool true

# Enable quitting via ⌘ + Q; doing so will also hide desktop icons
# "Behaves strangely when activated"
#defaults write com.apple.finder QuitMenuItem -bool true

# Show status bar.
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar.
defaults write com.apple.finder ShowPathbar -bool true

# Disable warning when the user does empty trash.
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Folders on top!
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

# Empty bin after 30d
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"

# Maybe we don't want real files on the Desktop?
#defaults write com.apple.finder "CreateDesktop" -bool "false"

# "Show item info"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

# "Enable snap-to-grid for icons on the desktop and finder"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# "Set grid spacing for icons on the desktop and finder"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# "Set icon size on desktop and in finder"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist


##### SAFARI
#

# Show full URL. Yes. Always.
defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "true" && killall Safari

# DuckDuckGo for search
defaults write com.apple.Safari "SearchProviderShortName" -string "DuckDuckGo"

# Disable universal search because we prefer privacy
defaults write com.apple.Safari UniversalSearchEnabled -bool false

# "Hide sidebar"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Suppress search suggestions because we prefer privacy
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Don't open "safe" downloads i.e. don't open files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# No favorites bar
defaults write com.apple.Safari ShowFavoritesBar -bool false

# status bar
defaults write com.apple.Safari ShowOverlayStatusBar -int 1

# homepage
defaults write com.apple.Safari HomePage -string "about:blank"

# Disable snapshots i.e. don't use thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Developers menu
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
#defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# search defaults to "include"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false


# enable spell check
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true

# disable autocorrect
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Enable AutoFill, except for passwords and CC (1P)
defaults write com.apple.Safari AutoFillFromAddressBook -bool true
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool true

# fraud warnings
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# "Prevent pop-ups"
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# "Dissallow auto-play"
defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false

# "Use Do not Track header"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# "Auto-update Extensions"
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true


#### Apple Mail
# "Copy only email address, not name"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# "Use ⌘ + Enter shortcut to quick send emails"
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

# "Display messages in thread mode"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"

# "Sort messages by date"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# "Sort by newest to oldest"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"

# No sounds for new mails / sending mail / ...
default write com.apple.mail NewMessagesSoundName -string ""
default write com.apple.mail NewMessagesSoundName PlayMailSounds -int 0

# Larger fonts (yes, showing my age)
default write com.apple.mail NSFont -string "HelveticaNeue"
default write com.apple.mail NSFontSize -int 14



####### Terminal
# Only use UTF-8 in Terminal.app.
defaults write com.apple.terminal StringEncodings -array 4

# "Enable secure entry for Terminal"
defaults write com.apple.terminal SecureKeyboardEntry -bool true

##### Time Machine
# Don't offer new disks for TM
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"

###########################
## Software Update / App Store

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Automatically download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

#########################
## Photos
# "Prevent Photos from opening automatically when devices are plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true


#### Transmission
# "Store incomplete downloads in the Downloads/torrents dir"
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Torrents"

# "Store completed downloads in Downloads directory"
defaults write org.m0k.transmission DownloadLocationConstant -bool true

# "Dont prompt for confirmation before downloading"
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false

# "No confirmation before removing non-downloading transfers"
defaults write org.m0k.transmission CheckRemoveDownloading -bool true

# "Trash original torrents"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# "Hide the donate message"
defaults write org.m0k.transmission WarningDonate -bool false

# "Hide the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false

# "Set IP blocklists"
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true

# "Randomize port on launch"
defaults write org.m0k.transmission RandomPort -bool true


############ Global settings
# Computer name
sudo scutil --set ComputerName "$COMPUTER_NAME"
# Remote hostname
sudo scutil --set HostName "$COMPUTER_NAME"
# Local hostname
sudo scutil --set LocalHostName "$COMPUTER_NAME"
# SMB hostname
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"

############## Local prefs
# Language to English (likely American English)
defaults write NSGlobalDomain AppleLanguages -array "en"
# Locale to English, Belgium, Euro
defaults write NSGlobalDomain AppleLocale -string "en_BE@currency=EUR"
# Timezone to Brussels
sudo systemsetup -settimezone "Europe/Brussels" > /dev/null

####### UI settings
# highlight color
defaults write NSGlobalDomain AppleHighlightColor -string "0.698039 0.843137 1.000000" # blue
# Enable subpixel font rendering on non-Apple LCDs.
defaults write NSGlobalDomain AppleFontSmoothing -int 2


######## File locations
# screenshots in Downloads and png format
defaults write com.apple.screencapture "location" -string "~/Downloads"
defaults write com.apple.screencapture type -string "png"

######## Opening files, dialog boxes, ....
# Always show scrollbars.
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# "Set sidebar icon size to medium"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# "Set toolbar title rollover delay"
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

# "Set increased window resize speed"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.01

# "Set file save dialog to expand to all files by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# "Set print dialog to expand to show all by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# "Set files to save to disk, not iCloud by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# "Set printer app to quit once job is completed"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# "Disables the app opening confirmation dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

# "Remove duplicates in the Open With menu"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister \
-kill -r -domain local -domain system -domain user


#####################################
# System Power, Resuming, Lock, etc #
#####################################
# "Require password immediately after sleep or screensaver"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5 # 5 secs

# "Disable system wide resuming of windows"
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

##### Typing
# "Disable automatic text capitalization"
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# "Disable automatic dash substitution"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# "Disable automatic periord substitution"
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# "Disable automatic quote substitution"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# "Disable automatic spell correction"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# tap to click trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

#Enable tab to click for current user"
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable tab to click for login screen
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# ##############################
# Spotlight Search Preferences #
# ##############################
# "Spotlight and Search"

# Emable / disable search locations, and indexing order
# "Set Spotlight Search Locations Order"
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 0;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "DOCUMENTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}' \
	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
	'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

# Spotlight - load new settings, enable indexing, and rebuild index
# "Refreshing Spotlight"
killall mds > /dev/null 2>&1
sudo mdutil -i on / > /dev/null
sudo mdutil -E / > /dev/null

########### DOCK
# ## Dock

# Move Dock to the left side of the screen
defaults write com.apple.dock "orientation" -string "left"

# Set Icon size in the Dock to small:
defaults write com.apple.dock "tilesize" -int "24"

# Make Dock icons of hidden applications translucent.
defaults write com.apple.dock showhidden -bool true

# Show indicator lights for open applications in the Dock.
defaults write com.apple.dock show-process-indicators -bool true

# Set animation to scale (default: genie)
defaults write com.apple.dock "mineffect" -string "scale"

# Remove the auto-hiding Dock delay. (Default: 0.5)
defaults write com.apple.Dock autohide-delay -float 0

# Automatically hide and show the Dock.
defaults write com.apple.dock autohide -bool true

# Disable expose animation.
defaults write com.apple.dock expose-animation-duration -float 0

# scroll on dock item to open expose for only that app's windows
defaults write com.apple.dock scroll-to-open -bool true

### Mission Control (falls under Dock)
#
## Group windows by application in mission control
defaults write com.apple.dock "expose-group-apps" -bool "true"

# remove default apps from the Dock
defaults write com.apple.dock persistent-apps -array

# If DockUtil installed, then use it to remove default dock items, and add useful ones
if hash dockutil 2> /dev/null; then
  apps_to_remove_from_dock=(
    'App Store' 'Contacts' 'FaceTime'
    'Keynote' 'Maps' 'Music'
    'News' 'Notes' 'Numbers'
    'Pages' 'Photos' 'Podcasts'
    'Reminders' 'TV'
  )
  apps_to_add_to_dock=(
    'iTerm' 'Safari' 'Firefox' 'Slack' 'Notion'
  )
  system_apps_to_add_to_dock=(
    'Messages' 'Mail' 'Calendar'
  )
  IFS=""
  # Removes useless apps from dock
  for app in ${apps_to_remove_from_dock[@]}; do
    dockutil --remove ${app}.app
  done
  # Adds useful apps to dock, if installed
  for app in ${apps_to_add_to_dock[@]}; do
    if [[ -d "/Applications/${app}.app" ]]; then
      dockutil --add /Applications/${app}.app
    fi
  done
  # Adds useful system apps to dock, if installed
  for app in ${system_apps_to_add_to_dock[@]}; do
    if [[ -d "/System/Applications/${app}.app" ]]; then
      dockutil --add /System/Applications/${app}.app
    fi
  done
fi

# Restarting Dock
killall Dock

# Avoid creating .DS_Store files on network volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#### SIRI be gone

# disable ask siri
defaults write com.apple.assistant.support 'Assistant Enabled' -bool false

launchctl disable "user/$UID/com.apple.assistantd"
launchctl disable "gui/$UID/com.apple.assistantd"
sudo launchctl disable 'system/com.apple.assistantd'
launchctl disable "user/$UID/com.apple.Siri.agent"
launchctl disable "gui/$UID/com.apple.Siri.agent"
sudo launchctl disable 'system/com.apple.Siri.agent'
if [ $(/usr/bin/csrutil status | awk '/status/ {print $5}' | sed 's/\.$//') = "enabled" ]; then
    >&2 echo 'This script requires SIP to be disabled. Read more: \
    https://developer.apple.com/documentation/security/disabling_and_enabling_system_integrity_protection'
fi

# disable ask siri enabling popup
defaults write com.apple.SetupAssistant 'DidSeeSiriSetup' -bool True

# disable siri from the menu bar
defaults write com.apple.systemuiserver 'NSStatusItem Visible Siri' 0

# opt out of siri data collection
defaults write com.apple.assistant.support 'Siri Data Sharing Opt-In Status' -int 2

#### Firewall
# Don't allow signed apps to allow inbound connections
sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool false
sudo defaults write /Library/Preferences/com.apple.alf allowdownloadsignedenabled -bool false

# Make sure the firewall is on
/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo defaults write /Library/Preferences/com.apple.alf globalstate -bool true
defaults write com.apple.security.firewall EnableFirewall -bool true

# stealth mode
/usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true
defaults write com.apple.security.firewall EnableStealthMode -bool true

# ask for network connections
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off

# Sending hangup command to socketfilterfw is required for changes to take effect
# "Restarting socket filter firewall"
sudo pkill -HUP socketfilterfw


###### Users
# don't allow guest logins
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool NO

# don't allow guest SMB access and File Server
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO
sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
echo 'yes' | sudo systemsetup -setremotelogin off
sudo launchctl disable 'system/com.apple.tftpd'


####### MENU item
# No seconds in menu clock
defaults write com.apple.menuextra.clock ShowSeconds -bool "false"

## Flags

# Show the ~/Library folder.
chflags nohidden ~/Library

for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
