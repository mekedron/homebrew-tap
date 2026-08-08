cask "hiddenbaricons" do
  version "1.1.0"
  sha256 "26894d81d60e880234b5a7ce8b003e8b8f39ff830a04411d559c603e1cabbd6d"

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
