class Tele < Formula
  desc "Unofficial Telegram MTProto CLI for agents and humans"
  homepage "https://github.com/ardasevinc/tele"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v0.1.0-alpha.11/tele_0.1.0-alpha.11_darwin_arm64.tar.gz"
      sha256 "dcb2098450bd1e2b721d212344adaacaadfeaa62e10c9d385e881676267f2baa"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v0.1.0-alpha.11/tele_0.1.0-alpha.11_darwin_amd64.tar.gz"
      sha256 "85940d129a05d9cdc087c67e444141aad253ceb734f074827b3c7f1f690e3837"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v0.1.0-alpha.11/tele_0.1.0-alpha.11_linux_arm64.tar.gz"
      sha256 "9979f8720712c401a2178a5a7527d5d339fc05d7cbf52d1495ee17a08f86a6aa"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v0.1.0-alpha.11/tele_0.1.0-alpha.11_linux_amd64.tar.gz"
      sha256 "e0788c3a354969a2e590554ce2a1afb455c29244318a3b07417c0599205aa012"
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
