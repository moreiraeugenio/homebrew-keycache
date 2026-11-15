cask "keycache" do
  arch arm: "arm64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "ccb960d37bc1b522270d508982798681152b515c3f49ba1da84a0e568f6d1266",
         intel: "d3992390e1b58f3fb0b412e3da0763347c17f33768a5351c50a3b660bf8952fb"

  url "https://github.com/moreiraeugenio/keycache/releases/download/v#{version}/Keycache-#{version}-#{arch}.dmg"
  name "Keycache"
  desc "Key-value notes in your menu bar"
  homepage "https://github.com/moreiraeugenio/keycache"

  depends_on macos: :big_sur

  app "Keycache.app"

  # Strip com.apple.quarantine so the unsigned app launches without
  # macOS showing "Keycache.app is damaged and can't be opened."
  # Remove once the app ships signed + notarized.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Keycache.app"]
  end

  zap trash: [
    "~/Library/Application Support/Keycache",
    "~/Library/Preferences/com.keycache.app.plist",
    "~/Library/Saved Application State/com.keycache.app.savedState",
  ]
end
