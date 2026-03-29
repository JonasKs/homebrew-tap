class Portmap < Formula
  desc "Map names to localhost ports. Made for agents and humans."
  homepage "https://github.com/jonasks/portmap"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.3.0/portmap-aarch64-apple-darwin.tar.gz"
      sha256 "e030ed8926527083d1dfb0ddfdb10d8bafe7b0efb7a8533a4a560637cdf372ef"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.3.0/portmap-x86_64-apple-darwin.tar.gz"
      sha256 "43105df4df0f976fc715324958dc5d7ac630b26098cf28dcfde7ad70855218ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.3.0/portmap-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fefdee30cb66a9c85102934281147e5b2c9af5595512430ad237aab6c686e154"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.3.0/portmap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ffd566a6a0118bde4a1cd89bf8c2347a6b2744b17e41a6e1a742e74988e843e"
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
