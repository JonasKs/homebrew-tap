cask "bytt" do
  version "0.2.0"
  sha256 "7eb2a41e247959b62fa9c381b39c9e32d7ce765ef3bbb4f5b2b3726954111575"

  url "https://github.com/jonasks/bytt/releases/download/v#{version}/Bytt-#{version}-aarch64.zip"
  name "bytt"
  desc "Menu bar switcher for several Claude Code accounts"
  homepage "https://github.com/jonasks/bytt"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Bytt.app"
  binary "#{appdir}/Bytt.app/Contents/MacOS/bytt"

  # brew upgrade quits bytt through this and reopens it afterwards.
  uninstall quit: "com.jonas.bytt"

  zap trash: "~/.bytt"

  caveats do
    <<~EOS
      Open bytt from Applications once; it lives in the menu bar and
      opens at login from then on.
    EOS
  end
end
