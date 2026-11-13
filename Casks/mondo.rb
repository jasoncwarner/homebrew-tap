cask "mondo" do
  version "0.4.9"
  sha256 "d9429062f5eeb62709f702d4a5d5ee4eab3fc71b4fb9bc3b615f4b6e3490cd2f"

  url "https://raw.githubusercontent.com/jasoncwarner/mondo-releases/main/Mondo-#{version}.zip"
  name "Mondo"
  desc "Keyboard-first window manager: snap, Desktops, Scenes and Mondo Kit"
  homepage "https://github.com/jasoncwarner/mondo-releases"

  livecheck do
    url "https://raw.githubusercontent.com/jasoncwarner/mondo-releases/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :tahoe"

  app "Mondo.app"
  # The `mondo` command (mondo save, mondo apply) is Mondo's own binary.
  binary "#{appdir}/Mondo.app/Contents/MacOS/Mondo", target: "mondo"

  zap trash: [
    "~/Library/Application Support/Mondo",
    "~/Library/Caches/com.jasoncwarner.mondo",
    "~/Library/Preferences/com.jasoncwarner.mondo.plist",
  ]
end
