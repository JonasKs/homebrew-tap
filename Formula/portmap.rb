class Portmap < Formula
  desc "Map names to localhost ports. Made for agents and humans."
  homepage "https://github.com/jonasks/portmap"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.3.2/portmap-aarch64-apple-darwin.tar.gz"
      sha256 "7e14c431aec0f07788145e7e1741160afdd18ebe9dc3b6f55e52c7774e76e57d"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.3.2/portmap-x86_64-apple-darwin.tar.gz"
      sha256 "f9fd2e1bd45e8ac3ac257ff1a27cac7c9b26bb71b34e8e511e0505997db31c81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.3.2/portmap-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "812abce023c2a6231edbebbd28462f6c668228076e48af37f003f9b1f59e757b"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.3.2/portmap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8336f91e45806285340c346b8ea11b96af9141b95ac751736d7165892557ef18"
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
