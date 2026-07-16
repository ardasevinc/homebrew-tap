class Tele < Formula
  desc "Unofficial Telegram MTProto CLI for agents and humans"
  homepage "https://github.com/ardasevinc/tele"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.0.2/tele_1.0.2_darwin_arm64.tar.gz"
      sha256 "76f03cb5a7bdef8815944c2a5514fb2423cb477bb7aac323007f9e643b4ee8d8"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.0.2/tele_1.0.2_darwin_amd64.tar.gz"
      sha256 "908735cfeb61dc6d87177dd9066ca57eb421b40e0090f78c10274a831f180840"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.0.2/tele_1.0.2_linux_arm64.tar.gz"
      sha256 "b27dba22163ae8b61e950c6059dc42e3e6fe98d3a662e941dca3c8c54f1caace"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.0.2/tele_1.0.2_linux_amd64.tar.gz"
      sha256 "17f3add0f6c2067bff03c6e93bcf96bd9f3ccfe17d2b73c84a4ff3b836eb1e31"
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
