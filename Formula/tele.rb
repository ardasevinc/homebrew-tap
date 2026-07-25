class Tele < Formula
  desc "Unofficial Telegram MTProto CLI for agents and humans"
  homepage "https://github.com/ardasevinc/tele"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.1.0/tele_1.1.0_darwin_arm64.tar.gz"
      sha256 "b9073319e11ffff83bc59003b83d9603195bc21cc30945d0ad9e3da76ae50fb6"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.1.0/tele_1.1.0_darwin_amd64.tar.gz"
      sha256 "94bacd96f7f25fcca27efc23ac8106a38fad70414d5379b8778ce26cd55064d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.1.0/tele_1.1.0_linux_arm64.tar.gz"
      sha256 "ac687dbe6dbcf7eb651ffe6927a2d9aa8e6e3adf86e538e6b3108569150a33d7"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.1.0/tele_1.1.0_linux_amd64.tar.gz"
      sha256 "3bcb3b1c99333eb53fcc1127eca483e20531214e7a78e50c1e61043ffa588e9e"
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
