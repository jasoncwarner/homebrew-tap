cask "mondo" do
  version "0.3.9"
  sha256 "d49bfe4f3e6f2590d4822e2da4f4883804ac44bf56f15873a9497296b92d1dc7"

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
