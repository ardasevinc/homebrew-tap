class MattermostCli < Formula
  desc "Mattermost CLI for agents and humans"
  homepage "https://github.com/ardasevinc/mattermost-cli"
  version "2.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/mattermost-cli/releases/download/v#{version}/mattermost-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "d396a75ff61e6b1769834625eec7602a6e06a25d4ffb9abd46a264e435d75fbd"
    else
      url "https://github.com/ardasevinc/mattermost-cli/releases/download/v#{version}/mattermost-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "27e29fd7bcdc788d645dde948a3d414f22d9f09acc36dde5be9886862ca3f594"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/mattermost-cli/releases/download/v#{version}/mattermost-cli_#{version}_linux_arm64.tar.gz"
      sha256 "ceaeb3a356bdf554b98ccdc753bfa2cbd8295d1a09ecd21d1d64e59537917a9b"
    else
      url "https://github.com/ardasevinc/mattermost-cli/releases/download/v#{version}/mattermost-cli_#{version}_linux_amd64.tar.gz"
      sha256 "360f705b7d2e62c08b93f5959082ca9de37a93d52b38025f1c4667a65078f45b"
    end
  end

  def install
    bin.install "mm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mm --version")
    assert_match "Mattermost CLI", shell_output("#{bin}/mm --help")
  end
end
