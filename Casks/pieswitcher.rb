cask "pieswitcher" do
  version "1.1.5"
  sha256 "2e04d500a6fd9dc60636c55b6f9bbb9619cdcd8800ab877962a04070f3e9973a"

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
