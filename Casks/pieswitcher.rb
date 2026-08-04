cask "pieswitcher" do
  version "1.2.0"
  sha256 "0eeb38c86c7b43f1c4bac6a46c064fc00b4bdde8e07a9fc8140bcca6e7d941c5"

  url "https://github.com/mekedron/PieSwitcher/releases/download/v#{version}/PieSwitcher-#{version}-macOS.dmg"
  name "PieSwitcher"
  desc "Radial pie-menu window switcher for macOS"
  homepage "https://github.com/mekedron/PieSwitcher"

  depends_on macos: ">= :sonoma"

  app "PieSwitcher.app"

  zap trash: [
    "~/Library/Application Support/PieSwitcher",
    "~/Library/Preferences/com.mekedron.PieSwitcher.plist",
  ]
end
