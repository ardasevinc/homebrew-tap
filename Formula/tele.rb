class Tele < Formula
  desc "Unofficial Telegram MTProto CLI for agents and humans"
  homepage "https://github.com/ardasevinc/tele"
  # Required because Homebrew otherwise parses the trailing arm64/amd64 token.
  version "1.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.3/tele_1.2.3_darwin_arm64.tar.gz"
      sha256 "e6c3786a3e4558ea2de33143e6dffc0e3af5fd2ea1481c337c6d0e1a8b2e7ac3"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.3/tele_1.2.3_darwin_amd64.tar.gz"
      sha256 "17c4fa234c4d689c17c5972bcc782b6aefe0ecd8ef0905dcd350e76684db3190"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.3/tele_1.2.3_linux_arm64.tar.gz"
      sha256 "f58935f530073c1a2639fc265ee6afe8fa0e056fc44d7dd39fbb307f6fd7c8a7"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.3/tele_1.2.3_linux_amd64.tar.gz"
      sha256 "4b2ffebdd35d3ffc4958ca0d32496e4eb3745fa079f060d0fd01fc820967460e"
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
