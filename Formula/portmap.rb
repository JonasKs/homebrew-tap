class Portmap < Formula
  desc "Map names to localhost ports. Made for agents and humans."
  homepage "https://github.com/jonasks/portmap"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.2.1/portmap-aarch64-apple-darwin.tar.gz"
      sha256 "c4fd43083d2776977372f4e961a24ae50a5061fe9c6dd591ba0a909b5f717631"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.2.1/portmap-x86_64-apple-darwin.tar.gz"
      sha256 "07e44791074d6ad097d929b9fe98957fa357755652c782c8ea6ab91ba4736555"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.2.1/portmap-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "074ccc68fb7f638e61a79b5dc9400f94b6016c5311c7d5c9c37bcac7bfc04514"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.2.1/portmap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "722cd0e882c8390102417d604cc58093e3dc39f3934db2848481e577e9a756e2"
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

  test do
    assert_match "portmap", shell_output("#{bin}/portmap --help")
  end
end
