cask "klepp" do
  version "0.2.1"
  sha256 "23119ac4e5b97c65f1b1f2e1803d80c51b6167fd5ad176f684c7d950b45f94e4"

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
