class Tele < Formula
  desc "Unofficial Telegram MTProto CLI for agents and humans"
  homepage "https://github.com/ardasevinc/tele"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.0.1/tele_1.0.1_darwin_arm64.tar.gz"
      sha256 "50f575e6907843d879d2c2d6496882503b4fd4f013b5c3f1244924ab59d4e4b8"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.0.1/tele_1.0.1_darwin_amd64.tar.gz"
      sha256 "18fa01a005dd1d41596b6a2ac27bfe517879f4df7cf40fc6a7408ca14cd57092"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.0.1/tele_1.0.1_linux_arm64.tar.gz"
      sha256 "8d2e6e648d2664f8d89f5ca59256f597d818f2dbc0b192944b202bfbe2032e8a"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.0.1/tele_1.0.1_linux_amd64.tar.gz"
      sha256 "da157d581ae95d71b5459c857576e210da427417436ffabf3521c1a2a9a8c493"
    end
  end

  def install
    bin.install "tele"
    pkgshare.install "LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tele --version")
    assert_match "Usage:", shell_output("#{bin}/tele --help")
    assert_path_exists pkgshare/"LICENSE"
  end
end
