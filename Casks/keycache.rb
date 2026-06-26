cask "keycache" do
  arch arm: "arm64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "3fc0f0712659924988b52bec47f4f7b7f343718a8943b078236e4e1493670231",
         intel: "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/moreiraeugenio/keycache/releases/download/v#{version}/Keycache-#{version}-#{arch}.dmg"
  name "Keycache"
  desc "Key-value notes in your menu bar"
  homepage "https://github.com/moreiraeugenio/keycache"

  depends_on macos: ">= :big_sur"

  app "Keycache.app"

  zap trash: [
    "~/Library/Application Support/Keycache",
    "~/Library/Preferences/com.keycache.app.plist",
    "~/Library/Saved Application State/com.keycache.app.savedState",
  ]
end
