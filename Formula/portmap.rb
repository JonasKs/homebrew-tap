class Portmap < Formula
  desc "Map names to localhost ports. Made for agents and humans."
  homepage "https://github.com/jonasks/portmap"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.7.0/portmap-aarch64-apple-darwin.tar.gz"
      sha256 "7e02222bdcc68a10f0b487361c367dfbd492e015bd7cc0edae3a564d5ae5b729"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.7.0/portmap-x86_64-apple-darwin.tar.gz"
      sha256 "8437531e2409c32b0965e56c5857b367b25f3e55d7f72a74ad0db0a9679a0c41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.7.0/portmap-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dae69b7275e2fc04750dbf8d2924b015bf4c7cd907b11556c8266807ac6ee847"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.7.0/portmap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f6184703186ea8fcb339e8149b5f8fdfa3fe93219bb46cd64e26f19c9fba557d"
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
