cask "clipslop" do
  version "2.0.2"
  sha256 "f06d732dd5da1170bd79c2ed396ecdac8fba2a2233fc4ba430fa56a750802c60"

  url "https://github.com/mekedron/clipslop/releases/download/v#{version}/ClipSlop-#{version}-macOS.dmg"
  name "ClipSlop"
  desc "Keyboard-first AI text pipeline for macOS"
  homepage "https://github.com/mekedron/ClipSlop"

  depends_on macos: ">= :sonoma"

  app "ClipSlop.app"

  zap trash: [
    "~/Library/Application Support/ClipSlop",
    "~/Library/Preferences/com.mekedron.clipslop.plist",
    "~/Library/Preferences/com.clipslop.app.plist",
  ]
end
