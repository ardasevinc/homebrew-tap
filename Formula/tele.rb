class Tele < Formula
  desc "Unofficial Telegram MTProto CLI for agents and humans"
  homepage "https://github.com/ardasevinc/tele"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.2/tele_1.2.2_darwin_arm64.tar.gz"
      sha256 "d6964bf5236ff661cebd1563867e627be5d4347a883686b7f42f0f2b6fe3f761"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.2/tele_1.2.2_darwin_amd64.tar.gz"
      sha256 "2479ef75f94b1423f7dc14803b99ca0e4d290444c6836a7e91b315dbe6df5cbb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.2/tele_1.2.2_linux_arm64.tar.gz"
      sha256 "3501e48bf6f119125c9910d6f76e5928a893db24c6ae1bcfdbc99c1ce687d8e9"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.2/tele_1.2.2_linux_amd64.tar.gz"
      sha256 "a4ed5296775a782faae8074d63321ba24bff6c2b9c4ae6fa297cf26dce5ce974"
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
