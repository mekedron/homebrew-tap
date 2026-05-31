cask "clipslop" do
  version "2.0.0"
  sha256 "556bf9e4434c2a308ba78b1715a8f05fff4dc1437e4686deb925d9867a3e8192"

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
