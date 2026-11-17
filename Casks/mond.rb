cask "mond" do
  version "0.7.0"
  sha256 "4395df913726d82efc62e6a79f82a94d23cf1c147bd6bfcea43ce8e3dd5080e0"

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
