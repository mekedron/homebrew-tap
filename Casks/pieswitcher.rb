cask "pieswitcher" do
  version "1.1.1"
  sha256 "cf53502a8fc5de8f6b2161edb18f1302da65f2cc918ce426a8019fd6d912f736"

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
