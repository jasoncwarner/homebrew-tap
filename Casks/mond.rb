cask "mond" do
  version "0.9.10"
  sha256 "459681b9d30cdffcefb2046c02ca8a7517cc9be50f927e0aa564c12638c9cf4a"

  url "https://raw.githubusercontent.com/jasoncwarner/mondo-releases/main/Mond-#{version}.zip"
  name "Mond"
  desc "Keyboard-first window manager: snap, Desktops, Scenes and Mond Kit"
  homepage "https://github.com/jasoncwarner/mondo-releases"

  livecheck do
    url "https://raw.githubusercontent.com/jasoncwarner/mondo-releases/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :tahoe"

  app "Mond.app"
  # The `mond` command (mond save, mond apply) is Mond's own binary; `mondo` still works.
  binary "#{appdir}/Mond.app/Contents/MacOS/Mond", target: "mond"
  binary "#{appdir}/Mond.app/Contents/MacOS/Mond", target: "mondo"

  zap trash: [
    "~/Library/Application Support/Mond",
    "~/Library/Logs/Mond",
    "~/Library/Caches/com.jasoncwarner.mondo",
    "~/Library/Preferences/com.jasoncwarner.mondo.plist",
  ]
end
