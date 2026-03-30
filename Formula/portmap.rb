class Portmap < Formula
  desc "Map names to localhost ports. Made for agents and humans."
  homepage "https://github.com/jonasks/portmap"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.4.0/portmap-aarch64-apple-darwin.tar.gz"
      sha256 "68fea87a85e932a3585193386d59066b70efe5d2ad509d18c9fe4ec48008ef56"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.4.0/portmap-x86_64-apple-darwin.tar.gz"
      sha256 "c4da5ccff325273111e6208537667a69e75c498c6f459f6fc2b0e13d8b695e3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.4.0/portmap-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3ff6e5fc0e6b16b3ba259d752ae91c149a0e770c5b36f04a94c59b38de984d6"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.4.0/portmap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "97f5ea25db0937f1994e91626f9dcae0e2306781c1bdf68076df2f095a0e92e0"
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
