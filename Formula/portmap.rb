class Portmap < Formula
  desc "Map names to localhost ports. Made for agents and humans."
  homepage "https://github.com/vibber-ai/portmap"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vibber-ai/portmap/releases/download/portmap-v0.8.1/portmap-aarch64-apple-darwin.tar.gz"
      sha256 "41ece423e70c9938275d8e85174aa7b398c012ac942941f581e405aaea70f185"
    end

    on_intel do
      url "https://github.com/vibber-ai/portmap/releases/download/portmap-v0.8.1/portmap-x86_64-apple-darwin.tar.gz"
      sha256 "75120d55ae07e02f22332ab45069627aa82f6e20b3b7310d966c18adc692bdef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vibber-ai/portmap/releases/download/portmap-v0.8.1/portmap-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e2e91357f3305443a418bb426ebc9104f1ee08efb4d6104df19510eb2daf89b"
    end

    on_intel do
      url "https://github.com/vibber-ai/portmap/releases/download/portmap-v0.8.1/portmap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b521ea6b2d3168083d4d83656571ce7295acf998f5a29b89d4d4a905219e9885"
    end
  end

  def install
    bin.install "portmap"
  end

  service do
    run [opt_bin/"portmap", "serve", "--listen", "1337"]
    keep_alive true
    log_path var/"log/portmap.log"
    error_log_path var/"log/portmap.log"
  end

  def caveats
    <<~EOS
      To start portmap as a background service:
        brew services start portmap

      To stop before uninstalling:
        brew services stop portmap
    EOS
  end

  test do
    assert_match "portmap", shell_output("#{bin}/portmap --help")
  end
end
