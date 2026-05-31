cask "clipslop" do
  version "2.0.0"
  sha256 "93d6e5e92900c790c620a5b3413351709f19a1dee01384d616f5b82df5325a5d"

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
