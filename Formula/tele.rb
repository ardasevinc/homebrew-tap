class Tele < Formula
  desc "Unofficial Telegram MTProto CLI for agents and humans"
  homepage "https://github.com/ardasevinc/tele"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v0.1.0-alpha.9/tele_0.1.0-alpha.9_darwin_arm64.tar.gz"
      sha256 "25d58d59d9b0a84f5e74411b1829577380a8ad354847b96514761a74c4613a0f"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v0.1.0-alpha.9/tele_0.1.0-alpha.9_darwin_amd64.tar.gz"
      sha256 "df7a7d9abdbf9cec311b8b23a2059027c35e1a9277a76a4104c05964c0b7fe88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v0.1.0-alpha.9/tele_0.1.0-alpha.9_linux_arm64.tar.gz"
      sha256 "dc559444bf940ddd9f7281c628fcb613eacc8ef46f2fcd924bf2d09d304e4716"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v0.1.0-alpha.9/tele_0.1.0-alpha.9_linux_amd64.tar.gz"
      sha256 "dd895622ed788c315a64c928d77b7a425144d9df0682b7e44b7a7429c6dbee80"
    end
  end

  def install
    bin.install "tele"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tele --version")
    assert_match "Usage:", shell_output("#{bin}/tele --help")
  end
end
