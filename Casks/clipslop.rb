cask "clipslop" do
  version "2.2.1"
  sha256 "567a885905ec7de6d8962407da1f5b6eb16ddabc4f35300c259fd6d0af9ff863"

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
