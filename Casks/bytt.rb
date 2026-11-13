cask "bytt" do
  version "0.4.0"
  sha256 "6bebd799e263861a0fd1c88ef1f6a8c7a0679cfd96d8c88a1b81ad23e3460090"

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
