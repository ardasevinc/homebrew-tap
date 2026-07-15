class Tele < Formula
  desc "Unofficial Telegram MTProto CLI for agents and humans"
  homepage "https://github.com/ardasevinc/tele"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v0.1.0-alpha.10/tele_0.1.0-alpha.10_darwin_arm64.tar.gz"
      sha256 "0c02f985ac42d945765d9e68d7e1db9392ac80c6353e75aab7a54db5f6f7ae21"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v0.1.0-alpha.10/tele_0.1.0-alpha.10_darwin_amd64.tar.gz"
      sha256 "1e2000ef5b414f338bcc8a050cc63d085bb7c30ed81eaaaac3e3b16362be4a4d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v0.1.0-alpha.10/tele_0.1.0-alpha.10_linux_arm64.tar.gz"
      sha256 "38c532c575bf0a24e139e0ffa7a5da8cc7c5ddcf4b893f2fb6582d9c30fa81c3"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v0.1.0-alpha.10/tele_0.1.0-alpha.10_linux_amd64.tar.gz"
      sha256 "10f44155a85140ef4fd1fdc1cd7a096b1e3bc268db1ce4c0815c6ad533ba41a9"
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
