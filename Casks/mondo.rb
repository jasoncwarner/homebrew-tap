cask "mondo" do
  version "0.3.5"
  sha256 "4216fb910b9dc21a8662dc7376caf88117d1d79d54956b9f0cebe37c7a3955b2"

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
