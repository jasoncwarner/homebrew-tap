cask "mond" do
  version "0.9.0"
  sha256 "5e7b2fcdb997eb0069c6079ec8ffa1b9679d998e93f51c08a744150d425c7706"

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
