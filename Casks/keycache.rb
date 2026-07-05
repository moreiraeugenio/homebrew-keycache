cask "keycache" do
  arch arm: "arm64", intel: "x64"

  version "0.4.1"
  sha256 arm:   "2fe3c95e02cbc5ee7c6d5d2d2f77f8cced30859bc75d4ce1081ae9c87d42285c",
         intel: "49e2479bc504c2fc4f8604fa2dd2a7c5f987f78ab96113efae7361934a300965"

  url "https://github.com/moreiraeugenio/keycache/releases/download/v#{version}/Keycache-#{version}-#{arch}.dmg"
  name "Keycache"
  desc "Key-value notes in your menu bar"
  homepage "https://github.com/moreiraeugenio/keycache"

  depends_on macos: :big_sur

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
