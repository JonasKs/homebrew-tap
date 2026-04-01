class Portmap < Formula
  desc "Map names to localhost ports. Made for agents and humans."
  homepage "https://github.com/jonasks/portmap"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.7.1/portmap-aarch64-apple-darwin.tar.gz"
      sha256 "5558b7c7500e44142c80e6ac03b41f750236b00f94476990364d72a80913a582"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.7.1/portmap-x86_64-apple-darwin.tar.gz"
      sha256 "6e4d31abbf490bde06d03b7a4bf6bd3a86a489a93d6052ce0790b367e4cb7c3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.7.1/portmap-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eae586c873e9e083f668499878184f03e1fc9c293a7fd2e7b017b111a558c258"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.7.1/portmap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "86853be76d469cf6da57835ef55a0f12fa98f825e531669c422117da2dcd36d0"
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
