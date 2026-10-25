cask "pulsemrr" do
  version "0.9.15"
  sha256 "a8c6d1ab49a65f87bddc1d8e42e463824150ab0b3855791fa5d70be7d6c2434d"

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
