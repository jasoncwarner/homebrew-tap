cask "mondo" do
  version "0.5.0"
  sha256 "de56d6c3f54928a3774dc91f3601ae19223c29f74c994f60bae6fc4517b5a2e2"

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
