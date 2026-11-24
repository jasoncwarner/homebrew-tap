cask "mond" do
  version "0.9.7"
  sha256 "ee0a9ae666cd8a8faabb5b426d22b6205f2a2703a61b063693a50830b34dcad5"

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
