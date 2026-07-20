cask "clipslop" do
  version "2.2.0"
  sha256 "3290e05ad49c10820439f0323927990e6399eb11d3c8d1f3a6950e0030a5fc36"

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
