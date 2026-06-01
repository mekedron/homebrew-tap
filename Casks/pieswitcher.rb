cask "pieswitcher" do
  version "1.0.0"
  sha256 "352705a7def183e6525153dfb52cb5d41a52a5e40ff1a73f196db2ad3af5b1ce"

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
