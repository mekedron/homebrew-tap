cask "clipslop" do
  version "1.3.0"
  sha256 "2d93d51de03b9e5647d648fd09aeb79b2feeb4caccf21ca076ffe6de2ccca284"

  url "https://github.com/mekedron/clipslop/releases/download/v#{version}/ClipSlop-#{version}-macOS.dmg"
  name "ClipSlop"
  desc "Keyboard-first AI text pipeline for macOS"
  homepage "https://github.com/mekedron/ClipSlop"

  depends_on macos: ">= :sonoma"

  app "ClipSlop.app"

  zap trash: [
    "~/Library/Application Support/ClipSlop",
    "~/Library/Preferences/com.clipslop.app.plist",
  ]
end
