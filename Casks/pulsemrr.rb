cask "pulsemrr" do
  version "0.9.3"
  sha256 "57bf2253bdadd15eeeae67998ff94eb209e49394b387ca84f8eccecdf1d020b4"

  url "https://github.com/benjaminb10/pulsemrr/releases/download/v#{version}/PulseMRR.dmg"
  name "PulseMRR"
  desc "Native notification for every Stripe sale, with an MRR dashboard across accounts"
  homepage "https://github.com/benjaminb10/pulsemrr"

  livecheck do
    url "https://raw.githubusercontent.com/benjaminb10/pulsemrr/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "PulseMRR.app"

  uninstall quit: "app.pulsemrr"

  zap trash: [
    "~/Library/Application Support/PulseMRR",
    "~/Library/Caches/app.pulsemrr",
    "~/Library/HTTPStorages/app.pulsemrr",
    "~/Library/Preferences/app.pulsemrr.plist",
  ]
end
