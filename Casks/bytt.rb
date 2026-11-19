cask "bytt" do
  version "0.5.0"
  sha256 "057fa2fb866040bc38050bc4a8ac010e8b92a5c373bddc20446ac2fe6e0c95aa"

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
