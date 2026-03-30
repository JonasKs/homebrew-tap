class Portmap < Formula
  desc "Map names to localhost ports. Made for agents and humans."
  homepage "https://github.com/jonasks/portmap"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.5.0/portmap-aarch64-apple-darwin.tar.gz"
      sha256 "25756bc65afaf689a79bf18a690681303ac699f9eefbbb900f6c2864acfb3dc2"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.5.0/portmap-x86_64-apple-darwin.tar.gz"
      sha256 "9bbad1ede39920d17e9990e376e7aaf76edab3219890f34ba8fb22a4fe6df4d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.5.0/portmap-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e98f3f7308a40df639ba903be915cffdfe11a0efbbcc88c9b0188dccfc28534"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.5.0/portmap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "752527f9d12c89c92a6134e88093108582e202a3202723d3bc0f5d598b1ba4ad"
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
