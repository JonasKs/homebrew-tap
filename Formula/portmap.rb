class Portmap < Formula
  desc "Map names to localhost ports. Made for agents and humans."
  homepage "https://github.com/jonasks/portmap"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.8.0/portmap-aarch64-apple-darwin.tar.gz"
      sha256 "754d952c34d8434f0e3951509ce09b9a8531a36cdf9f6b6cbef40e204c0e3009"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.8.0/portmap-x86_64-apple-darwin.tar.gz"
      sha256 "4c9648083d173794f57e24df475d36e13550ea1359d36ea403c20fd2c1ea030f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.8.0/portmap-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc416eddfc6dd89c81cb234de543c118878d232d9db15107a59b37e0836a1a84"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.8.0/portmap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2010fe9944b652a3ae12fdc535ace5b6e4353c8fd766ce0081835c84e6ca08ff"
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
