class Tele < Formula
  desc "Unofficial Telegram MTProto CLI for agents and humans"
  homepage "https://github.com/ardasevinc/tele"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.0/tele_1.2.0_darwin_arm64.tar.gz"
      sha256 "69f6939940124bf232b56f39ee647c240f8eaf3b582b6e6f954d66baef5240d0"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.0/tele_1.2.0_darwin_amd64.tar.gz"
      sha256 "807bdc010b73271d12ff2f12e2309c120e85ce028ec5996d39e1bdd2c57cf190"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.0/tele_1.2.0_linux_arm64.tar.gz"
      sha256 "14dda54645f2b62ac47e4f44956176e5bc1093490f99b78aacbf7d28ad239382"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.0/tele_1.2.0_linux_amd64.tar.gz"
      sha256 "7862175157ff0c45253ededbf857711f2d513d6215f9e918b969902513b12474"
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
