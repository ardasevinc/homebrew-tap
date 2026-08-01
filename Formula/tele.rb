class Tele < Formula
  desc "Unofficial Telegram MTProto CLI for agents and humans"
  homepage "https://github.com/ardasevinc/tele"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.1/tele_1.2.1_darwin_arm64.tar.gz"
      sha256 "9d2196c0bd21f562d33841cd8c2a7b59196e51a59667bbf5f0f8223fd6486145"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.1/tele_1.2.1_darwin_amd64.tar.gz"
      sha256 "8dcb63ec75f8c5b09518c6c9125fc01ce6e118da14f4c2386d8ede0eb2b5d9d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.1/tele_1.2.1_linux_arm64.tar.gz"
      sha256 "11d6854072ca8ccd4978168e7c77a6cab909f91c49146ef20c93f3ba782e9df1"
    else
      url "https://github.com/ardasevinc/tele/releases/download/v1.2.1/tele_1.2.1_linux_amd64.tar.gz"
      sha256 "57bbe940fb09d2e0d418515806e2034aa9b3c27af2c8f4e7935cfc65aafe00cf"
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
