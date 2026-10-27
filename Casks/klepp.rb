cask "klepp" do
  version "0.5.0"
  sha256 "a369588a917e9b40021746b9c655671a4a4a7fdef3dd08a7e8d2090b7b2a2a8b"

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
