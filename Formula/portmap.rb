class Portmap < Formula
  desc "Map names to localhost ports. Made for agents and humans."
  homepage "https://github.com/jonasks/portmap"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.3.1/portmap-aarch64-apple-darwin.tar.gz"
      sha256 "258b466f07b3b62573bac1b0b7c751c65633538bb97ed83e63043fde9f2e17f5"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.3.1/portmap-x86_64-apple-darwin.tar.gz"
      sha256 "fce7167027463104103120f5cf08e97584fc62cc705c7e87e6051227575489ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.3.1/portmap-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f723bded44352da0ec0561370b3943dc61542f85f2f82669d715cb8cc0b6c7c0"
    end

    on_intel do
      url "https://github.com/jonasks/portmap/releases/download/portmap-v0.3.1/portmap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a37203ecfb3c4a2b7e13b8ae35f777862809016a9330af24378b9f4cd5c70781"
    end
  end

  def install
    bin.install "portmap"
  end

  def uninstall_preflight
    system bin/"portmap", "uninstall"
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
