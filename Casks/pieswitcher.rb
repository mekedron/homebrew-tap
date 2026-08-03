cask "pieswitcher" do
  version "1.1.7"
  sha256 "384e5cd2a81b229003b314ece7ebe6a691b5d38a950d9d6363cf499ad54e0f7c"

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
