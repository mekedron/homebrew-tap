cask "hiddenbaricons" do
  version "1.0.0"
  sha256 "2bd8986383701451222b89b9716c4df527391bcf95ea16d2fbbbec86e5f34a01"

  url "https://github.com/mekedron/HiddenBarIcons/releases/download/v#{version}/HiddenBarIcons-#{version}-macOS.dmg"
  name "HiddenBarIcons"
  desc "Reveal menu bar icons hidden under the MacBook notch"
  homepage "https://github.com/mekedron/HiddenBarIcons"

  depends_on macos: ">= :sonoma"

  app "HiddenBarIcons.app"

  zap trash: [
    "~/Library/Application Support/HiddenBarIcons",
    "~/Library/Preferences/com.mekedron.HiddenBarIcons.plist",
  ]
end
