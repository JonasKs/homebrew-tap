cask "klepp" do
  version "0.1.0"
  sha256 "8dc4259cb3df1a466b730c3c2956691e4134f12d8ab0c2be2e6723b4d5395c97"

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
      Klepp is ad-hoc signed, not notarized. If macOS refuses to open it:
        xattr -dr com.apple.quarantine /Applications/Klepp.app

      Auto-paste (⏎) needs Accessibility access for Klepp in
      System Settings → Privacy & Security → Accessibility.
    EOS
  end
end
