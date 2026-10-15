cask "klepp" do
  version "0.4.0"
  sha256 "936b15a0ca7c4eff861f7e55b11ea525e9dddfd6c6b9651104a8e2b4ea83f5ec"

  url "https://github.com/jonasks/klepp/releases/download/v#{version}/Klepp-#{version}-aarch64.zip"
  name "Klepp"
  desc "Small, glassy clipboard manager for macOS"
  homepage "https://github.com/jonasks/klepp"

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Klepp.app"

  # brew upgrade quits Klepp through this and reopens it afterwards.
  uninstall quit: "com.jonas.klepp"

  zap trash: "~/.klepp"

  caveats do
    <<~EOS
      Auto-paste (⏎) needs Accessibility access for Klepp in
      System Settings → Privacy & Security → Accessibility.
    EOS
  end
end
