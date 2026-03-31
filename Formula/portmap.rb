class Portmap < Formula
  desc "Map names to localhost ports. Made for agents and humans."
  homepage "https://github.com/jonasks/portmap"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.6.1/portmap-aarch64-apple-darwin.tar.gz"
      sha256 "5223ac0b492ab47c4caf30b0daf5a73fd4e0557973526ac1bbabb69601af5bf8"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.6.1/portmap-x86_64-apple-darwin.tar.gz"
      sha256 "70a7adaf6aa84616cac3e7ed6a0e1685b3c03739707a85e66ee25c9d477c9244"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.6.1/portmap-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d30770889596e672a926db273969d74da17d87726d6e174e3b5dc95028a1830f"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.6.1/portmap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "93ce013d6289e620f75b2f5c28a65bb1572032033ef407db4f587302fc49b111"
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
