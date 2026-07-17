class MattermostCli < Formula
  desc "Mattermost CLI for agents and humans"
  homepage "https://github.com/ardasevinc/mattermost-cli"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/mattermost-cli/releases/download/v#{version}/mattermost-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "4d2e1c2841bd9f573ae4751d3c68daa4e7620ad228dbe21841cd85ed88bc9361"
    else
      url "https://github.com/ardasevinc/mattermost-cli/releases/download/v#{version}/mattermost-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "f1be5b05a53d21514ff89bd0296139fe104fc16188f59c5f7f19b7bfa2829793"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ardasevinc/mattermost-cli/releases/download/v#{version}/mattermost-cli_#{version}_linux_arm64.tar.gz"
      sha256 "aeed44ed5511d49f87c8c6b7068185891c037380c892e55bb62972b34487a02b"
    else
      url "https://github.com/ardasevinc/mattermost-cli/releases/download/v#{version}/mattermost-cli_#{version}_linux_amd64.tar.gz"
      sha256 "01ea79cb117425eb0127ea9791981f62d6006a8921a91b5c293defe1488fd6c0"
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
