class Portmap < Formula
  desc "Map names to localhost ports. Made for agents and humans."
  homepage "https://github.com/jonasks/portmap"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.5.1/portmap-aarch64-apple-darwin.tar.gz"
      sha256 "29040af1c419a0c5b25bae05f0df3253d61a9bade32ace2c9d488f69186ddcf2"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.5.1/portmap-x86_64-apple-darwin.tar.gz"
      sha256 "b544343cb01118fef70ac3cf1e3b9aa9efaad1a706967454260c8c1a076e2389"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.5.1/portmap-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4985b4c283616c8cc30950243d00dd3062ab659e8fc87cd1636dea427cfd5c82"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.5.1/portmap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "996f35ee991d24cb37d679c23501768d84f8eb9cb81c055add26e958a4465d37"
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
