cask "klepp" do
  version "0.2.0"
  sha256 "e48e33fbf5cf42995dee072dabfd79d9f587ddeb337f1e68b68bd3325ca38fdd"

  url "https://github.com/jonasks/klepp/releases/download/v#{version}/Klepp-#{version}-aarch64.zip"
  name "Klepp"
  desc "Small, glassy clipboard manager for macOS"
  homepage "https://github.com/jonasks/klepp"

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Klepp.app"

  uninstall quit: "com.jonas.klepp"

  zap trash: "~/.klepp"

  caveats do
    <<~EOS
      Auto-paste (⏎) needs Accessibility access for Klepp in
      System Settings → Privacy & Security → Accessibility.
    EOS
  end
end
