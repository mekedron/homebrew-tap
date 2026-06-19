cask "hiddenbaricons" do
  version "1.0.1"
  sha256 "1d625fdf559231a7f8a5546d796adf4b244b2fc6409711044007354f9981196a"

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
