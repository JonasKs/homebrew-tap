cask "bytt" do
  version "0.1.0"
  sha256 "8942a1cde68123f28d485f699bed3f8e01398bf3cd1b923fb1a407186d436cfe"

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
