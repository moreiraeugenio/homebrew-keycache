cask "keycache" do
  arch arm: "arm64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "fad0b7cc5ee9fa771b97004c871ffdae55efd2e2c694f3312c945b16430df868",
         intel: "3b7169b4767ecf0406859e066c9a3850cde2fd60dfd585c1a04a09cc2485581f"

  url "https://github.com/moreiraeugenio/keycache/releases/download/v#{version}/Keycache-#{version}-#{arch}.dmg"
  name "Keycache"
  desc "Key-value notes in your menu bar"
  homepage "https://github.com/moreiraeugenio/keycache"

  depends_on macos: ">= :big_sur"

  app "Keycache.app"

  # Strip com.apple.quarantine so the unsigned app launches without
  # macOS showing "Keycache.app is damaged and can't be opened."
  # Remove once the app ships signed + notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Keycache.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Keycache",
    "~/Library/Preferences/com.keycache.app.plist",
    "~/Library/Saved Application State/com.keycache.app.savedState",
  ]
end
